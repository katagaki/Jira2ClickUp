import PlaygroundSupport
import UIKit

let jiraProjectsToLoad: [String] = ["ABCD", "EFGH"]
var jiraProjects: [String:JiraProject] = [:]
var jiraIssues: [String:[JiraIssue]] = [:]
var clickUpTeams: [ClickUpTeam] = []
var clickUpSpaces: [String:[ClickUpSpace]] = [:]
var clickUpFolders: [String:[ClickUpFolder]] = [:]
var clickUpLists: [String:[ClickUpList]] = [:]
var clickUpTasks: [String:[ClickUpTask]] = [:] // TODO: Process ClickUp tasks

Task {
    do {
        
        // ClickUp: Get all available information
//        clickUpTeams = try await getClickUpTeams()
//        for team: ClickUpTeam in clickUpTeams {
//            print("Processing ClickUp team \(team.id)")
//            let spaces = try await getClickUpSpaces(for: team.id)
//            clickUpSpaces.updateValue(spaces, forKey: team.id)
//            for space: ClickUpSpace in spaces {
//                print("Processing ClickUp space \(space.id)")
//                let folders = try await getClickUpFolders(for: space.id)
//                clickUpFolders.updateValue(folders, forKey: space.id)
//                for folder: ClickUpFolder in folders {
//                    print("Processing ClickUp folder \(folder.id)")
//                    let lists = try await getClickUpLists(for: folder.id)
//                    clickUpLists.updateValue(lists, forKey: folder.id)
//                    print("Found \(lists.count) ClickUp lists in ClickUp folder \(folder.id)")
//                }
//            }
//        }
        
        // Jira: Get projects to be loaded
//        for projectId: String in jiraProjectsToLoad {
//            let project = try await getJiraProject(projectId)
//            jiraProjects.updateValue(project, forKey: projectId)
//            let queryResult = try await getJiraIssues(projectId, startingFromIndex: 0)
//            jiraIssues.updateValue(queryResult.issues, forKey: projectId)
//        }
        
        // Get ticket object from Jira, then create a new task in ClickUp
        let jiraIssue: JiraIssue = try await getJiraIssue("ABCD-1234")
        let startDate: String = clickUpCompatibleDate(from: date(fromISO8601: jiraIssue.fields.created ?? ""))
        let dueDate: String = clickUpCompatibleDate(from: date(fromISO8601: jiraIssue.fields.duedate ?? ""))
        let taskContent: String =
        """
        {
          "name": "\(jiraIssue.fields.summary) \(Date().timeIntervalSince1970)",
          "markdown_description": "# Heading 1\\nThis task has formatting.\\n#### ✅ **Green banner**\\nThis is the last paragraph of the ticket.\\n\\n/table\\n",
          "assignees": [],
          "tags": [],
          "status": "TO DO",
          "priority": \(Int(jiraIssue.fields.priority.id)! < 1 ? "0" : String(Int(jiraIssue.fields.priority.id)! - 1)),
          "due_date": \(dueDate),
          "due_date_time": false,
          "time_estimate": 0,
          "start_date": \(startDate),
          "start_date_time": false,
          "notify_all": false,
          "parent": null,
          "links_to": null,
          "check_required_custom_fields": false
        }
        """
        let taskCreationResult = try await createClickUpTask(in: "10000ABCD", with: taskContent) // Test Tube list
        print(String(data: taskCreationResult, encoding: .utf8)!.prettyPrinted()!)
            
    } catch let DecodingError.dataCorrupted(context) {
        print("Error while decoding an object: \(context.debugDescription)\n" +
            "Coding Path: \(context.codingPath.description)\n" +
            "Underlying Error: \(context.underlyingError?.localizedDescription ?? "(none)")")
    } catch let DecodingError.keyNotFound(key, context) {
        print("Error while decoding an object: \(context.debugDescription)\n" +
            "Key: \(key)\nCoding Path: \(context.codingPath.description)")
    } catch let DecodingError.valueNotFound(value, context) {
        print("Error while decoding an object: \(context.debugDescription)\n" +
            "Value: \(value)\nCoding Path: \(context.codingPath.description)")
    } catch let DecodingError.typeMismatch(type, context)  {
        print("Error while decoding an object: \(context.debugDescription)\n" +
            "Type: \(type)\nCoding Path: \(context.codingPath.description)")
    } catch {
        print("Error while decoding an object: \(error.localizedDescription)")
    }
}

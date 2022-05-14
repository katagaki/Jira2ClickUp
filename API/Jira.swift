import Foundation

let jiraInstance: String = "xxxxx.atlassian.net"
let atlassianAPIKey: String = "<YOUR_ATLASSIAN_KEY_HERE>"
let authorizationString: String = "<YOUR_USERNAME_HERE>:\(atlassianAPIKey)"
let authorizationEncodedString: String = authorizationString.toBase64()

public func getJiraIssue(_ issueKey: String) async throws -> JiraIssue {
    let request = urlRequest(method: "GET",
                             url: "https://\(jiraInstance)/rest/api/3/issue/\(issueKey)",
                             auth: "Basic \(authorizationEncodedString)")
    let (data, _) = try await URLSession.shared.data(for: request)
    print(String(data: data, encoding: .utf8)!.prettyPrinted()!)
    return try JSONDecoder().decode(JiraIssue.self, from: data)
}


public func getJiraProject(_ projectKey: String) async throws -> JiraProject {
    let request = urlRequest(method: "GET",
                             url: "https://\(jiraInstance)/rest/api/3/project/\(projectKey)",
                             auth: "Basic \(authorizationEncodedString)")
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder().decode(JiraProject.self, from: data)
}

public func getJiraIssues(_ projectKey: String, startingFromIndex: Int = 0) async throws -> JiraQueryResult {
    let request = urlRequest(method: "GET",
                             url: "https://\(jiraInstance)/rest/api/3/search?jql=project%20%3D%20%22\(projectKey)%22%20ORDER%20BY%20created%20ASC&maxResults=100&startAt=\(startingFromIndex)",
                             auth: "Basic \(authorizationEncodedString)")
    print("Getting Jira query results from index \(startingFromIndex) (project: \(projectKey))")
    let (data, _) = try await URLSession.shared.data(for: request)
    var result = try JSONDecoder().decode(JiraQueryResult.self, from: data)
    if result.issues.count > 0 {
        let newResult = try await getJiraIssues(projectKey, startingFromIndex: startingFromIndex + 100)
        result.issues.append(contentsOf: newResult.issues)
    }
    return result
}

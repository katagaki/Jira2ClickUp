import Foundation

let clickUpPersonalToken: String = "<YOUR_PERSONAL_TOKEN_HERE>"

public func createClickUpTask(in listId: String, with content: String) async throws -> Data {
    var request = urlRequest(method: "POST",
                             url: "https://api.clickup.com/api/v2/list/\(listId)/task",
                             auth: clickUpPersonalToken)
    request.httpBody = content.data(using: .utf8)
    let (data, _) = try await URLSession.shared.data(for: request)
    return data
}

public func getClickUpTeams() async throws -> [ClickUpTeam] {
    let request = urlRequest(method: "GET",
                             url: "https://api.clickup.com/api/v2/team",
                             auth: clickUpPersonalToken)
    let (data, _) = try await URLSession.shared.data(for: request)
    let accountData = try JSONDecoder().decode(ClickUpAccountTeams.self, from: data)
    return accountData.teams
}

public func getClickUpSpaces(for teamId: String) async throws -> [ClickUpSpace] {
    let request = urlRequest(method: "GET",
                             url: "https://api.clickup.com/api/v2/team/\(teamId)/space?archived=false",
                             auth: clickUpPersonalToken)
    let (data, _) = try await URLSession.shared.data(for: request)
    let teamData = try JSONDecoder().decode(ClickUpTeamSpaces.self, from: data)
    return teamData.spaces
}

public func getClickUpFolders(for spaceId: String) async throws -> [ClickUpFolder] {
    let request = urlRequest(method: "GET",
                             url: "https://api.clickup.com/api/v2/space/\(spaceId)/folder?archived=false",
                             auth: clickUpPersonalToken)
    let (data, _) = try await URLSession.shared.data(for: request)
    let spaceData = try JSONDecoder().decode(ClickUpSpaceFolders.self, from: data)
    return spaceData.folders
}

public func getClickUpLists(for folderId: String) async throws -> [ClickUpList] {
    let request = urlRequest(method: "GET",
                             url: "https://api.clickup.com/api/v2/folder/\(folderId)/list?archived=false",
                             auth: clickUpPersonalToken)
    let (data, _) = try await URLSession.shared.data(for: request)
    let folderListData = try JSONDecoder().decode(ClickUpFolderLists.self, from: data)
    return folderListData.lists
}

public func getClickUpTasks(for listId: String, startingFromPage: Int = 0) async throws -> [ClickUpTask] {
    let request = urlRequest(method: "GET",
                             url: "https://api.clickup.com/api/v2/list/\(listId)/task",
                             auth: clickUpPersonalToken)
    print("Getting ClickUp task list from page \(startingFromPage) (list: \(listId))")
    let (data, _) = try await URLSession.shared.data(for: request)
    let listTaskData = try JSONDecoder().decode(ClickUpListTasks.self, from: data)
    return listTaskData.tasks
}

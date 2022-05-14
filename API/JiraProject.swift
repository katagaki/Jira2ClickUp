import Foundation

public struct JiraProject: Codable, Hashable {
    public var expand: String
    public var `self`: String
    public var id: String
    public var key: String
    public var description: String
    public var lead: JiraUserReference
    public var components: [JiraProjectComponent]
    public var issueTypes: [JiraProjectIssueType]
    public var assigneeType: String
    public var versions: [JiraProjectVersion]
    public var name: String
    public var roles: [String:String]
    public var avatarUrls: [String:String?]
    public var projectTypeKey: String
    public var simplified: Bool
    public var style: String
    public var isPrivate: Bool
    public var properties: [String:String]
}

public struct JiraProjectComponent: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var name: String
    public var isAssigneeTypeValid: Bool
}

public struct JiraProjectIssueType: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var description: String
    public var iconUrl: String
    public var name: String
    public var subtask: Bool
    public var avatarId: Int
    public var hierarchyLevel: Int
}

public struct JiraProjectVersion: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var description: String?
    public var name: String
    public var archived: Bool
    public var released: Bool
    public var startDate: String?
    public var releaseDate: String?
    public var userStartDate: String?
    public var userReleaseDate: String?
    public var projectId: Int?
}

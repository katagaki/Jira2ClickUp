import Foundation

public struct JiraQueryResult: Codable, Hashable {
    public var expand: String?
    public var startAt: Int
    public var maxResults: Int
    public var total: Int
    public var issues: [JiraIssue]
}

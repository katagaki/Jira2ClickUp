import Foundation

public struct ClickUpTeamSpaces: Codable, Hashable {
    public var spaces: [ClickUpSpace]
}

public struct ClickUpSpace: Codable, Hashable {
    public var avatar: String?
    public var archived: Bool
    public var id: String
    public var multiple_assignees: Bool
    public var statuses: [ClickUpStatus]
    public var `private`: Bool
    public var name: String
    public var features: ClickUpSpaceFeatureDefinition
}

public struct ClickUpStatus: Codable, Hashable {
    public var status: String
    public var id: String
    public var color: String?
    public var type: String
    public var orderindex: Int
}

public struct ClickUpSpaceFeatureDefinition: Codable, Hashable {
    public var sprints: [String:Bool]?
    public var due_dates: [String:Bool]?
    public var points: [String:Bool]?
    public var milestones: [String:Bool]?
    public var custom_fields: [String:Bool]?
    public var emails: [String:Bool]?
    public var zoom: [String:Bool]?
    public var custom_items: [String:Bool]?
}

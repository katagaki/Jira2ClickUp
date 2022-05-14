import Foundation

public struct ClickUpSpaceFolders: Codable, Hashable {
    public var folders: [ClickUpFolder]
}

public struct ClickUpFolder: Codable, Hashable {
    public var hidden: Bool
    public var permission_level: String
    public var archived: Bool
    public var id: String
    public var lists: [ClickUpList]
    public var space: ClickUpFolderSpaceReference
    public var statuses: [ClickUpStatus]
    public var orderindex: Int
    public var override_statuses: Bool
    public var name: String
    public var task_count: String
}

public struct ClickUpFolderSpaceReference: Codable, Hashable {
    public var id: String
    public var name: String
}

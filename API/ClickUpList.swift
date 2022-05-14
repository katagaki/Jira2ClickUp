import Foundation

public struct ClickUpFolderLists: Codable, Hashable {
    public var lists: [ClickUpList]
}

public struct ClickUpList: Codable, Hashable {
    public var id: String
    public var status: ClickUpListStatus?
    public var start_date: String?
    public var folder: ClickUpListFolder?
    public var override_statuses: Bool?
    public var assignee: String?
    public var permission_level: String
    public var priority: String?
    public var archived: Bool
    public var task_count: Int
    public var due_date: String?
    public var name: String
    public var orderindex: Int
}

public struct ClickUpListStatus: Codable, Hashable {
    public var status: String?
    public var color: String?
    public var hide_label: Bool
}

public struct ClickUpListFolder: Codable, Hashable {
    public var id: String
    public var access: Bool
    public var name: String
    public var hidden: Bool
}

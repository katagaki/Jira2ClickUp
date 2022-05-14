import Foundation

public struct ClickUpAccountTeams: Codable, Hashable {
    public var teams: [ClickUpTeam]
}

public struct ClickUpTeam: Codable, Hashable {
    public var avatar: String?
    public var id: String
    public var name: String
    public var members: [ClickUpTeamMember]
    public var color: String?
}

public struct ClickUpTeamMember: Codable, Hashable {
    public var user: ClickUpTeamMemberUser
    public var invited_by: ClickUpTeamMemberInvitedBy?
    public var can_see_points_estimated: Bool?
    public var can_create_views: Bool?
    public var can_edit_tags: Bool?
    public var can_see_time_spent: Bool?
    public var can_see_time_estimated: Bool?
}

public struct ClickUpTeamMemberUser: Codable, Hashable {
    public var color: String?
    public var id: Int
    public var profilePicture: String?
    public var role: Int
    public var custom_role: String?
    public var username: String?
    public var email: String?
    public var date_joined: String?
    public var date_invited: String?
    public var last_active: String?
    public var initials: String
}

public struct ClickUpTeamMemberInvitedBy: Codable, Hashable {
    public var username: String
    public var id: Int
    public var email: String
    public var initials: String
    public var profilePicture: String?
    public var color: String?
}

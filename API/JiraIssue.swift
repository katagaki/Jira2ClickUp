import Foundation

public struct JiraIssue: Codable, Hashable {
    public var expand: String?
    public var id: String
    public var `self`: String
    public var key: String
    public var fields: JiraIssueFields
}

// Adjust the number of public variables accordingly based on the JSON response given per Jira project.
public struct JiraIssueFields: Codable, Hashable {
    public var statuscategorychangedate: String?
    public var fixVersions: [JiraIssueRelease]?
    public var resolution: JiraIssueResolution?
    public var lastViewed: String?
    public var priority: JiraIssuePriority
    public var labels: [String]?
    public var aggregatetimeoriginalestimate: Int?
    public var timeestimate: Int?
    public var versions: [JiraIssueRelease]?
    public var issuelinks: [JiraIssueLink]?
    public var assignee: JiraUserReference?
    public var status: JiraIssueFieldStatus
    public var components: [[String:String]]?
    public var aggregatetimeestimate: Int?
    public var creator: JiraUserReference?
    public var subtasks: [JiraIssue]?
    public var reporter: JiraUserReference?
    public var aggregateprogress: JiraIssueFieldProgress?
    public var progress: JiraIssueFieldProgress?
    public var votes: JiraIssueFieldVotes?
    public var worklog: JiraIssueFieldWorklog?
    public var issuetype: JiraIssueFieldIssueType
    public var timespent: Int?
    public var project: JiraIssueFieldProject?
    public var aggregatetimespent: Int?
    public var resolutiondate: String?
    public var workratio: Int?
    public var watches: JiraIssueWatches?
    public var issuerestriction: JiraIssueRestriction?
    public var created: String?
    public var updated: String?
    public var timeoriginalestimate: Int?
    public var description: JiraIssueFieldMultiTypeValue?
    public var timetracking: JiraIssueFieldTimeTracking?
    public var security: String?
    public var attachment: [JiraIssueAttachment]?
    public var summary: String
    public var environment: JiraIssueFieldMultiTypeValue?
    public var duedate: String?
    public var comment: JiraIssueComments?

}

public struct JiraIssueRelease: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var description: String
    public var name: String
    public var archived: Bool
    public var released: Bool
    public var releaseDate: String
}

public struct JiraIssueResolution: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var description: String
    public var name: String
}

public struct JiraIssueFieldParentLink: Codable, Hashable {
    public var hasEpicLinkFieldDependency: Bool
    public var showField: Bool
    public var nonEditableReason: JiraIssueNonEditableReason
}

public struct JiraIssueFieldSprint: Codable, Hashable {
    public var id: Int
    public var name: String
    public var state: String
    public var boardId: Int
    public var goal: String
    public var startDate: String?
    public var endDate: String?
    public var completeDate: String?
}

public struct JiraIssueNonEditableReason: Codable, Hashable {
    public var reason: String
    public var message: String
}

public struct JiraIssuePriority: Codable, Hashable {
    public var `self`: String
    public var iconUrl: String
    public var name: String
    public var id: String
}

public struct JiraIssueLink: Codable, Hashable {
    public var id: String
    public var `self`: String
    public var type: JiraIssueLinkType
    public var inwardIssue: JiraIssueLinkIssue?
    public var outwardIssue: JiraIssueLinkIssue?
}

public struct JiraIssueLinkType: Codable, Hashable {
    public var id: String
    public var name: String
    public var inward: String
    public var outward: String
    public var `self`: String
}

public struct JiraIssueLinkIssue: Codable, Hashable {
    public var id: String
    public var key: String
    public var `self`: String
    public var fields: JiraIssueInwardIssueFields
}

public struct JiraIssueInwardIssueFields: Codable, Hashable {
    public var summary: String
    public var status: JiraIssueFieldStatus
    public var priority: JiraIssuePriority
    public var issuetype: JiraIssueFieldIssueType
}

public struct JiraIssueFieldStatus: Codable, Hashable {
    public var `self`: String
    public var description: String
    public var iconUrl: String
    public var name: String
    public var id: String
    public var statusCategory: JiraIssueFieldStatusCategory
}

public struct JiraIssueFieldStatusCategory: Codable, Hashable {
    public var `self`: String
    public var id: Int
    public var key: String
    public var colorName: String
    public var name: String
}

public struct JiraIssueFieldIssueType: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var description: String
    public var iconUrl: String
    public var name: String
    public var subtask: Bool
    public var avatarId: Int
    public var hierarchyLevel: Int
}

public struct JiraUserReference: Codable, Hashable {
    public var `self`: String
    public var accountId: String
    public var avatarUrls: [String:String]
    public var displayName: String?
    public var active: Bool
    public var timeZone: String?
    public var accountType: String?
    public var emailAddress: String?
}

public struct JiraIssueFieldProgress: Codable, Hashable {
    public var progress: Int
    public var total: Int
}

public struct JiraIssueFieldVotes: Codable, Hashable {
    public var `self`: String
    public var votes: Int
    public var hasVoted: Bool
}

public struct JiraIssueFieldWorklog: Codable, Hashable {
    public var startAt: Int
    public var maxResults: Int
    public var total: Int
    public var worklogs: [JiraIssueFieldWorklogItem]
}

public struct JiraIssueFieldWorklogItem: Codable, Hashable {
    public var author: JiraUserReference?
    public var updated: String?
    public var timeSpentSeconds: Int
    public var id: String
    public var issueId: String
    public var timeSpent: String
    public var created: String
    public var `self`: String
    public var updateAuthor: JiraUserReference?
    public var started: String?
}

public struct JiraIssueFieldProject: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var key: String
    public var name: String
    public var projectTypeKey: String
    public var simplified: Bool
    public var avatarUrls: [String:String]
}

public struct JiraIssueFieldTextArea: Codable, Hashable {
    public var type: String
    public var version: Int
    public var content: [JiraIssueFieldTextAreaContent]
}

public struct JiraIssueFieldTextAreaContent: Codable, Hashable {
    public var type: String
    public var attrs: JiraIssueFieldTextAreaContentAttributes?
    public var text: String?
    public var marks: [JiraIssueFieldTextAreaContentMark]?
    public var content: [JiraIssueFieldTextAreaContent]?
}

public struct JiraIssueFieldTextAreaContentAttributes: Codable, Hashable {
    public var id: String? // Used by media and mentions
    public var layout: String? // Used by media and tables
    
    // Heading attributes
    public var level: Int?
    
    // Panel attributes
    public var panelType: String?
    
    // Media attributes
    public var collection: String?
    public var type: String?
    public var width: Int?
    public var height: Int?
    
    // Mention attributes
    public var text: String?
    public var accessLevel: String?
    
    // Table attributes
    public var localId: String?
    public var isNumberColumnEnabled: Bool?
}

// Describes the content's style (bold, italic, etc)
public struct JiraIssueFieldTextAreaContentMark: Codable, Hashable {
    public var type: String
}

public struct JiraIssueFieldSelection: Codable, Hashable {
    public var value: String
    public var id: String
    public var `self`: String
}

public struct JiraIssueAttachment: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var filename: String
    public var author: JiraUserReference
    public var created: String
    public var size: Int
    public var mimeType: String
    public var content: String
    public var thumbnail: String
}

public struct JiraIssueComments: Codable, Hashable {
    public var comments: [JiraIssueComment]
    public var `self`: String
    public var maxResults: Int
    public var total: Int
    public var startAt: Int
}

public struct JiraIssueComment: Codable, Hashable {
    public var `self`: String
    public var id: String
    public var author: JiraUserReference
    public var body: JiraIssueFieldTextArea
    public var updateAuthor: JiraUserReference
    public var created: String
    public var updated: String
    public var jsdPublic: Bool
}

public struct JiraIssueWatches: Codable, Hashable {
    public var `self`: String
    public var watchCount: Int
    public var isWatching: Bool
}

public struct JiraIssueRestriction: Codable, Hashable {
    public var issuerestrictions: [String:String]
    public var shouldDisplay: Bool
}

public struct JiraIssueFieldTimeTracking: Codable, Hashable {
    public var originalEstimateSeconds: Int?
    public var timeSpentSeconds: Int?
    public var timeSpent: String?
    public var remainingEstimate: String?
    public var remainingEstimateSeconds: Int?
    public var originalEstimate: String?
}

public enum JiraIssueFieldMultiTypeValue: Codable, Hashable {
    
    case string(String), int(Int), double(Double), bool(Bool), array([JiraIssueFieldMultiTypeValue?]), dict([String:JiraIssueFieldMultiTypeValue?]), dictArray([[String:JiraIssueFieldMultiTypeValue?]]), document(JiraIssueFieldTextArea)
    
    public init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        } else if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        } else if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        } else if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(bool)
            return
        } else if let array = try? decoder.singleValueContainer().decode([JiraIssueFieldMultiTypeValue?].self) {
            self = .array(array)
            return
        } else if let dict = try? decoder.singleValueContainer().decode([String:JiraIssueFieldMultiTypeValue?].self) {
            self = .dict(dict)
            return
        } else if let dictArray = try? decoder.singleValueContainer().decode([[String:JiraIssueFieldMultiTypeValue?]].self) {
            self = .dictArray(dictArray)
            return
        } else if let document = try? decoder.singleValueContainer().decode(JiraIssueFieldTextArea?.self) {
            self = .document(document)
            return
        } else {
            print(decoder.codingPath)
            throw MultiValueError.missingValueOrUnknownType
        }
    }
    
    public var stringValue: String? {
        switch self {
        case .string(let value): return value
        default: return nil
        }
    }
    public var intValue: Int? {
        switch self {
        case .int(let value): return value
        default: return nil
        }
    }
    public var doubleValue: Double? {
        switch self {
        case .double(let value): return value
        default: return nil
        }
    }
    public var boolValue: Bool? {
        switch self {
        case .bool(let value): return value
        default: return nil
        }
    }
    public var arrayValue: [JiraIssueFieldMultiTypeValue?]? {
        switch self {
        case .array(let value): return value
        default: return nil
        }
    }
    public var dictValue: [String:JiraIssueFieldMultiTypeValue?]? {
        switch self {
        case .dict(let value): return value
        default: return nil
        }
    }
    public var dictArrayValue: [[String:JiraIssueFieldMultiTypeValue?]]? {
        switch self {
        case .dictArray(let value): return value
        default: return nil
        }
    }
    public var documentValue: JiraIssueFieldTextArea? {
        switch self {
        case .document(let value): return value
        default: return nil
        }
    }
    
    enum MultiValueError: Error {
        case missingValueOrUnknownType
    }
}

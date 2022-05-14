import Foundation

public func date(fromISO8601 dateString: String) -> Date? {
    let formatter: DateFormatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.date(from: dateString)
}

public func clickUpCompatibleDate(from date: Date?) -> String {
    var dateString: String = ""
    if let date = date {
        dateString = "\"\(date.timeIntervalSince1970)\""
        dateString = dateString.replacingOccurrences(of: ".", with: "")
    } else {
        dateString = "null"
    }
    return dateString
}

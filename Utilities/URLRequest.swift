import Foundation

public func urlRequest(method: String, url: String, auth: String) -> URLRequest {
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = method
    request.setValue(auth, forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
}

import Foundation

public protocol WBBARequest {
    
    var baseUrl: String { get }
    var path: String { get }
    var method: WBBAAPIMethod { get }
    var body: Codable? { get }
    var headers: WBBAHTTPHeader? { get }
    var queryParam: WBBAQueryParameters? { get }
    
    associatedtype ReturnType: Codable
}

import Foundation

public enum WBBAAPIError: LocalizedError, Equatable {

    // MARK: - Cases

    case notFound
    case unauthorized
    case forbidden
    case error4xx(_ code: Int)
    case error5xx(_ code: Int)
    case timeout
    case badRequest
    case internalServer
    case unknown

    // MARK: - Public Properties

    public var localizedDescription: String {
        switch self {
        case .notFound:
            "WBBANetworking Error: Not Found"
        case .unauthorized:
            "WBBANetworking Error: Unauthorized"
        case .forbidden:
            "WBBANetworking Error: Forbidden"
        case .error4xx(let code):
            "WBBANetworking Error: Error4xx -> (error\(code))"
        case .error5xx(let code):
            "WBBANetworking Error: Error5xx -> (error\(code))"
        case .timeout:
            "WBBANetworking Error: Request Timed Out"
        case .badRequest:
            "WBBANetworking Error: Bad Request"
        case .internalServer:
            "WBBANetworking Error: Internal Server Error"
        case .unknown:
            "WBBANetworking Error: Unknown Error"
        }
    }
}

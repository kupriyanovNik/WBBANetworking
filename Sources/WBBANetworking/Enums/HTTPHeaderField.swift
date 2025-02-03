public enum WBBAHeaderField: String {

    // MARK: - Cases

    case contentType
    case acceptType
    case acceptEncoding
    case authorization
    case acceptLanguage
    case userAgent
    case apiKey

    // MARK: - Public Properties

    public var rawValue: String {
        switch self {
        case .contentType:
            "Content-Type"
        case .acceptType:
            "Accept"
        case .acceptEncoding:
            "Accept-Encoding"
        case .authorization:
            "Authorization"
        case .acceptLanguage:
            "Accept-Language"
        case .userAgent:
            "User-Agent"
        case .apiKey:
            "x-api-key"
        }
    }
}

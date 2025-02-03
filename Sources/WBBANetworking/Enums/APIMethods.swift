import Foundation

public enum WBBAAPIMethod: String {

    // MARK: - Cases

    case get
    case post
    case put
    case patch
    case delete

    // MARK: - Public Properties

    public var methodValue: String {
        self.rawValue.uppercased()
    }
}

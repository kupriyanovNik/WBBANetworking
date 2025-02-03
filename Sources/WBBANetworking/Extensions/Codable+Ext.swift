import Foundation

extension Codable? {

    // MARK: - Internal Functions

    func convertCodableToBody() -> Data? {
        guard let self else { return nil }

        guard let body = try? JSONEncoder().encode(self) else { return nil }

        return body
    }
}

import Foundation

extension WBBAQueryParameters? {

    // MARK: - Internal Functions

    func getQueryParameters() -> [URLQueryItem]? {
        guard let self else { return nil }

        return self.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}

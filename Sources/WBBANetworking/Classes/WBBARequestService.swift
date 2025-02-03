import Foundation

@MainActor
public final class WBBARequestService {

    // MARK: - Private Properties

    private let urlSession: URLSession
    private let decoder: JSONDecoder

    // MARK: - Init

    init(
        urlSession: URLSession = .shared,
        decoder: JSONDecoder = .init()
    ) {
        self.urlSession = urlSession
        self.decoder = decoder
    }

    // MARK: - Internal Functions

    func send<ReturnType: Codable>(request: URLRequest) async throws -> ReturnType {
        let (data, response) = try await urlSession.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            let code = httpResponse.statusCode

            if !(200...299).contains(code) {
                throw makeError(for: code)
            }
        }
        
        return try decoder.decode(ReturnType.self, from: data)
    }
    
    // MARK: - Private Functions

    private func makeError(for statusCode: Int) -> WBBAAPIError {
        switch statusCode {
        case 401: .unauthorized
        case 403: .forbidden
        case 404: .notFound
        case 408: .timeout
        case 400...499: .error4xx(statusCode)
        case 500: .internalServer
        case 501...509: .error5xx(statusCode)
        default: .unknown
        }
    }
}

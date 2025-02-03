import Foundation

@MainActor
public final class WBBADataProvider {

    // MARK: - Static Properties

    static let requestService = WBBARequestService()

    // MARK: - Static Functions

    public static func getData<T: WBBARequest>(for request: T) async throws -> T.ReturnType {
        let urlRequest = request.representAsRequest(request.baseUrl)

        guard let urlRequest else { throw WBBAAPIError.badRequest }

        return try await requestService.send(request: urlRequest)
    }
}

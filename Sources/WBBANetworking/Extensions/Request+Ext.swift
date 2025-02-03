import Foundation

public extension WBBARequest {

    // MARK: - Internal Properties

    var method: WBBAAPIMethod { .get }
    var body: Codable? { nil }
    var headers: WBBAHTTPHeader? { nil }
    var queryParam: WBBAQueryParameters? { nil }

    // MARK: - Internal Functions

    func representAsRequest(_ baseURL: String) -> URLRequest? {
        let urlComponents = URLComponents(string: baseURL)

        guard var urlComponents else { return nil }

        urlComponents.path = urlComponents.path + path
        urlComponents.queryItems = queryParam.getQueryParameters()

        guard let urlWithParameters = urlComponents.url else { return nil }

        var urlRequest = URLRequest(url: urlWithParameters)

        urlRequest.httpMethod = method.methodValue
        urlRequest.httpBody = body.convertCodableToBody()
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

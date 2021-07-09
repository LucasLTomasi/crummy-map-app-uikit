import Combine
import Foundation

class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private let session = URLSession.shared

    private init() {}

    private struct OpenCageGeocoderAPI {
        static let scheme = "https"
        static let host = "api.opencagedata.com"
        static let path = "/geocode/v1/json"
        static let key = "97461d67dbcb4c44b10ee23754ddf070"
    }

    private func makeURLComponents(with text: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenCageGeocoderAPI.scheme
        components.host = OpenCageGeocoderAPI.host
        components.path = OpenCageGeocoderAPI.path
        components.queryItems = [
            URLQueryItem(name: "q", value: text),
            URLQueryItem(name: "key", value: OpenCageGeocoderAPI.key)
        ]
        return components
    }

    func request(text: String, completion: @escaping (Result<APIResponse, APIError>) -> Void) {
        let components = makeURLComponents(with: text)
        guard let url = components.url else {
            completion(.failure(.network(description: String.Localizable.urlCreationError)))
            return
        }
        session.dataTask(with: url) { data, _, _ in
            APIDecoder.decode(data) { response in completion(response) }
        }.resume()
    }
}

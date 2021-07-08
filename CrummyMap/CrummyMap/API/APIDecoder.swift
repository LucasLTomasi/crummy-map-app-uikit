import Combine
import Foundation

enum APIDecoder {
    static func decode(_ data: Data?, completion: @escaping (Result<APIResponse, APIError>) -> Void) {
        guard let data = data else {
            completion(.failure(.decoding(description: String.Localizable.nullDataError)))
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let response = try decoder.decode(APIResponse.self, from: data)
            completion(.success(response))
        } catch {
            let jsonResponse = String(decoding: data, as: UTF8.self)
            completion(.failure(.decoding(description: jsonResponse)))
        }
    }
}

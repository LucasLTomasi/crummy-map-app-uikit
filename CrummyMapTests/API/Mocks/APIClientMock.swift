@testable import CrummyMap

class APIClientMock: APIClientProtocol {
    var requestCallCount = 0
    var shouldFail = false
    var error: APIError?

    func request(text: String, completion: @escaping (Result<APIResponse, APIError>) -> Void) {
        requestCallCount += 1
        if shouldFail {
            completion(.failure(error!))
        } else {
            completion(.success(APIResponse(results: [])))
        }
    }
}

protocol APIClientProtocol {
    func request(text: String, completion: @escaping (Result<APIResponse, APIError>) -> Void)
}

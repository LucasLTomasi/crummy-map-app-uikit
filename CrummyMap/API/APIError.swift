enum APIError: Error, Equatable {
    case decoding(description: String)
    case network(description: String)
}

protocol PlacesListPresenterInput {
    func getPlaces(with text: String, completion: @escaping (Result<[Place], APIError>) -> Void)
}

protocol PlacesListPresenterOutput: AnyObject {}

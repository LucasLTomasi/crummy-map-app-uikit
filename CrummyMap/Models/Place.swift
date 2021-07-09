struct Place: Decodable, Equatable {
    var formatted: String
    var geometry: Geometry
}

struct Geometry: Decodable, Equatable {
    var latitude: Double
    var longitude: Double

    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

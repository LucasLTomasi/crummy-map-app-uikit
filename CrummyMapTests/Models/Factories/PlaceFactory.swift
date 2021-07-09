@testable import CrummyMap

enum PlaceFactory {
    static func makePlace(formatted: String = "place name") -> Place {
        Place(formatted: formatted, geometry: Geometry(latitude: 1, longitude: 1))
    }
}

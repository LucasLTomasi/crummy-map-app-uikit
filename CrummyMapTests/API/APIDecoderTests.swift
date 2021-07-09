@testable import CrummyMap
import XCTest

class APIDecoderTests: XCTestCase {
    func test_APIDecoder_decode_withNilData_shouldCompleteWithFailure() {
        APIDecoder.decode(nil) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.nullDataError)))
        }
    }

    func test_APIDecoder_decode_withInvalidPayload_shouldCompleteWithFailure() {
        let payload: [String: Any] = ["wrong_key": "some value"]
        let data = try! JSONSerialization.data(withJSONObject: payload)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.decodingError)))
        }
    }

    func test_APIDecoder_decode_withValidPayloadForPlaces_shouldCompleteWithFailure() {
        let places: [[String: Any]] = [
            ["wrong_key": "some_value"]
        ]
        let payload: [String: Any] = ["results": places]
        let data = try! JSONSerialization.data(withJSONObject: payload)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.decodingError)))
        }
    }

    func test_APIDecoder_decode_withValidPayload_shouldCompleteWithSuccess() {
        let formattedPlaceName1 = "place 1"
        let formattedPlaceName2 = "place 2"
        let places: [[String: Any]] = [
            ["formatted": formattedPlaceName1, "geometry": ["lat": 1, "lng": 1]],
            ["formatted": formattedPlaceName2, "geometry": ["lat": 1, "lng": 1]],
        ]
        let payload: [String: Any] = ["results": places]
        let data = try! JSONSerialization.data(withJSONObject: payload)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .success(APIResponse(results: [
                PlaceFactory.makePlace(formatted: formattedPlaceName1),
                PlaceFactory.makePlace(formatted: formattedPlaceName2),
            ])))
        }
    }
}

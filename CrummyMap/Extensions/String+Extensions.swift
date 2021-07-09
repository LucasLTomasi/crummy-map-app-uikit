import Foundation

extension String {
    enum Localizable {
        // Errors
        static let urlCreationError = NSLocalizedString("url_creation_error", comment: "")
        static let nullDataError = NSLocalizedString("null_data_error", comment: "")
        static let decodingError = NSLocalizedString("decoding_error", comment: "")
        static let genericApiError = NSLocalizedString("generic_api_error", comment: "")
        static let noInternetConnection = NSLocalizedString("no_internet_connection", comment: "")

        // Search Bar
        static let searchBarPlaceholder = NSLocalizedString("search_bar_placeholder", comment: "")
        static let cancelButton = NSLocalizedString("cancel_button", comment: "")

        // Places List View
        static let placesListViewTitle = NSLocalizedString("places_list_view_title", comment: "")
        static let placesListViewPlaceholderText = NSLocalizedString("places_list_view_placeholder_text", comment: "")
        static let placesListViewTypeMoreCharactersWarning = NSLocalizedString("places_list_view_type_more_characters_warning", comment: "")
        static let placesListViewNoResultsWarning = NSLocalizedString("places_list_view_no_results_warning", comment: "")
        static let placesListViewLoading = NSLocalizedString("places_list_view_loading", comment: "")

        // Place Detail View
        static let placeDetailViewTitle = NSLocalizedString("place_detail_view_title", comment: "")
    }
}

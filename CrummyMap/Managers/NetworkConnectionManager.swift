import Foundation
import Network

enum NetworkConnectionAvailability {
    case available
    case unavailable
}

class NetworkConnectionManager {
    static let shared = NetworkConnectionManager()
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue

    private init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.main
        self.monitor.start(queue: self.queue)
    }

    func observe(callback: @escaping (NetworkConnectionAvailability) -> Void) {
        self.monitor.pathUpdateHandler = { path in
            callback(path.status == .satisfied ? .available : .unavailable)
        }
    }
}

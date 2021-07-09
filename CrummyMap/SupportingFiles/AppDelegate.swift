import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: Coordinator?
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = Coordinator(appDelegate: self)
        coordinator?.start()
        return true
    }
}

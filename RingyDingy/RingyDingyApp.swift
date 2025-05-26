
import SwiftUI

@main
struct RingyDingyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RingyLudView()
        }
    }
}

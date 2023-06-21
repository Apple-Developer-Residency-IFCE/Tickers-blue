
import SwiftUI

@main
struct TickersApp: App {
    @AppStorage("preferredAppearence") var preferredAppearence: Appearence?
    
    var body: some Scene {
        WindowGroup {
            HomeTabBar().preferredColorScheme(preferredAppearence?.toColorScheme)
        }
    }
}

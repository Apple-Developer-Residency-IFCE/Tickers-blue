
import SwiftUI

@main
struct TickersApp: App {
    @AppStorage("preferredAppearence") var preferredAppearence: Appearence?
    
    @Environment(\.scenePhase) var scenePhase
    
    var backgroundHelper = BackgroundHelper()
    @StateObject var pomodoroViewModel = PomodoroViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            HomeTabBar().preferredColorScheme(preferredAppearence?.toColorScheme)
                .onChange(of: scenePhase, perform: { scenePhase in
                    print(scenePhase)
                    
                    if scenePhase == .background {
                        backgroundHelper.wentIntoBackground = Date.now
                    } else if scenePhase == .active {
                        let timeInbackground = Date.now.timeIntervalSince(backgroundHelper.wentIntoBackground)
                        
                            print(timeInbackground)
                        print(pomodoroViewModel.timeRemaining)
                            pomodoroViewModel.timeRemaining -= Int(timeInbackground)
                            print(pomodoroViewModel.timeRemaining)
                    }
                    
                })
                .onChange(of: pomodoroViewModel.timeRemaining, perform: { timerRemaining in
                    print(timerRemaining)
                })
        }
    }
}

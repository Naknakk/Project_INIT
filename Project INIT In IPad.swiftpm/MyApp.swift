import SwiftUI
import SwiftUICalendar

@main
struct MyApp: App {
    @StateObject var modelData = ModelData()
    @StateObject var controller = CalendarController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(controller: controller)
                .environmentObject(modelData)
        }
    }
}

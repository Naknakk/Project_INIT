import SwiftUI
import SwiftUICalendar

struct ContentView: View {
    @ObservedObject var controller: CalendarController
    @EnvironmentObject var modelData: ModelData
    @State private var selection: Tabs = .Home    
    enum Tabs: String {
        case Home, Explore, Tab3, Setting, Test
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text("First View")
                .tabItem {
                    Image(systemName: "house.fill")
                        .tint(.white)
                    Text(Tabs.Home.rawValue)
                }.tag(Tabs.Home)
            InformationCalendarView(modelData: modelData, controller: controller)
                .tabItem {
                    Image(systemName: "calendar")
                    Text(Tabs.Explore.rawValue)
                }
                .tag(Tabs.Explore)
            Text("Third View")
                .tabItem {
                    Text(Tabs.Tab3.rawValue)
                }
                .tag(Tabs.Tab3)
            Text("Forth View")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text(Tabs.Setting.rawValue)
                }
                .tag(Tabs.Setting)
            Text("\(modelData.informations[0].title)")
                .tag(Tabs.Test)
        }
    }
}

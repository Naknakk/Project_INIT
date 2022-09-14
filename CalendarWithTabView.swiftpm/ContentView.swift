import SwiftUI
import SwiftUICalendar

struct ContentView: View {
    let tabs = ["Home", "Explore", "Tab3", "Setting"]
    @State private var selection: String
    init() {
        _selection = State(initialValue: tabs[0]) // initial tab
    }
    
    var body: some View {
            TabView(selection: $selection) {
                Text("First View")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text(tabs[0])
                    }.tag(tabs[0])
                InformationCalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text(tabs[1])
                    }
                    .tag(tabs[1])
                   
                    
                Text("Third View")
                    .tabItem {
                        Text(tabs[2])
                    }
                    .tag(tabs[2])
                Text("Forth View")
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text(tabs[3])
                    }
                    .tag(tabs[3])
            }
    }
}

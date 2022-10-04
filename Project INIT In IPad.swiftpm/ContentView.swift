//
//  ContentView.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//

import SwiftUI
import SwiftUICalendar

struct ContentView: View {
    @ObservedObject var controller: CalendarController
    @EnvironmentObject var modelData: ModelData
    @State private var selection: Tabs = .Home
    enum Tabs: String {
        case Home, Explore, Weekly, Setting, Test
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: selection != Tabs.Home 
                          ? "house"
                          : "house.fill")
                    .environment(\.symbolVariants, .none)
                    Text(Tabs.Home.rawValue)
                }.tag(Tabs.Home)
            InfoCalendar(modelData: modelData, controller: controller)
                .tabItem {
                    Image(systemName: "calendar")
                        .environment(\.symbolVariants, .none)
                    Text(Tabs.Explore.rawValue)
                }
                .tag(Tabs.Explore)
            WeeklyCalendarView()
                .tabItem {
                    Image(systemName: "repeat")           
                    Text(Tabs.Weekly.rawValue)
                }
                .tag(Tabs.Weekly)
            SettingView()
                .tabItem {
                    Image(systemName: selection != Tabs.Setting
                          ? "gearshape"
                          : "gearshape.fill")
                        .environment(\.symbolVariants, .none)
                    Text(Tabs.Setting.rawValue)
                }
                .tag(Tabs.Setting)
        }.accentColor(.brown)
            .onAppear{
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
            }
    }
}


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(controller: CalendarController())
            .environmentObject(ModelData())
    }
}

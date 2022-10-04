//
//  Project_INITApp.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//

import SwiftUI
import SwiftUICalendar

@main
struct MyApp: App {
    @StateObject var modelData = ModelData()
    @StateObject var controller = CalendarController(isLocked: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView(controller: controller)
                .environmentObject(modelData)
        }
    }
}

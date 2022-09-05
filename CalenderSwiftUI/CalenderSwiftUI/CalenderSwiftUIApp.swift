//
//  CalenderSwiftUIApp.swift
//  CalenderSwiftUI
//
//  Created by 이윤학 on 2022/09/02.
//

import SwiftUI

@main
struct CalenderSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            ContentView()
                .environmentObject(dateHolder)
        }
    }
}

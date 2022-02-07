//
//  Task_WatchApp.swift
//  Task_Watch WatchKit Extension
//
//  Created by 지승원 on 2022/02/07.
//

import SwiftUI

@main
struct Task_WatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

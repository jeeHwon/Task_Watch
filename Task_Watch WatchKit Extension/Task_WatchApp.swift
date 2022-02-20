//
//  Task_WatchApp.swift
//  Task_Watch WatchKit Extension
//
//  Created by jeeHwon on 2022/02/07.
//

import SwiftUI

@main
struct Task_WatchApp: App {
    let container = PersistenceController.shared.container
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    
            }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

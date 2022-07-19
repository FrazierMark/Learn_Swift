//
//  AEPSampleWatchAppApp.swift
//  AEPSampleWatchApp WatchKit Extension
//
//  Created by Mark Frazier on 7/19/22.
//

import SwiftUI

@main
struct AEPSampleWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

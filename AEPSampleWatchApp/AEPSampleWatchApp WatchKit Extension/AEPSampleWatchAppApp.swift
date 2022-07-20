//
//  AEPSampleWatchOSAppApp.swift
//  AEPSampleWatchOSApp WatchKit Extension
//
//  Created by Mark Frazier on 7/19/22.
//

import SwiftUI

@main
struct AEPSampleWatchAppApp: App {
    // Use of ExtensionDelegate for Remote Notifications
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self)
    private var extensionDelegate
    
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
        
        WKNotificationScene(
              controller: RemoteNotificationController.self,
              category: RemoteNotificationController.categoryIdentifier)
    }
}


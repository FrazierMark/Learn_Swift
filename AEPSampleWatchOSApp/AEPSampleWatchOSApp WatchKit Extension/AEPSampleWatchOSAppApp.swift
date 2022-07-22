//
//  AEPSampleWatchOSAppApp.swift
//  AEPSampleWatchOSApp WatchKit Extension
//
//  Created by Mark Frazier on 7/20/22.
//

import SwiftUI

@main
struct AEPSampleWatchOSAppApp: App {
    
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self)
   private var extensionDelegate
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }

}

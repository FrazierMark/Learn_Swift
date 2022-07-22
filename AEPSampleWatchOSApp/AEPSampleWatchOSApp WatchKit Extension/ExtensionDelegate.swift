
//
//  ExtensionDelegate.swift
//  AEPSampleWatchOSApp WatchKit Extension
//
//  Created by Mark Frazier on 7/21/22.
//

import Foundation
import WatchKit
import UserNotifications
import AEPMessaging

import AEPCore
//import AEPEdge
//import AEPEdgeIdentity
//import AEPMessaging


// 1
final class ExtensionDelegate: NSObject, WKApplicationDelegate, UNUserNotificationCenterDelegate {
    
    
    
    // 2
    func didRegisterForRemoteNotifications(withDeviceToken
                                           deviceToken: Data) {
        print(deviceToken.reduce("") { $0 + String(format: "%02x",
                                                   $1) })
        // Send push token to experience platform
        MobileCore.setPushIdentifier(deviceToken)
    }
    // 3
    func applicationDidFinishLaunching() {
        Task {
            do {
                let success = try await UNUserNotificationCenter
                    .current()
                    .requestAuthorization(options:
                                            [.badge, .sound, .alert])
                guard success else { return }
                // 4
                await MainActor.run {
                    WKApplication.shared().registerForRemoteNotifications()
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    // Handling the Selection of Custom Actions
    // Delegate method to process the user's response to a delivered notification.
    func userNotificationCenter(_: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // Perform the task associated with the action.
        switch response.actionIdentifier {
        case "ACCEPT_ACTION":
            Messaging.handleNotificationResponse(response, applicationOpened: true, customActionId: "ACCEPT_ACTION")

        case "DECLINE_ACTION":
            Messaging.handleNotificationResponse(response, applicationOpened: false, customActionId: "DECLINE_ACTION")

            // Handle other actions…
        default:
            Messaging.handleNotificationResponse(response, applicationOpened: true, customActionId: nil)
        }

        // Always call the completion handler when done.
        completionHandler()
    }
    
}






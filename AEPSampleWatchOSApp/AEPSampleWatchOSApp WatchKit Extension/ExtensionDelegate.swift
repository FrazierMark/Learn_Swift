//
//  ExtensionDelegate.swift
//  AEPSampleWatchOSApp WatchKit Extension
//
//  Created by Mark Frazier on 7/21/22.
//

import Foundation
import WatchKit
import UserNotifications

import AEPCore
import AEPEdge
import AEPEdgeIdentity
import AEPMessaging


// 1
final class ExtensionDelegate: NSObject, WKExtensionDelegate {
  // 2
  func didRegisterForRemoteNotifications(withDeviceToken
deviceToken: Data) {
    print(deviceToken.reduce("") { $0 + String(format: "%02x",
$1) })
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
              WKExtension.shared().registerForRemoteNotifications()
            }
    } catch {
            print(error.localizedDescription)
          }
    } }
    }
    
    
    
    
    

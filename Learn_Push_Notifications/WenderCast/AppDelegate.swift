/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import SafariServices
import UserNotifications

enum Identifiers {
  static let viewAction = "VIEW_IDENTIFIER"
  static let newsCategory = "NEWS_CATEGORY"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UITabBar.appearance().barTintColor = UIColor.themeGreenColor
    UITabBar.appearance().tintColor = UIColor.white
    
    // register push notification registration process with Apple Push Notification service
    registerForPushNotifications(application: application) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
        }
    }


    return true
  }
}

// Register push notification registration process with Apple Push Notification service
func registerForPushNotifications(application: UIApplication, completionHandler: @escaping ()->() = {}) {
    let center = UNUserNotificationCenter.current()

    //Ask for user permission
    center.requestAuthorization(options: [.badge, .sound, .alert]) { granted, _ in
        defer { completionHandler() }
        guard granted else { return }

        DispatchQueue.main.async {
            application.registerForRemoteNotifications()
        }
    }
}



// Tells the delegate that the app successfully registered with Apple Push Notification service (APNs).
// deviceToken is received from Apple Push Notification service
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
    let token = tokenParts.joined()
    print("Device Token: \(token)")

}

// Tells the delegate that the app failed to register with Apple Push Notification service (APNs).
func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Failed to register for remote notifications: \(error)")
}

// MARK: - Handle Push Notification Interactions
// Receiving Notifications
// Delegate method to handle a notification that arrived while the app was running in the foreground.
func userNotificationCenter(_ center: UNUserNotificationCenter,
                            willPresent notification: UNNotification,
                            withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.alert, .sound, .badge])
}



// returns the settings the users has granted
func getNotificationSettings() {
  UNUserNotificationCenter.current().getNotificationSettings { settings in
    print("Notification settings: \(settings)")
  }
}

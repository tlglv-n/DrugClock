//
//  AppDelegate+Extension.swift
//  DrugClock
//
//  Created by Nurikk T. on 29.06.2023.
//

import UserNotifications
import UIKit

extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
}

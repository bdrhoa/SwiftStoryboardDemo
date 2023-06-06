//
//  AppDelegate.swift
//  SwiftStoryboardDemo
//
//  Created by Brad Rhoads on 5/30/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var sessionID : String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KDataCollector.shared().debug = true
        // Set your Merchant ID
        KDataCollector.shared().merchantID = 900100 // Insert your valid merchant ID
        // Set the location collection configuration
        KDataCollector.shared().locationCollectorConfig =
        KLocationCollectorConfig.requestPermission
        // For a released app, you'll want to set this to KEnvironment.Production
        KDataCollector.shared().environment = KEnvironment.test
        KountAnalyticsViewController().setEnvironmentForAnalytics(KDataCollector.shared().environment)
        // To collect Analytics Data, set Boolean flag - analyticsData to true.
        let analyticsData = true
        KountAnalyticsViewController().collect(sessionID, analyticsSwitch: analyticsData) {
            (sessionID, success, error) in
            //Completion block to know whether device data collection is successful/failed with error/failed without error.
            if (success) {
                print("Collection Successful")
            }

            else {
                if ((error) != nil) {
                    print("Collection failed with error: ",error!.localizedDescription)
                }
                else {
                    print("Collection failed without error")
                }
            }

        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


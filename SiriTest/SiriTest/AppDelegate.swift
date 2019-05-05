//
//  AppDelegate.swift
//  SiriTest
//
//  Created by Raju on 31/03/19.
//  Copyright © 2019 Raju. All rights reserved.
//

import UIKit
import Intents
import HelperSiri

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        reqSiri()
        donate(name: "g")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Void) {
        let response: BabyIntentResponse
        response = BabyIntentResponse(code: .success, userActivity: nil)
        response.name = "Good"
        completionHandler(response)

        
    }
    
    func reqSiri() {
        INPreferences.requestSiriAuthorization { status in
            if status == INSiriAuthorizationStatus.authorized {
                print("INSiriAuthorizationStatus.authorized")
            } else {
                
                print("INSiriAuthorizationStatus.No: \(status)")
            }
        }
    }

    private func donate(name: String) {
        // 1
        let intent = BabyIntent()
        
        // 2
        intent.suggestedInvocationPhrase = "Cool baby"
        
        // 3
        let interaction = INInteraction(intent: intent, response: nil)
        
        // 4
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
        
        
        
        
        let testIntent = CoolBabyIntent()
        testIntent.suggestedInvocationPhrase = "Cool baby cool"
        let interaction1 = INInteraction(intent: testIntent, response: nil)
        
        // 4
        interaction1.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
    

}


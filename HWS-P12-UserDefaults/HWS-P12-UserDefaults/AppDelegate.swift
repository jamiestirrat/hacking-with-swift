//
//  AppDelegate.swift
//  HWS-P10-NamesToFaces
//
//  Created by jamie stirrat on 21/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

/*
 What we did: P10
 
 1. Setup file as standard
 2. Deleted VC and replaced with CollectionView (assign class, initial view controller, cell size)
 3. Setup Cell (UI Image, Label, Constraints, Reuse Identifier) * - can also do programmatically
 5. PersonCell Class containing outlet for name and image* - defining the cell but we do this later in the cell for item method
 6. Connected cell outlets with storyboard *
 7. Program View Controller - numberOfItemsInSection, cellForItemAt *
 8. Added add button to navigation bar
 9. Method to present image picker on pressing on button on nav bar
 10. Added Picker and Nav Delegates to ViewController inheritance (Nav allows cancel or selection with picker)
 11. Added privacy alert in plist - access photos
 12. Picker controller methods 1. to return selected data 2. to store that data
 13. Create an array of people with a Person 'class' - remember it needs init() *
 14. Code for creating and appending new person added to Picker method *
 15. Change collectionView method, NumberOfItemsInSection to equal the count of people
 16. Show the correct information in each cell, cellForItemAt (also format the cell to our liking)  *
 17. Name Change method using UIAlert added to new collectionView method (didSelectItemAt)
 
 
 Why we use a class for Person instead of a struct (which automatically has init()) in P12
 
 We need to use a class as structs will not inherit the NSCoding protocol - NSCoding requires you to work with objects.
 
 What we did: P12
 
 UserDefaults - a programmatic interface for interacting with defaults system. The default system allows the app to be customised to match a users preference. referred to as defaults as they are loaded as default state when the app is launched
 
 1. Inherited the NSCoding protocol in Person
 2. Added code for init (decoding) and encode() in Person
 3. Added code to ViewController to load and save
    - save() method created & added to didSelectItemAt method
    - load array back from disk in ViewDidLoad()
 
 
 */



import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


}


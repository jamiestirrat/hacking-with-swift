//
//  ViewController.swift
//  HWS-P21-LocalNotifications
//
//  Created by jamie stirrat on 23/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    //change to NavBar
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:
            "Register", style: .plain, target: self, action:
            #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Schedule", style: .plain, target: self, action:
            #selector(scheduleLocal))
    }

    //method for register button - granting user permission
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:
        [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    //method for schedule button - configure 3 things. Content to show, When to show and a request (made up of identifier, content and trigger)
    //Broken down into two components - content and trigger.
    @objc func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
       
        //content
        let content = UNMutableNotificationContent()
        content.title = "Early Morning Wake Up Call"
        content.body = "Wake up, it's time"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        //trigger
//        var dateComponents = DateComponents()
//        dateComponents.hour = 4
//        dateComponents.minute = 30
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //request - using UUID
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
        
        //to remove pending requests if trigger isn't met
        //center.removeAllPendingNotificationRequests()
        
        //interval trigger
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        
        }
    }


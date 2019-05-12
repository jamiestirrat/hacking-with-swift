//
//  ViewController.swift
//  HWS-P18-Debugging
//
//  Created by jamie stirrat on 11/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            print("got number \(i)") //because we have a breakpoint here (blue marker) the app pauses and we get a green tag.
        }
    }


}


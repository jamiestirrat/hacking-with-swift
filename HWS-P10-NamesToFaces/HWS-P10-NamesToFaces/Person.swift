//
//  Person.swift
//  HWS-P10-NamesToFaces
//
//  Created by jamie stirrat on 21/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
}

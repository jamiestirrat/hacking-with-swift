//
//  Person.swift
//  HWS-P10-NamesToFaces
//
//  Created by jamie stirrat on 21/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit

//for a data type as class must inherit NSCoding protocol, used for archiving object graphs
class Person: NSObject, NSCoding {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    //init required for NSCoding - decode data
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String //decode name
        image = aDecoder.decodeObject(forKey: "image") as! String //decode image
    }
    
    //encode required for NSCoding - encode data
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name") //encode name
        aCoder.encode(image, forKey: "image") //encode image
    }
    
}

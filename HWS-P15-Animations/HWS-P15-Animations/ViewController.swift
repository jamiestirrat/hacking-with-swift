//
//  ViewController.swift
//  HWS-P15-Animations
//
//  Created by jamie stirrat on 11/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tap: UIButton!
    @IBAction func tapped(_ sender: Any) {
            tap.isHidden = true //hide UI button
            UIView.animate(withDuration: 1, delay: 0,
                       usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options:
            [],
                           animations: { [unowned self] in
                            switch self.currentAnimation {
                            case 0:
                                self.imageView.transform = CGAffineTransform(scaleX: 2, y:
                                    2) //transform the imageView using CGAffineTransform (x2 scale)
                            case 1:
                                self.imageView.transform = CGAffineTransform.identity //transform the image view back to its original 'identity' using CGAffineTransform
                            case 2:
                                self.imageView.transform = CGAffineTransform(translationX:
                                    0, y: -100)
                            case 3:
                                self.imageView.transform = CGAffineTransform.identity
                            case 4:
                                self.imageView.transform = CGAffineTransform(rotationAngle:
                                    CGFloat.pi)
                            case 5:
                                self.imageView.transform = CGAffineTransform.identity
                            case 6:
                                self.imageView.alpha = 0.1
                                self.view.backgroundColor = UIColor.gray
                            case 7:
                                self.imageView.alpha = 1
                                self.view.backgroundColor = UIColor.white
                            default:
                                break
                            }
            }) { [unowned self] (finished: Bool) in //Animate method (1second, 0 second delay) with switch. statement
                self.tap.isHidden = false //when finished return button
            }
            
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        print("tapped")
    }
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }


}


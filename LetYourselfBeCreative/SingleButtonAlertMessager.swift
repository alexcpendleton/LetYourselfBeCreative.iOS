//
//  SingleButtonAlertMessager.swift
//  OnTheMap
//
//  Created by Alex Pendleton on 10/19/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import Foundation
import UIKit

public class SingleButtonAlertMessager {
    public func showAlert(message:String, title:String, presentUsing:UIViewController, buttonText:String = "OK", shaken:Bool = true) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: buttonText, style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        let animator = ShakeAnimator()
        presentUsing.presentViewController(alertController, animated: true) { () -> Void in
            if shaken {
                animator.animate(presentUsing.view)
            }
        }
        return alertController
    }
}


public class ShakeAnimator {
    func createAnimation() -> CAKeyframeAnimation{
        // Taken from http://stackoverflow.com/a/9371196/21201
        let anim = CAKeyframeAnimation( keyPath:"transform" )
        anim.values = [
            NSValue( CATransform3D:CATransform3DMakeTranslation(-5, 0, 0 ) ),
            NSValue( CATransform3D:CATransform3DMakeTranslation( 5, 0, 0 ) )
        ]
        anim.autoreverses = true
        anim.repeatCount = 2
        anim.duration = 10/100
        
        return anim
    }
    
    func animate(toShake: UIView) {
        toShake.layer.addAnimation(createAnimation(), forKey:nil )
    }
}
//
//  ViewController.swift
//  Tinder-Like-Radar-Animation
//
//  Created by Indieg0 on 01.08.16.
//  Copyright © 2016 Kirill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()
    var circleView = UIView()
    
    let buttonSize : CGFloat = 100
    let buttonBounceScale : CGFloat = 0.9
    let timeInterval = 3.0
    let circlesScale: CGFloat = 3.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCircleViewVisuals()
        setButtonVisuals()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
                                                   target: self,
                                                   selector: #selector(buttonTouchedUp(_:)),
                                                   userInfo: nil,
                                                   repeats: true)
    }
    
    func setButtonVisuals() {
        button = UIButton.init(frame: CGRectMake((self.view.frame.size.width - buttonSize)/2,
            (self.view.frame.size.height - buttonSize)/2,
            buttonSize,
            buttonSize))
        button.backgroundColor = UIColor.blackColor()
        button.layer.cornerRadius = buttonSize / 2
        
        button.addTarget(self, action: #selector(ViewController.buttonTouchedUp(_:)),
                         forControlEvents: UIControlEvents.TouchUpInside)
        button.addTarget(self, action: #selector(ViewController.buttonTouchedIn(_:)),
                         forControlEvents: UIControlEvents.TouchDown)
        
        view.addSubview(button)
    }
    
    func setCircleViewVisuals() {
        circleView = UIView(frame: CGRectMake((self.view.frame.size.width - buttonSize * buttonBounceScale)/2,
            (self.view.frame.size.height - buttonSize * buttonBounceScale)/2,
            buttonSize * buttonBounceScale,
            buttonSize * buttonBounceScale))
        
        circleView.layer.cornerRadius = buttonSize*buttonBounceScale / 2
        circleView.backgroundColor = UIColor.grayColor()
        circleView.alpha = 0.7
        circleView.layer.borderWidth = 1.0
        circleView.layer.borderColor = UIColor.blackColor().CGColor
        
        view.addSubview(self.circleView)
    }
    
    
    
    func buttonTouchedIn(sender:UIButton) {
        
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.button.transform = CGAffineTransformMakeScale(self.buttonBounceScale , self.buttonBounceScale)
            
        }) { (completed) in
            
        }
        
    }
    
    func buttonTouchedUp(sender: UIButton) {
        
        setCircleViewVisuals()
        self.view.bringSubviewToFront(button)
        
        UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            self.button.transform = CGAffineTransformMakeScale(1, 1)
            
        }) { (completed) in
            
        }
        
        UIView.animateWithDuration(1.5, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            self.circleView.alpha = 0
            self.circleView.transform = CGAffineTransformMakeScale(self.circlesScale, self.circlesScale)
            
        }) { (completed) in
            
        }
        
        
    }
    
    
}



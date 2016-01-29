//
//  ViewController.swift
//  CAGradientLayerGuide
//
//  Created by liuk on 16/1/29.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import UIKit
let kGradientLayerWidth = kScreenWidth / 3
let kGradientLayerHeight = kScreenHeight * 3

class ViewController: UIViewController {
    var jinxView: UIImageView!
    var catalinaView: UIImageView!
    var baseView: UIView!
    var leftLayer: CAGradientLayer!
    var midLayer: CAGradientLayer!
    var rightLayer: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addJinxView()
        self.addCatalinaView()
        self.addBaseView()
        self.addGradientLayer()
        self.startShapeShifting()
        
    }
    func addJinxView(){
        jinxView = UIImageView(frame: self.view.bounds)
        jinxView.image = UIImage(named: "jinx.jpg")
        jinxView.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(jinxView)
    }
    func addCatalinaView(){
        catalinaView = UIImageView(frame: self.view.bounds)
        catalinaView.image = UIImage(named: "catalina2")
        catalinaView.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(catalinaView)
    }
    func addBaseView(){
        baseView = UIView(frame: catalinaView.bounds)
        catalinaView.maskView = baseView
    }
    
    
    func addGradientLayer(){
        leftLayer = CAGradientLayer()
        leftLayer.frame = CGRectMake(0, 0, kGradientLayerWidth, kGradientLayerHeight)
        leftLayer.colors = [UIColor.clearColor().CGColor, UIColor.blackColor().CGColor]
        leftLayer.locations = [0.5]
        leftLayer.startPoint = CGPoint(x: 0.5, y: 0.3)
        leftLayer.endPoint = CGPoint(x: 0.5, y: 0.6)
        baseView.layer.addSublayer(leftLayer)
        
        midLayer = CAGradientLayer()
        midLayer.frame = CGRectMake(kGradientLayerWidth, -kScreenHeight * 2, kGradientLayerWidth, kGradientLayerHeight)
        midLayer.colors = [UIColor.blackColor().CGColor, UIColor.clearColor().CGColor]
        midLayer.locations = [0.5]
        midLayer.startPoint = CGPoint(x: 0.5, y: 0.3)
        midLayer.endPoint = CGPoint(x: 0.5, y: 0.6)
        baseView.layer.addSublayer(midLayer)
        
        rightLayer = CAGradientLayer()
        rightLayer.frame = CGRectMake(kGradientLayerWidth * 2, 0, kGradientLayerWidth, kGradientLayerHeight)
        rightLayer.colors = [UIColor.clearColor().CGColor, UIColor.blackColor().CGColor]
        rightLayer.locations = [0.5]
        rightLayer.startPoint = CGPoint(x: 0.5, y: 0.3)
        rightLayer.endPoint = CGPoint(x: 0.5, y: 0.6)
        baseView.layer.addSublayer(rightLayer)
    }
    
    
    func startShapeShifting(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            let leftAnimation = CABasicAnimation(keyPath: "position")
            leftAnimation.fromValue = NSValue.init(CGPoint: self.leftLayer.position)
            leftAnimation.toValue = NSValue.init(CGPoint: CGPoint(x: self.leftLayer.position.x, y: 0 - kScreenHeight / 2))
            leftAnimation.duration = 1.2
            leftAnimation.removedOnCompletion = false
            leftAnimation.fillMode = kCAFillModeForwards
            self.leftLayer.addAnimation(leftAnimation, forKey: "left")
    
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            let midAnimation = CABasicAnimation(keyPath: "position")
            midAnimation.fromValue = NSValue.init(CGPoint: self.midLayer.position)
            midAnimation.toValue = NSValue.init(CGPoint: CGPoint(x: self.midLayer.position.x, y: kScreenHeight + kScreenHeight / 2))
            midAnimation.duration = 1.2
            midAnimation.removedOnCompletion = false
            midAnimation.fillMode = kCAFillModeForwards
            self.midLayer.addAnimation(midAnimation, forKey: "mid")
            
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            let rightAnimation = CABasicAnimation(keyPath: "position")
            rightAnimation.fromValue = NSValue.init(CGPoint: self.rightLayer.position)
            rightAnimation.toValue = NSValue.init(CGPoint: CGPoint(x: self.rightLayer.position.x, y: 0 - kScreenHeight / 2))
            rightAnimation.duration = 1.2
            rightAnimation.removedOnCompletion = false
            rightAnimation.fillMode = kCAFillModeForwards
            self.rightLayer.addAnimation(rightAnimation, forKey: "right")
        
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


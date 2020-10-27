//
//  HHCA8ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/14.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit
import QuartzCore

class HHCA8ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    var timer = Timer()
    let colorLayer = CALayer()
    
    fileprivate func loadCAKeyframeAnimation() {

        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineWidth = 3.0
        self.view.layer.addSublayer(pathLayer)
        let shipLayer = CALayer()
        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        shipLayer.position = CGPoint(x: 0, y: 150)
        shipLayer.contents = UIImage.init(named: "Ship")?.cgImage
        self.view.layer.addSublayer(shipLayer)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 4.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = .rotateAuto
        shipLayer.add(animation, forKey: nil)
        
//        let shipLayer = CALayer()
//        shipLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
//        shipLayer.position = CGPoint(x: 150, y: 150)
//        shipLayer.contents = UIImage.init(named: "Ship")?.cgImage
//        self.view.layer.addSublayer(shipLayer)
//        let animation = CABasicAnimation()
//        animation.keyPath = "transform.rotation"
//        animation.duration = 2.0
////        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi, 0, 0, 1));
//        animation.byValue = 2 * Double.pi
//        shipLayer.add(animation, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        
        colorLayer.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(colorLayer)
        
        let changeColorBtn = UIButton.init(frame: CGRect(x: 50, y: 250, width: 100, height: 44))
        self.view.addSubview(changeColorBtn)
        changeColorBtn.setTitle("change color", for: .normal)
        changeColorBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        changeColorBtn.backgroundColor = .blue
        changeColorBtn.addTarget(self, action: #selector(changeColorBtnClick), for: .touchUpInside)
        
        secondHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        self.updateHandsAnimated(animated: false)
        
//        loadCAKeyframeAnimation()
//        loadAnimationGroup()
    }
    func loadAnimationGroup() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineWidth = 3.0
        self.view.layer.addSublayer(pathLayer)
        let colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        colorLayer.position = CGPoint(x: 0, y: 150)
        colorLayer.backgroundColor = UIColor.green.cgColor
        self.view.layer.addSublayer(colorLayer)
        let animation1 = CAKeyframeAnimation()
        animation1.keyPath = "position"
        animation1.path = bezierPath.cgPath
        animation1.rotationMode = .rotateAuto
        let animation2 = CABasicAnimation()
        animation2.keyPath = "backgroundColor"
        animation2.toValue = UIColor.red.cgColor
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation1, animation2]
        groupAnimation.duration = 4.0
        colorLayer.add(groupAnimation, forKey: nil)
    }
    @objc func tick() {
        self.updateHandsAnimated(animated: true)
    }
    func updateHandsAnimated(animated: Bool) {
        let calendar = NSCalendar.init(identifier: NSCalendar.Identifier.gregorian)
        let components = calendar?.components([.hour, .minute, .second], from: NSDate.now)
        let hourAngle = (CGFloat((components?.hour)!) / 12.0) * 2.0 * .pi
        let minuteAngle = (CGFloat((components?.minute)!) / 60.0) * 2.0 * .pi
        let secondAngle = (CGFloat((components?.second)!) / 60.0) * 2.0 * .pi
        
        self.setAngle(angle: hourAngle, handView: hourHand, animated: animated)
        self.setAngle(angle: minuteAngle, handView: minuteHand, animated: animated)
        self.setAngle(angle: secondAngle, handView: secondHand, animated: animated)
        
    }
    func setAngle(angle:CGFloat, handView:UIView, animated:Bool) {
        let transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        if animated {
            let animation = CABasicAnimation()
            self.updateHandsAnimated(animated: false)
            animation.keyPath = "transform"
            animation.toValue = NSValue.init(caTransform3D: transform)
            animation.duration = 0.5
            animation.delegate = self
            animation.timingFunction = CAMediaTimingFunction.init(controlPoints: 1, 0, 0.75, 1)
            animation.setValue(handView, forKey: "handView")
            handView.layer.add(animation, forKey: nil)
        }else{
            handView.layer.transform = transform
        }
    }
    @objc func changeColorBtnClick() {
        
//        let red = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
//        let green = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
//        let blue = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
//        let color = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
//        let animation = CABasicAnimation()
//        animation.keyPath = "backgroundColor"
//        animation.toValue = color.cgColor
//        animation.delegate = self
//        colorLayer.add(animation, forKey: nil)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2.0
        animation.values = [UIColor.blue.cgColor, UIColor.red.cgColor,  UIColor.green.cgColor, UIColor.blue.cgColor]
        colorLayer.add(animation, forKey: nil)
        
    }
     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        colorLayer.backgroundColor = ((anim as! CABasicAnimation).toValue as! CGColor)
//        CATransaction.commit()
        let handView = anim.value(forKey: "handView") as? UIView
        handView?.layer.transform = (anim as! CABasicAnimation).toValue as! CATransform3D
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

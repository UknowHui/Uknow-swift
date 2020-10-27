//
//  HHCA9ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/16.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA9ViewController: UIViewController, CAAnimationDelegate {

    let containerView = UIView()
    let durationField = UITextField()
    let repeatField = UITextField()
    let startButton = UIButton()
    let shipLayer = CALayer()
    let doorLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        containerView.frame = CGRect(x: 10, y: 100, width: self.view.width - 20, height: 400)
        containerView.backgroundColor = UIColor.lightGray
        self.view.addSubview(containerView)
        
//        shipLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
//        shipLayer.position = CGPoint(x: 150, y: 150)
//        shipLayer.contents = UIImage.init(named: "Ship")?.cgImage
//        containerView.layer.addSublayer(shipLayer)
//
//        durationField.frame = CGRect(x: 10, y: 350, width: 80, height: 40)
//        durationField.borderStyle = .roundedRect
//        durationField.placeholder = "duration"
//        containerView.addSubview(durationField)
//
//        repeatField.frame = CGRect(x: durationField.right + 10, y: 350, width: 80, height: 40)
//        repeatField.borderStyle = .roundedRect
//        repeatField.placeholder = "repeatCount"
//        containerView.addSubview(repeatField)
//
//        startButton.frame = CGRect(x: repeatField.right + 10, y: 350, width: 40, height: 40)
//        startButton.setTitle("Start", for: .normal)
//        startButton.setTitleColor(.blue, for: .normal)
//        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
//        containerView.addSubview(startButton)
        self.loadDoor()
        
    }
    func loadDoor() {
        
        doorLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        doorLayer.position = CGPoint(x: 150 - 64, y: 150)
        doorLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        doorLayer.contents = UIImage.init(named: "Door")?.cgImage
        containerView.layer.addSublayer(doorLayer)
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        containerView.layer.sublayerTransform = perspective
        
        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(pan(pan:)))
        self.view.addGestureRecognizer(pan)
        
        doorLayer.speed = 0.0
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = -0.5 * Double.pi
        animation.duration = 2.0
        animation.repeatDuration = CFTimeInterval(CGFloat.infinity)
        animation.autoreverses = true
        doorLayer.add(animation, forKey: nil)
        
    }
    @objc func pan(pan:UIPanGestureRecognizer) {
        var x = pan.translation(in: self.view).x
        x /= 200.0
        var timeOffset = self.doorLayer.timeOffset
        timeOffset = min(0.999, max(0.0, timeOffset - Double(x)))
        self.doorLayer.timeOffset = timeOffset
        pan.setTranslation(.zero, in: self.view)
    }
    @objc func startButtonClick() {
        let duration =  Double(self.durationField.text ?? "0")
        let repeatCount = Float(self.repeatField.text ?? "0")
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = duration ?? 0
        animation.repeatCount = repeatCount ?? 0
        animation.byValue = 2 * Double.pi
        animation.delegate = self
        self.shipLayer.add(animation, forKey: "rotateAnimation")
        self.setControlsEnabled(enabled: false)
    }
    func setControlsEnabled(enabled:Bool) {
        for control in [self.durationField, self.repeatField, self.startButton] {
            control.isEnabled = enabled
            control.alpha = enabled ? 1.0 : 0.25
        }
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.setControlsEnabled(enabled: true)
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

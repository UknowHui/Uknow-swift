//
//  HHCA10ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/22.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA10ViewController: UIViewController, CAAnimationDelegate {

    let colorLayer = CALayer()
    let colorView = UIView()
    let layerView = UIView()
    let containerView = UIView()
    var ballView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
//        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        colorLayer.position = CGPoint(x: self.view.width * 0.5, y: self.view.height * 0.5)
//        colorLayer.backgroundColor = UIColor.red.cgColor
//        self.view.layer.addSublayer(colorLayer)
        
//        colorView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        colorView.center = CGPoint(x: self.view.width * 0.5, y: self.view.height * 0.5)
//        colorView.backgroundColor = .red
//        self.view.addSubview(colorView)
        
//        layerView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
//        layerView.center = CGPoint(x: self.view.width * 0.5, y: self.view.height * 0.5)
//        self.view.addSubview(layerView)
//
//        self.loadLayerView()
        
        containerView.frame = CGRect(x: 0, y: 100, width: self.view.width, height: 500)
        self.view.addSubview(containerView)
        ballView.frame = containerView.bounds
        ballView = UIImageView.init(image: UIImage.init(named: "Ball"))
        containerView.addSubview(ballView)
        self.animate()
    }
    func animate() {
//        ballView.center = CGPoint(x: 150, y: 32)
//        let animation = CAKeyframeAnimation()
//        animation.keyPath = "position"
//        animation.duration = 1.0
//        animation.delegate = self
//        animation.values = [NSValue.init(cgPoint: CGPoint(x: 150, y: 32)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 268)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 140)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 268)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 220)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 268)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 250)),
//                            NSValue.init(cgPoint: CGPoint(x: 150, y: 268))]
//        animation.timingFunctions = [CAMediaTimingFunction.init(name: .easeIn),
//                                     CAMediaTimingFunction.init(name: .easeOut),
//                                     CAMediaTimingFunction.init(name: .easeIn),
//                                     CAMediaTimingFunction.init(name: .easeOut),
//                                     CAMediaTimingFunction.init(name: .easeIn),
//                                     CAMediaTimingFunction.init(name: .easeOut),
//                                     CAMediaTimingFunction.init(name: .easeIn)]
//        animation.keyTimes = [0.0, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 1.0]
//        ballView.layer.position = CGPoint(x: 150, y: 268)
//        ballView.layer.add(animation, forKey: nil)
        
        ballView.center = CGPoint(x: 150, y: 32)
        let fromValue = NSValue.init(cgPoint: CGPoint(x: 150, y: 32))
        let toValue = NSValue.init(cgPoint: CGPoint(x: 150, y: 268))
        let duration = 1
        let numFrames = duration * 60
        var frames = [NSValue]()
        for i in 0...numFrames {
            var time = 1 / Float(numFrames) * Float(i)
            time = bounceEaseOut(time)
            frames.append(interpolateFromValue(fromValue, toValue, time: Float(time)))
        }
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.values = frames
        ballView.layer.add(animation, forKey: nil)
    }
    func interpolate(_ from:CGFloat, _ to:CGFloat, _ time:CGFloat) -> CGFloat {
        return (to - from) * time + from
    }
    func interpolateFromValue(_ fromValue: NSValue, _ toValue:NSValue, time:Float) -> NSValue {
        let from = fromValue.cgPointValue
        let to = toValue.cgPointValue
        let result = CGPoint(x: interpolate(from.x, to.x, CGFloat(time)), y: interpolate(from.y, to.y, CGFloat(time)))
        return NSValue.init(cgPoint: result)
    }
    func quadraticEaseInOut(_ t: Float) -> Float {
        return (t < 0.5) ? (2 * t * t) : (-2 * t * t) + (4 * t) - 1
    }
    func bounceEaseOut(_ t: Float) -> Float {
        if t < 4/11.0 {
            return (121 * t * t) / 16.0
        } else if (t < 8/11.0) {
            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
        } else if (t < 9/10.0) {
            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
        }
        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
    }
    func loadLayerView() {
        let function = CAMediaTimingFunction.init(name: .easeOut)
        let controlPoint1 = UnsafeMutablePointer<Float>.allocate(capacity: 1)
        let controlPoint2 = UnsafeMutablePointer<Float>.allocate(capacity: 1)
        function.getControlPoint(at: 1, values: controlPoint1)
        function.getControlPoint(at: 2, values: controlPoint2)
        
        let point1 = CGPoint(x: CGFloat(controlPoint1[0]), y: CGFloat(controlPoint1[1]))
        let point2 = CGPoint(x: CGFloat(controlPoint2[0]), y: CGFloat(controlPoint2[1]))
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addCurve(to: CGPoint(x: 1, y: 1), controlPoint1: point1, controlPoint2: point2)
        path.apply(CGAffineTransform.init(scaleX: 200, y: 200))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.path = path.cgPath
        self.layerView.layer.addSublayer(shapeLayer)
        self.layerView.layer.isGeometryFlipped = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        CATransaction.begin()
//        CATransaction.setAnimationDuration(1.0)
//        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction.init(name: .easeOut))
//        colorLayer.position = (touches.first?.location(in: self.view))!
//        CATransaction.commit()
        
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut) {
//            self.colorView.center = (touches.first?.location(in: self.view))!
//        } completion: { _ in
//
//        }
        
//        let animation = CAKeyframeAnimation()
//        animation.keyPath = "backgroundColor"
//        animation.duration = 2.0
//        animation.values = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
//        let fn = CAMediaTimingFunction.init(name: .easeIn)
//        animation.timingFunctions = [fn, fn, fn]
//        colorLayer.add(animation, forKey: nil)
        
        self.animate()
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

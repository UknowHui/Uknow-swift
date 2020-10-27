//
//  HHCA10ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/22.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA10ViewController: UIViewController {

    let colorLayer = CALayer()
    let colorView = UIView()
    let layerView = UIView()
    
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
        
        layerView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        layerView.center = CGPoint(x: self.view.width * 0.5, y: self.view.height * 0.5)
        self.view.addSubview(layerView)
        
        self.loadLayerView()
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
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2.0
        animation.values = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        let fn = CAMediaTimingFunction.init(name: .easeIn)
        animation.timingFunctions = [fn, fn, fn]
        colorLayer.add(animation, forKey: nil)
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

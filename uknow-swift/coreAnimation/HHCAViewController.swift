//
//  HHCAViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/9/3.
//  Copyright © 2020 uknow. All rights reserved.
//


import UIKit
let bluelayer = CALayer()
var layerView = UIView()
let maskImageView = UIImageView()
let maskImageView1 = UIImageView()
class HHCAViewController: UIViewController, CALayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        
        layerView.frame = CGRect(x: 50, y: 150, width: 200, height: 200)
        layerView.backgroundColor = .white
        self.view.addSubview(layerView)
        
        
        bluelayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        bluelayer.backgroundColor = UIColor.blue.cgColor
        bluelayer.delegate = self
        bluelayer.contentsScale = UIScreen.main.scale
        layerView.layer.addSublayer(bluelayer)
        bluelayer.display()
        // Do any additional setup after loading the view.
        
        var transform = CGAffineTransform.identity
        transform = transform.rotated(by: .pi * 0.25)
        transform = transform.scaledBy(x: 0.5, y: 0.5)
        transform = transform.translatedBy(x: 200, y: 0)
        layerView.layer.setAffineTransform(transform)
        
        maskImageView.frame = CGRect(x: 50, y: 400, width: 100, height: 100)
        maskImageView.image = UIImage.init(named: "mvBackground")
        self.view.addSubview(maskImageView)
        
        maskImageView1.frame = CGRect(x: 200, y: 500, width: 100, height: 100)
        maskImageView1.image = UIImage.init(named: "mvBackground")
        self.view.addSubview(maskImageView1)
        
//        let maskLayer = CALayer()
//        maskLayer.frame = layerView.bounds
//        let maskImage = UIImage.init(named: "CardPlayerPlayIcon")
//        maskLayer.contents = maskImage?.cgImage
//        maskImageView.layer.mask = maskLayer
        
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1.0 / 500.0
        transform3D = CATransform3DRotate(transform3D, .pi * 0.25, 0, 1, 0)
        maskImageView.layer.transform = transform3D
        
        
        self.view.layer.sublayerTransform = transform3D
        
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

extension HHCoreAnimationViewController {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
//        point = layerView.layer.convert(point!, from: self.view.layer)
//        if layerView.layer.contains(point!) {
//            let alert = UIAlertController.init(title: "1", message: "111", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { _ in
//                NSLog("ok")
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }else {
//            let alert = UIAlertController.init(title: "2", message: "222", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { _ in
//                NSLog("ok")
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
        
        let layer = layerView.layer.hitTest(point!)
        if layer == bluelayer {
            let alert = UIAlertController.init(title: "1", message: "111", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { _ in
                NSLog("ok")
            }))
            self.present(alert, animated: true, completion: nil)
        }else {
            let alert = UIAlertController.init(title: "2", message: "222", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { _ in
                NSLog("ok")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

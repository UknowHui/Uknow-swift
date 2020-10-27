//
//  HHCA7ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/10/12.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA7ViewController: UIViewController {
    let colorLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        
        colorLayer.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(colorLayer)
        
        colorLayer.position = CGPoint(x: self.view.width * 0.5, y: self.view.height * 0.5)
        
//        let changeColorBtn = UIButton.init(frame: CGRect(x: 50, y: 250, width: 100, height: 44))
//        self.view.addSubview(changeColorBtn)
//        changeColorBtn.setTitle("change color", for: .normal)
//        changeColorBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        changeColorBtn.backgroundColor = .blue
//        changeColorBtn.addTarget(self, action: #selector(changeColorBtnClick), for: .touchUpInside)
    }
    @objc func changeColorBtnClick() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        CATransaction.setCompletionBlock {
            var transform : CGAffineTransform = self.colorLayer.affineTransform()
            transform = CGAffineTransform.init(rotationAngle: .pi * 0.25)
            self.colorLayer.setAffineTransform(transform)
        }
        let red = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
        let green = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
        let blue = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
        colorLayer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        CATransaction.commit()
        
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
extension HHCA7ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        
        if self.colorLayer.presentation()?.hitTest(point!) != nil {
            let red = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
            let green = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
            let blue = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
            colorLayer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        }else{
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            self.colorLayer.position = point!
            CATransaction.commit()
        }
    }
}

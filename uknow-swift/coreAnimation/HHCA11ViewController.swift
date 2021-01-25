//
//  HHCA11ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/11/26.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class HHCA11ViewController: UIViewController {

    let containerView = UIView()
    var ballView = UIImageView()
    var timer = Timer()
    var duration = TimeInterval()
    var timeOffset = TimeInterval()
    var fromValue = NSValue()
    var toValue = NSValue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        containerView.frame = CGRect(x: 0, y: 100, width: self.view.width, height: 500)
        self.view.addSubview(containerView)
        ballView.frame = containerView.bounds
        ballView = UIImageView.init(image: UIImage.init(named: "Ball"))
        containerView.addSubview(ballView)
        self.animate()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animate()
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
    func animate() {
        
        ballView.center = CGPoint(x: 152, y: 32)
        duration = 1.0
        timeOffset = 0.0
        fromValue = NSValue.init(cgPoint: CGPoint(x: 150, y: 32))
        toValue = NSValue.init(cgPoint: CGPoint(x: 150, y: 268))
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1/60.0, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    @objc func step(_ step:Timer) {
        timeOffset = min(timeOffset + 1/60.0, duration)
        var time : Float = Float(timeOffset / duration)
        time = bounceEaseOut(time)
        let position = interpolateFromValue(fromValue, toValue, time: time)
        ballView.center = position.cgPointValue
        if timeOffset >= duration {
            timer.invalidate()
        }
    }

    

}

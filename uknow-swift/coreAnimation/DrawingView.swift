//
//  DrawingView.swift
//  uknow-swift
//
//  Created by uknow on 2020/12/7.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

var path = UIBezierPath()
var strokes = [NSValue]()

class DrawingView: UIView {
    
    override class func awakeFromNib() {
//        path = UIBezierPath.init()
//        path.lineJoinStyle = .round
//        path.lineCapStyle = .round
//        path.lineWidth = 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self)
//        path.move(to: point!)
        self.addBrushStrokeAtPoint(point!)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self)
//        path.addLine(to: point!)
        strokes.append(NSValue.init(cgPoint: point!))
        self.setNeedsDisplay()
    }
    func addBrushStrokeAtPoint(_ point: CGPoint) {
        strokes.append(NSValue.init(cgPoint: point))
        self.setNeedsDisplay(self.brushRectForPoint(point))
    }
    func brushRectForPoint(_ point: CGPoint) -> CGRect {
        return CGRect(x: point.x - 16, y: point.y - 16, width: 16, height: 16)
    }

    override func draw(_ rect: CGRect) {
//        UIColor.clear.setFill()
//        UIColor.red.setStroke()
//        path.stroke()
        for value in strokes {
            let point = value.cgPointValue
            let brushRect = self.brushRectForPoint(point)
            if rect.intersects(brushRect) {
                UIImage.init(named: "Chalk")?.draw(in: brushRect)
            }
            
        }
    }
}

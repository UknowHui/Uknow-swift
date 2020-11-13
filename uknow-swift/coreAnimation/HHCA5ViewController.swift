//
//  HHCA5ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/9/3.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit
//import GLKit

class HHCA5ViewController: UIViewController {

    @IBOutlet var faces: [UIView]!
    
    struct Test {
        let res1: Bool = false
        let res2: Int = 0
        let res3: Bool = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        print("\(MemoryLayout<Test>.size)")
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        perspective = CATransform3DRotate(perspective, -.pi * 0.25, 1, 0, 0)
        perspective = CATransform3DRotate(perspective, -.pi * 0.25, 0, 1, 0)
        self.view.layer.sublayerTransform = perspective
        
        var transform = CATransform3DMakeTranslation(0, 0, 100)
        self.addFace(index: 0, transform: transform)
        
        transform = CATransform3DMakeTranslation(100, 0, 0)
        transform = CATransform3DRotate(transform, .pi * 0.5, 0, 1, 0)
        self.addFace(index: 1, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, -100, 0)
        transform = CATransform3DRotate(transform, .pi * 0.5, 1, 0, 0)
        self.addFace(index: 2, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 100, 0)
        transform = CATransform3DRotate(transform, -(.pi * 0.5), 1, 0, 0)
        self.addFace(index: 3, transform: transform)
        
        transform = CATransform3DMakeTranslation(-100, 0, 0)
        transform = CATransform3DRotate(transform, -(.pi * 0.5), 0, 1, 0)
        self.addFace(index: 4, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 0, -100)
        transform = CATransform3DRotate(transform, .pi, 0, 1, 0)
        self.addFace(index: 5, transform: transform)

        
        // Do any additional setup after loading the view.
    }
    
    func addFace(index:NSInteger, transform:CATransform3D) -> Void {
        let face : UIView = faces[index]
        self.view.addSubview(face)
        
        let containerSize = self.view.bounds.size
        face.center = CGPoint.init(x: containerSize.width / 2.0, y: containerSize.height / 2.0)
        face.layer.transform = transform
        self.applyLightingToFace(face: face.layer)
    }
    
    func applyLightingToFace(face:CALayer) -> Void {
        let layer = CALayer()
        layer.frame = face.bounds
        face.addSublayer(layer)
        let transform : CATransform3D = face.transform
//        *(GLKMatrix4 *)&transform
//        var transform2 = CATransform3D()
//        var matrix4 = GLKMatrix4Identity
//        withUnsafeMutablePointer(to: &transform) { mat in
//            mat.withMemoryRebound(to: GLKMatrix4.self, capacity: 1) { mat1 in
//                print(mat1)
//            }
//        }

//        let matrix4 : GLKMatrix4 = GLKMatrix4Make(Float(transform.m11), Float(transform.m12), Float(transform.m13), Float(transform.m14), Float(transform.m21), Float(transform.m22), Float(transform.m23), Float(transform.m24), Float(transform.m31), Float(transform.m32), Float(transform.m33), Float(transform.m34), Float(transform.m41), Float(transform.m42), Float(transform.m43), Float(transform.m44))
//        let matrix3: GLKMatrix3 = GLKMatrix4GetMatrix3(matrix4)
//        var normal: GLKVector3 = GLKVector3Make(0, 0, 1)
//        normal = GLKMatrix3MultiplyVector3(matrix3, normal)
//        normal = GLKVector3Normalize(normal)
//        
//        let light: GLKVector3  = GLKVector3Normalize(GLKVector3Make(0, 1, -0.5))
//        let dotProduct:Float = GLKVector3DotProduct(light, normal)
//        let shadow: Float = 1 + dotProduct - 0.5
//        layer.backgroundColor = UIColor.init(white: 0, alpha: CGFloat(shadow)).cgColor
        
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

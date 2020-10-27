//
//  HHCA6ViewController.swift
//  uknow-swift
//
//  Created by uknow on 2020/9/11.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit
import AVFoundation

class HHCA6ViewController: UIViewController, CALayerDelegate {
    
    var containerView = UIView()
    
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
//        let path: UIBezierPath = UIBezierPath.init()
//        path.move(to: CGPoint.init(x: 175, y: 200))
//        path.addArc(withCenter: CGPoint.init(x: 150, y: 200), radius: 25, startAngle: 0, endAngle: .pi*2, clockwise: true)
//
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        self.view.layer.addSublayer(shapeLayer)
//
//        let textLayer = CATextLayer()
//        textLayer.frame = CGRect(x: 0, y: 300, width: 375, height: 200)
//        self.view.layer.addSublayer(textLayer)
//
//        textLayer.foregroundColor = UIColor.black.cgColor
//        textLayer.alignmentMode = .justified
//        textLayer.isWrapped = true
//        textLayer.contentsScale = UIScreen.main.scale
//
//        let font = UIFont.systemFont(ofSize: 50.0)
//        textLayer.font = font
//        textLayer.fontSize = font.pointSize
//
//        let text = "asldkjaslkdjaslkdjaslkdj"
//
//        textLayer.string = text

        // Do any additional setup after loading the view.
        
//        containerView.frame = CGRect(x: 0, y: 500, width: 414, height: 300)
//        containerView.backgroundColor = .white
//        self.view.addSubview(containerView)
        
//        self.loadCATransformLayer()
//        self.loadCAReplicatorLayer()
//        self.loadReflectionView()
        
//        scrollView.frame = CGRect(x: 0, y: 500, width: 414, height: 300)
//        scrollView.backgroundColor = .white
//        self.view.addSubview(scrollView)
//
//        self.loadCatiledLayer()
        
//        self.loadCAEmitterLayer()

        self.loadAVPlayerLayer()
    }
    
    func loadAVPlayerLayer() {
        let URL = Bundle.main.url(forResource: "Ship", withExtension: "mp4")
        let player = AVPlayer.init(url: URL!)
        let playerLayer = AVPlayerLayer.init(player: player)
        
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, .pi * 0.25, 1, 1, 0);
        playerLayer.transform = transform
        
        playerLayer.masksToBounds = true;
        playerLayer.cornerRadius = 20.0
        playerLayer.borderColor = UIColor.red.cgColor
        playerLayer.borderWidth = 5.0
        
        player.play()
        
    }
    
    func loadCAEmitterLayer() {
        let emitter = CAEmitterLayer()
        emitter.frame = self.view.bounds
        self.view.layer.addSublayer(emitter)

        emitter.renderMode = .additive
        emitter.emitterPosition = CGPoint(x: emitter.width / 2.0, y: emitter.height / 2.0)
        
        let cell = CAEmitterCell()
        cell.contents = UIImage.init(named: "Spark")?.cgImage
        cell.birthRate = 150
        cell.lifetime = 5.0
        cell.color = UIColor.init(red: 1, green: 0.5, blue: 0.1, alpha: 1).cgColor
        cell.alphaSpeed = -0.4
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = .pi * 2
        emitter.emitterCells = [cell]
        
        
    }
    
    func loadCatiledLayer() {
        let tileLayer = CATiledLayer()
        tileLayer.frame = CGRect(x: 0, y: 0, width: 2048, height: 2048)
        tileLayer.delegate = self
        scrollView.layer.addSublayer(tileLayer)
        scrollView.contentSize = tileLayer.frame.size
        tileLayer.setNeedsDisplay()
    }
    func draw(_ layer: CALayer, in ctx: CGContext) {
        let bounds: CGRect = ctx.boundingBoxOfClipPath
        let layer1 = layer as! CATiledLayer
        let x: Int = Int(bounds.origin.x / layer1.tileSize.width)
        let y: Int = Int(bounds.origin.y / layer1.tileSize.height)
        
        let imageName = "Snowman_0\(x)_0\(y)"
        let tileImage: UIImage = UIImage.init(named: imageName)!
        
        UIGraphicsPushContext(ctx)
        tileImage.draw(in: bounds)
        UIGraphicsPopContext()
    }
    
    func loadReflectionView() {
        let view1 = ReflectionView.init(frame: CGRect(x: 0, y: 200, width: 200, height: 200))
        let imageview1 = UIImageView.init(frame: view1.bounds)
        imageview1.image = UIImage.init(named: "mvBackground")
        view1.addSubview(imageview1)
        self.view.addSubview(view1)
    }
    
    func loadCAReplicatorLayer() -> Void {
        let replicator = CAReplicatorLayer()
        replicator.frame = self.containerView.bounds
        self.containerView.layer.addSublayer(replicator)
        
        replicator.instanceCount = 10;
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 200, 0)
        transform = CATransform3DRotate(transform, .pi * 0.2, 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -200, 0)
        replicator.instanceTransform = transform
        
        replicator.instanceBlueOffset = -0.1
        replicator.instanceGreenOffset = -0.1
        
        let layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.white.cgColor
        replicator.addSublayer(layer)
    }
    
    func loadCATransformLayer() -> Void {
        
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        containerView.layer.sublayerTransform = pt
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, 100, 100, 0)
        let cube1 = cubeWithTransform(transfrom: c1t)
        self.containerView.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 250, 100, 0)
        c2t = CATransform3DRotate(c2t, .pi * 0.25, 1, 0, 0)
        c2t = CATransform3DRotate(c2t, .pi * 0.25, 0, 1, 0)
        let cube2 = cubeWithTransform(transfrom: c2t)
        self.containerView.layer.addSublayer(cube2)
    }
    
    func cubeWithTransform(transfrom: CATransform3D) -> CALayer {
        
        let cube = CATransformLayer()
        
        var ct: CATransform3D = CATransform3DIdentity
        ct = CATransform3DTranslate(ct, 0, 0, 50)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, .pi * 0.5, 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, .pi * 0.5, 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -(.pi * 0.5), 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -(.pi * 0.5), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, .pi, 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: ct))
        
        cube.transform = transfrom
        return cube
    }
    
    func faceWithTransform(transform: CATransform3D) ->CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        let red = CGFloat(CGFloat(arc4random()) / CGFloat(UINT32_MAX))
        face.backgroundColor = UIColor.init(red: red, green: CGFloat(arc4random()) / CGFloat(Double(UINT32_MAX)), blue: CGFloat(arc4random()) / CGFloat(Double(UINT32_MAX)), alpha: 1.0).cgColor
        face.transform = transform
        return face
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

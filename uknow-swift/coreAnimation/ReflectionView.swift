//
//  ReflectionView.swift
//  uknow-swift
//
//  Created by uknow on 2020/9/15.
//  Copyright © 2020 uknow. All rights reserved.
//

import UIKit

class ReflectionView: UIView {
    
    override class var layerClass: AnyClass {
        return CAReplicatorLayer.classForCoder()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func draw(_ rect: CGRect) {
        self.setUp()
    }
    
    func setUp() {
        let layer = self.layer as! CAReplicatorLayer
        layer.instanceCount = 2
        var transform = CATransform3DIdentity
        let verticalOffset = self.bounds.size.height + 2
        transform = CATransform3DTranslate(transform, 0, verticalOffset, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        layer.instanceTransform = transform
        layer.instanceAlphaOffset = -0.6
    }

}

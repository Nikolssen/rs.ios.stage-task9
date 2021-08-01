//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    private let shapeLayer: CAShapeLayer = {
       let shapeLayer = CAShapeLayer()
        return shapeLayer
    }()
    
    var path: CGPath!{
        willSet{
            shapeLayer.path = newValue
        }
    }
    
    override var tintColor: UIColor! {
        willSet {
            shapeLayer.strokeColor = newValue.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func startAnimation(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.autoreverses = false
        layer.add(animation, forKey: "line")
    }
    func stopAnimation(){
        layer.removeAnimation(forKey: "line")
    }
    func commonInit(){
        layer.addSublayer(shapeLayer)
        
    }
    override func layoutSubviews() {
        shapeLayer.frame = contentView.bounds
    }
}

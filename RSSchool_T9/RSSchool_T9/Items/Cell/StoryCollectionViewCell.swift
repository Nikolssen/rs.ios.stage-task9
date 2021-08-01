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
        shapeLayer.removeAnimation(forKey: "line")
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.autoreverses = false
        shapeLayer.add(animation, forKey: "line")
    }
    func stopAnimation(){
        shapeLayer.removeAnimation(forKey: "line")
    }
    func commonInit(){
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeEnd = 1
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.frame = contentView.bounds
    }
}

//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan Budovich
// On: 7/30/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CollectionViewCell: UICollectionViewCell {
    override class var requiresConstraintBasedLayout: Bool {
        get {
            true
        }
    }
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        gradientLayer.locations = [0.74, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 01)
 
        return gradientLayer
    }()
    
    let topLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
         label.font = UIFont(name: "Rockwell", size: 12)
         label.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        contentView.addSubview(imageView)
        imageView.layer.addSublayer(gradientLayer)
        contentView.addSubview(topLabel)
        contentView.addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15), bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18), topLabel.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: -5), topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
                                     topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])

        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.width - 16, height: bounds.height - 20)
        imageView.layer.cornerRadius = frame.height / 20
        layer.cornerRadius = frame.width / 10
    }
}

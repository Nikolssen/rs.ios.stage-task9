//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TitleView: UIView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel  = {
        let label =  UILabel()
        label.font = UIFont(name: "Rockwell", size: 48)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var type: String = "" {
        willSet{
            descriptionLabel.text = newValue
        }
    }
    private let descriptionLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont(name: "Rockwell", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .black
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.51, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 01)
 
        return gradientLayer
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit(){
        backgroundColor = .clear
        imageView.layer.addSublayer(gradientLayer)
        addSubview(imageView)
        imageView.addSubview(titleLabel)
        descriptionView.addSubview(descriptionLabel)
        addSubview(descriptionView)
       
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            descriptionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 40),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 8),
            descriptionLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - 20)
    }
}

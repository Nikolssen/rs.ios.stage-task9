//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TextFrame: UIView {


    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Rockwell", size: 25)
        label.textColor = UIColor.white
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

    func commonInit(){
        addSubview(textLabel)
        layer.cornerRadius = 8
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        
        NSLayoutConstraint.activate([textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30), textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30), textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40), textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }

}

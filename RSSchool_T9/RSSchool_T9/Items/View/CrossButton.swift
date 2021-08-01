//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CrossButton: UIButton {

    override var buttonType: UIButton.ButtonType { get{ .custom  }  }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    func commonInit(){
        setImage(UIImage("cross").withTintColor(.white), for: .normal)
        setImage(UIImage("cross").withTintColor(UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)), for: .highlighted)
        imageView?.tintColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

}

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

    override var buttonType: UIButton.ButtonType {
        get{
            .custom
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func awakeFromNib() {
        commonInit()
    }
    
    func commonInit(){
        imageView?.image = UIImage("cross")
        imageView?.tintColor = .white
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}

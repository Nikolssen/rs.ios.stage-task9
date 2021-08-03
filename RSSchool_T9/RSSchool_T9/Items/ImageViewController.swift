//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageViewController: UIViewController {

    let crossButton: CrossButton = CrossButton(frame: .zero)
    var imageScrollView = ImageScrollView(frame: .zero)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageScrollView)
        view.addSubview(crossButton)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showCloseButton)))
        crossButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        NSLayoutConstraint.activate([imageScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             imageScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             imageScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             imageScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             
             crossButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
             crossButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
             crossButton.heightAnchor.constraint(equalToConstant: 40),
             crossButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        imageScrollView.layoutSubviews()
        imageScrollView.zoomScale = imageScrollView.minimumZoomScale
        print(imageScrollView.contentSize)
    }
    
    @objc func showCloseButton(){
        crossButton.isHidden.toggle()
    }
    
    @objc func dismissModal(){
        dismiss(animated: true, completion: nil)
    }

}

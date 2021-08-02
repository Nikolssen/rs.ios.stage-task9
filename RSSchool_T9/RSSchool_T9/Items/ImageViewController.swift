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

    var imageScrollView = ImageScrollView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageScrollView)
        NSLayoutConstraint.activate([imageScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             imageScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             imageScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             imageScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        imageScrollView.zoomScale = imageScrollView.minimumZoomScale
        print(imageScrollView.contentSize)
    }
    
    

}

//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate{

    let zoomImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commontInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commontInit()
    }
    
    func commontInit(){
        addSubview(zoomImageView)
        delegate = self
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    func setImage(image: UIImage){
        zoomImageView.image = image
        zoomImageView.contentMode = .scaleAspectFit
        setCurrentMaximumAndMinimumZoomScale()
    }

    func centerImage(){
        let boundsSize = self.bounds.size
        var frameToCenter = zoomImageView.frame
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width)/2
        }
        else {
            frameToCenter.origin.x = 0
        }
        if frameToCenter.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.height)/2
        }
        else {
            frameToCenter.origin.y = 0
        }
        zoomImageView.frame = frameToCenter
        
    }
    
    func setCurrentMaximumAndMinimumZoomScale(){
        
        let imageSize = zoomImageView.image!.size
        
        let xScale = bounds.width / imageSize.width
        let yScale = bounds.height / imageSize.height
        let minScale = min(xScale, yScale)
        self.minimumZoomScale = minScale
        self.maximumZoomScale = minScale * 3
        print(minScale)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentSize = zoomImageView.bounds.size
        centerImage()
        setCurrentMaximumAndMinimumZoomScale()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomImageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}

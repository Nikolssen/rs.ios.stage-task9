//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ModalViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let contentView = UIView()
    
    
    let contentType: ContentType!
    let titleView = TitleView()
    let crossButton = CrossButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        commonInit()
        

        
        setupGallery()
        setupStory()

        
    }
    
    init(type: ContentType){
        self.contentType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    func commonInit(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor), contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                     contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)])
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor), scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor), scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        contentView.addSubview(crossButton)
        NSLayoutConstraint.activate([crossButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25), crossButton.heightAnchor.constraint(equalToConstant: 40), crossButton.widthAnchor.constraint(equalToConstant: 40), crossButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)])
        
        contentView.addSubview(titleView)
        NSLayoutConstraint.activate([titleView.topAnchor.constraint(equalTo: crossButton.bottomAnchor, constant: 30), titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), titleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), titleView.heightAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 104/75)])
        
        contentView.addSubview(line)
        NSLayoutConstraint.activate([line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100), line.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), line.heightAnchor.constraint(equalToConstant: 1), line.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 40)])
        
    }
    
    func setupGallery(){
        switch contentType {
        case let .gallery(gallery):
            titleView.imageView.image = gallery.coverImage
            titleView.titleLabel.text = gallery.title
            titleView.type = "Gallery"
            
            let imageViews: [FrameView] = gallery.images.map{
                let frameView = FrameView()
                frameView.imageView.image = $0
                frameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showImage)))
                return frameView
            }
            
            let stackView = UIStackView(arrangedSubviews: imageViews)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            contentView.addSubview(stackView)
            NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40), stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: (1.36 * CGFloat(imageViews.count)), constant: CGFloat((imageViews.count - 1) * 20))])
            
            
            
        default:
            break
        }
    }
    
    func setupStory(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func dismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showImage(){
        
    }
    
}

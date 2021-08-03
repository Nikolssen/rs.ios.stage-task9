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
    private var collectionView: UICollectionView?
    let gallery: Gallery!
    let story: Story!
    let titleView = TitleView()
    let crossButton = CrossButton(frame: .zero)
    let color: UIColor
    let shouldAnimate: Bool
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        commonInit()
        
        
        
        setupGallery()
        setupStory()
        
        
    }
    override func viewDidLayoutSubviews() {
        print(contentView.frame)
        print(scrollView.bounds)
        scrollView.contentSize = contentView.frame.size
    }
    
    init(type: ContentType, color: UIColor, shouldAnimate: Bool){
        switch type {
        case let .gallery(gallery):
            self.gallery = gallery
            self.story = nil
        case let .story(story):
            self.story = story
            self.gallery = nil
        }
        self.color = color
        self.shouldAnimate = shouldAnimate
        super.init(nibName: nil, bundle: nil)
    }
    
    func commonInit(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        crossButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(crossButton)
        contentView.addSubview(titleView)
        contentView.addSubview(line)
        
        
        NSLayoutConstraint.activate([
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
          contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
          contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
          scrollView.topAnchor.constraint(equalTo: view.topAnchor),
          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                        
          crossButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
          crossButton.heightAnchor.constraint(equalToConstant: 40),
          crossButton.widthAnchor.constraint(equalToConstant: 40),
          crossButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
          titleView.topAnchor.constraint(equalTo: crossButton.bottomAnchor, constant: 30),
          titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
          titleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
          titleView.heightAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 104/75),
          line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
          line.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
          line.heightAnchor.constraint(equalToConstant: 1),
          line.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 40)
        ])
        
        
    }
    
    func setupGallery(){
        if gallery != nil {
            
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
            NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40), stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: (1.36 * CGFloat(imageViews.count)), constant: CGFloat((imageViews.count - 1) * 20)), stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)])
        }
    }
    
    func setupStory(){
        if story != nil {
            
            titleView.imageView.image = story.coverImage
            titleView.titleLabel.text = story.title
            titleView.type = "Story"
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            self.collectionView = collectionView
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCell")
            
            contentView.addSubview(collectionView)
            
            NSLayoutConstraint.activate([collectionView.leadingAnchor .constraint(equalTo: contentView.leadingAnchor), collectionView.widthAnchor.constraint(equalTo: view.widthAnchor), collectionView.heightAnchor.constraint(equalToConstant: 100), collectionView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40)])
            let textFrame = TextFrame()
            
            textFrame.textLabel.text = story.text
            contentView.addSubview(textFrame)
            textFrame.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([textFrame.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40), textFrame.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), textFrame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), textFrame.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func dismissModal(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showImage(_ recognizer: UITapGestureRecognizer){
        if let imageView = recognizer.view as? FrameView{
            let imageVC = ImageViewController()

            imageVC.modalPresentationStyle = .fullScreen
            present(imageVC, animated: true, completion: nil)
            imageVC.imageScrollView.setImage( image: imageView.imageView.image!)
            print(imageView.imageView.image!.size)
            imageVC.view.backgroundColor = .black
        }
    }
    
}

extension ModalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story.paths.count 
    }

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return Int(story.paths.count / 2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCollectionViewCell
        cell.tintColor = color
        cell.path = story.paths[indexPath.item]
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if shouldAnimate {
            (cell as! StoryCollectionViewCell).startAnimation()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if shouldAnimate {
            (cell as! StoryCollectionViewCell).stopAnimation()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 50, bottom: 18, right: 50)
    }


}

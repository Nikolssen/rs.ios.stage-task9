//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsViewController: UIViewController {

    var shouldAnimate: Bool = true
    var color: UIColor = UIColor(red: 0.953, green: 0.686, blue: 0.133, alpha: 1)
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.collectionView = collectionView
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")

        NSLayoutConstraint.activate([ collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0), collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor), collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0), collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor) ])
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.safeAreaLayoutGuide.layoutFrame.width - 65) / 2
        return CGSize(width: width, height: width*11/9)
    }

}

extension ItemsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.1
        switch FillingData.data[indexPath.item] {
        case .story(let story):
            cell.imageView.image = story.coverImage
            cell.bottomLabel.attributedText = NSMutableAttributedString(string: "Story", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            cell.topLabel.attributedText = NSMutableAttributedString(string: story.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        case .gallery(let gallery):
            cell.imageView.image = gallery.coverImage
            cell.bottomLabel.attributedText = NSMutableAttributedString(string: "Gallery", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            cell.topLabel.attributedText = NSMutableAttributedString(string: gallery.title, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
        return cell
    }
    
}

extension ItemsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let modalVC = ModalViewController(type: FillingData.data[indexPath.item], color: color, shouldAnimate: shouldAnimate)

        modalVC.modalPresentationStyle = .custom
        present(modalVC, animated: true, completion: nil)
    }
}

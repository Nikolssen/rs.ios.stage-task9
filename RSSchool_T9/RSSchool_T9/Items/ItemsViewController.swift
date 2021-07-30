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
    
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 220)
    }
}

extension ItemsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage("tesla-0")
        cell.topLabel.text = "tesla"
        cell.bottomLabel.text = "Story"
        return cell
    }
    
}

extension ItemsViewController: UICollectionViewDelegate{
    
}

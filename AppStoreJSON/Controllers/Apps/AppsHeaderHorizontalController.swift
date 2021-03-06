//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import UIKit

class AppsHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "CellID11"
    
    var soicalApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soicalApps.count 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppHeaderCell
        let app = soicalApps[indexPath.row]
        cell.companyLabel.text = app.name
        cell.titleLabel.text = app.tagline
        cell.imageView.sd_setImage(with: URL(string: app.imageUrl))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40,
                     height: view.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: 16, bottom: 0, right: 16)
//    }
    
}

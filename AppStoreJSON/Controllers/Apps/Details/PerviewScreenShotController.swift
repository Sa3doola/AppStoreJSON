//
//  PerviewScreenShotController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/21/20.
//

import UIKit

class PerviewScreenShotController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let screenShotID = "sreenShotID"
    
    var app: Result! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: screenShotID)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenShotID, for: indexPath) as! ScreenShotCell
        let url = self.app?.screenshotUrls[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: url ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}

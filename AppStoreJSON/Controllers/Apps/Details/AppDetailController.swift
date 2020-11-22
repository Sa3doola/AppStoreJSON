//
//  AppDetailController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/21/20.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let detailCellID = "detailCellID"
    let perviewCellID = "perviewCellID"
    let reviewCellID = "reviewCellID"
    
    fileprivate let appID: String
    
    var app: Result?
    var reviews: Reviews?
    
    //dependency injection constructor
    init(appId: String) {
        self.appID = appId
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellID)
        collectionView.register(PerviewCell.self, forCellWithReuseIdentifier: perviewCellID)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellID)
        navigationItem.largeTitleDisplayMode = .never
        
        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://itunes.apple.com/lookup?id=\(appID)"
        Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
            
            
            let app = result?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appID)/sortby=mostrecent/json?l=en&cc=us"
        Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews? , error) in
            if let error = error {
                print("Failed to decode reviews: \(error)")
                return
            }
            self.reviews = reviews
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellID, for: indexPath) as! AppDetailCell
            cell.app = app
            
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: perviewCellID, for: indexPath) as! PerviewCell
            cell.horizontalController.app = self.app
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellID, for: indexPath) as! ReviewRowCell
            cell.reviewController.reviews = self.reviews
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // calculate the necssary size for our cell
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            dummyCell.app = app
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
}

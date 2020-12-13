//
//  AppsSearchController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/15/20.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please enter search term above...."
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        setupSearchBar()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        // fetchITunsApps()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // introduce some delay before performing search
        // throttling the search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApp(searchItem: searchText) { (result, error) in
                if let error = error {
                    print("Failed to fetch apps: \(error)")
                    return
                }
                
                self.appResults = result?.results ?? [];               DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    
    
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunsApps() {
        Service.shared.fetchApp(searchItem: "Twitter") { (results, error) in
            
            if let err = error {
                print("Failed to fetch apps: \(err)")
                return
            }
            
            self.appResults = results?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = String(appResults[indexPath.item].trackId)
        let appDetailController = AppDetailController(appId: appId)
            navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    
    
    
}

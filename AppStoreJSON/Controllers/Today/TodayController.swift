//
//  TodayController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import UIKit

class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    //    let toCellID = "toCellID"
    //    let mutipleCellID = "mutipleCellID"
    
    //    let items = [
    //        TodayItem.init(category: "LIFE BETTER", title: "Utilizing your Time", image: #imageLiteral(resourceName: "Image"), description: "All the tools and apps you need to intelligently organize your life to right way.", backgroundColor: .white, cellType: .single),
    //        TodayItem.init(category: "The DAILY LIST", title: "Test-Drive These CarPlay Apps", image: #imageLiteral(resourceName: "Image"), description: "", backgroundColor: .white, cellType: .multiple),
    //        TodayItem.init(category: "HOLIDAYS", title: "Travel on Budget", image: #imageLiteral(resourceName: "Holiday"), description: "All the tools and apps you need to intelligently organize your life to right way.", backgroundColor: #colorLiteral(red: 0.9834888577, green: 0.9667972922, blue: 0.7200905681, alpha: 1), cellType: .single),
    //        TodayItem.init(category: "MUITIPLE Cell", title: "Test-Drive These CarPlay Apps", image: #imageLiteral(resourceName: "Image"), description: "", backgroundColor: .white, cellType: .multiple)
    //
    //    ]
    
    var items = [TodayItem]()
    
    let activityInddicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(activityInddicatorView)
        activityInddicatorView.centerInSuperview()
        
        fetchData()
        
        collectionView.backgroundColor = .secondarySystemBackground
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.Celltype.single.rawValue)
        collectionView.register(TodayMutipleAppCell.self, forCellWithReuseIdentifier: TodayItem.Celltype.multiple.rawValue)
    }
    
    fileprivate func fetchData() {
        //dispatchGroup
        
        let dispatchGroup = DispatchGroup()
        
        var topGrossingGroup: AppGroup?
        var gamesGroup: AppGroup?
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, error) in
            topGrossingGroup = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, error) in
            gamesGroup = appGroup
            dispatchGroup.leave()
        }
        
        //completion block
        dispatchGroup.notify(queue: .main) {
            self.activityInddicatorView.stopAnimating()
            print("Finished fetching")
            
            self.items = [
                TodayItem.init(category: "The DAILY LIST", title: topGrossingGroup?.feed.title ?? "", image: #imageLiteral(resourceName: "Image"), description: "", backgroundColor: .white, cellType: .multiple, apps: topGrossingGroup?.feed.results ?? []),
                TodayItem.init(category: "LIFE BETTER", title: "Utilizing your Time", image: #imageLiteral(resourceName: "Image"), description: "All the tools and apps you need to intelligently organize your life to right way.", backgroundColor: .white, cellType: .single, apps: []),
                TodayItem.init(category: "The DAILY LIST", title: gamesGroup?.feed.title ?? "", image: #imageLiteral(resourceName: "Image"), description: "", backgroundColor: .white, cellType: .multiple, apps: gamesGroup?.feed.results ?? [])
            ]
            
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = items[indexPath.item].cellType.rawValue
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BaseTodayCell
        
        cell.todayItem = items[indexPath.item]
    
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 24, left: 0, bottom: 24, right: 0)
    }
    
    var appFullscreenController: AppFullScreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullscreenController = AppFullScreenController()
        appFullscreenController.todayItem = items[indexPath.item]
        appFullscreenController.dismisshandler = {
            self.handelRemoveFullscreen()
        }
        let fullscreenView = appFullscreenController.view!
        fullscreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handelRemoveFullscreen)))
        view.addSubview(fullscreenView)
        
        addChild(appFullscreenController)
        
        self.appFullscreenController = appFullscreenController
        
        self.collectionView.isUserInteractionEnabled = false
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        // absolute coordindates of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        
        self.view.layoutIfNeeded()
        
        fullscreenView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
            guard let cell = self.appFullscreenController.tableView.cellForRow(at: [0,0]) as? AppFullscreenHeaderCell else { return }
            
            cell.todayCell.topConstraint?.constant = 48
            cell.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    
    @objc func handelRemoveFullscreen() {
        
        // access starting frame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.appFullscreenController.tableView.contentOffset = .zero
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            
            guard let cell = self.appFullscreenController.tableView.cellForRow(at: [0,0]) as? AppFullscreenHeaderCell else { return }
            
            cell.todayCell.topConstraint?.constant = 24
            cell.layoutIfNeeded()
            
        }, completion: { _ in
            self.appFullscreenController.view.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
        })
    }
}

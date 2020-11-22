//
//  TodayController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import UIKit

class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let toCellID = "toCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .secondarySystemBackground
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: toCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: toCellID, for: indexPath) as! TodayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Animate fullscreen somehow...")
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 16
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handelRemoveRedView)))
        view.addSubview(redView)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        // absolute coordindates of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        redView.frame = startingFrame
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    
    @objc func handelRemoveRedView(gesture: UIGestureRecognizer) {
        
        // access starting frame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
        })
    }
    
    
}

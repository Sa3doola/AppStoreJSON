//
//  AppsPageHeader.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorizontralController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontralController.view)
        appHeaderHorizontralController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

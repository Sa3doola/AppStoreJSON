//
//  BaseListController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import UIKit

class BaseListController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

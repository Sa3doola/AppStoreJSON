//
//  BackEnableNavigationController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 12/12/20.
//

import UIKit

class BackEnableNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}

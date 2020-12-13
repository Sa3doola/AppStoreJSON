//
//  ViewController.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/15/20.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: TodayController(), title: "Today", imageName: "today"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: MusicController(), title: "Music", imageName: "music")
           
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)  
        return navController
    }

}


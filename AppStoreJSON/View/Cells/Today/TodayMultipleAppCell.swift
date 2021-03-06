//
//  TodayMultipleAppCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/24/20.
//

import UIKit

class TodayMutipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            categoryLabel.tintColor = .label
            titleLabel.text = todayItem.title
            titleLabel.tintColor = .label
            mutipleAppsController.apps = todayItem.apps
            mutipleAppsController.collectionView.reloadData()
            backgroundColor = todayItem.backgroundColor
        }
    }
    
    let categoryLabel = UILabel(text: "Life Better", font: .boldSystemFont(ofSize: 20))
    
    let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 30), numberOfLines: 2)
    
    let mutipleAppsController = TodayMultipleAppsController(mode: .small)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        layer.cornerRadius = 16
        
        let stackView = VerticalStackView(arrangedSubViews: [
            categoryLabel, titleLabel, mutipleAppsController.view
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

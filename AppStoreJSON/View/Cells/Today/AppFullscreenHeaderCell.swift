//
//  AppFullscreenHeaderCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/24/20.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

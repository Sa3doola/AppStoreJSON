//
//  AppFullscreenCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import UIKit

class AppFullscreenCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Great games", attributes: [.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: "\nare all about of details, from subtle visual effects to imagintive art style. In these titles, you are sure to find something to marvel at, whether your are info fantasy worlds or neon soaked dartboards.", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\nGreat games", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "\nare all about of details, from subtle visual effects to imagintive art style. In these titles, you are sure to find something to marvel at, whether your are info fantasy worlds or neon soaked dartboards.", attributes: [.foregroundColor: UIColor.gray]))
        
        
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AppHeaderCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 10)
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 15))
    
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 26))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.numberOfLines = 2
        companyLabel.textColor = .link
        let stackView = VerticalStackView(arrangedSubViews: [
            companyLabel, titleLabel, imageView
        ], spacing: 10)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

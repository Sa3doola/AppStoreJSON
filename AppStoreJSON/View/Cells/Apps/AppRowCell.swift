//
//  AppRowCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 10)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    let companyName = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .green
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 16
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubViews: [nameLabel, companyName], spacing: 5), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

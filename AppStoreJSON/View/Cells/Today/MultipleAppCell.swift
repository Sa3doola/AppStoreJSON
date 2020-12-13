//
//  MultipleAppCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/24/20.
//

import UIKit

class MultipleAppCell: UICollectionViewCell {
    
    var app: FeedResult! {
        didSet {
            nameLabel.text = app.name
            nameLabel.tintColor = .label
            companyName.text = app.artistName
            companyName.tintColor = .label
            imageView.sd_setImage(with: URL(string: app.artworkUrl100))
        }
    }
    
    let imageView = UIImageView(cornerRadius: 10)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    let companyName = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        [nameLabel, companyName].forEach{$0.textColor = .label}
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .secondarySystemFill
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 16
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubViews: [nameLabel, companyName], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
        
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: nameLabel.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0), size: .init(width: 0, height: 0.5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  TodayCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            categoryLabel.tintColor = .label
            titleLabel.text = todayItem.title
            titleLabel.tintColor = .label
            imageView.image = todayItem.image
            descriptionLabel.text = todayItem.description
            descriptionLabel.tintColor = .label
            backgroundColor = todayItem.backgroundColor
        }
    }
    
    let categoryLabel = UILabel(text: "Life Better", font: .boldSystemFont(ofSize: 20))
        
    
    let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 28))
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Image"))
    
    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life to right way.", font: .systemFont(ofSize: 18), numberOfLines: 3)

    var topConstraint: NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        clipsToBounds = true
        layer.cornerRadius = 16
        
        let imageViewContainer = UIView()
        imageViewContainer.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
        imageView.contentMode = .scaleAspectFill
        
        let stackView = VerticalStackView(arrangedSubViews: [
            categoryLabel, titleLabel,
            imageViewContainer, descriptionLabel
        ], spacing: 10)
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint?.isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

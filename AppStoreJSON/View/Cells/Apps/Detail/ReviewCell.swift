//
//  ReviewCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    
    let titleLabel = UILabel(text: "Review title", font: .boldSystemFont(ofSize: 20))
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 18))
    
    let starStackView: UIStackView = {
        var arrangedSubview = [UIView]()
        (0..<5).forEach { (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "Star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubview.append(imageView)
        }
        arrangedSubview.append(UIView())
        
       let stackView = UIStackView(arrangedSubviews: arrangedSubview)
        return stackView
    }()
    
    let bodyLabel = UILabel(text: "Review body/ Review body/ Review body/ Review body/", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubViews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            starStackView,
            bodyLabel
        ], spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//
//  PerviewCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/21/20.
//

import UIKit

class PerviewCell: UICollectionViewCell {
    
    let perviewLabel = UILabel(text: "Perview", font: .boldSystemFont(ofSize: 26))
    
    let horizontalController = PerviewScreenShotController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(perviewLabel)
        perviewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: perviewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

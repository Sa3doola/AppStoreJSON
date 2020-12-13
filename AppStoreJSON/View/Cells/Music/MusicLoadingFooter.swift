//
//  MusicLoadingFooter.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 12/13/20.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        
        let label = UILabel(text: "Loading more...", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        
        let stackView = VerticalStackView(arrangedSubViews: [aiv, label], spacing: 8)
        
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

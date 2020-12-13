//
//  SearchResultCell.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/15/20.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLbl.text = appResult.trackName
            categoryLbl.text = appResult.primaryGenreName
            ratingsLbl.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url =  URL(string: appResult.artworkUrl100 )
            appIconImageView.sd_setImage(with: url)
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![0]))
            if appResult.screenshotUrls!.count > 1 {
                screenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![1]))
            }
            if appResult.screenshotUrls!.count > 2 {
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls![2]))
            }
        }
    }
    
     let appIconImageView: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
     let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "App Name"
        return lbl
    }()
    
    let categoryLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Photos & Videos"
        return lbl
    }()
    
     let ratingsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "9.26M"
        return lbl
    }()
    
     let getButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Get", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = UIColor(white: 0.95, alpha: 1)
        btn.layer.cornerRadius = 16
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return btn
    }()
    
    lazy var screenShot1ImageView = self.createScreenShotImageView()
    lazy var screenShot2ImageView = self.createScreenShotImageView()
    lazy var screenShot3ImageView = self.createScreenShotImageView()
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, VerticalStackView(arrangedSubViews: [
                nameLbl, categoryLbl, ratingsLbl
            ]), getButton
        ])
        
        infoTopStackView.spacing = 15
        infoTopStackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
            screenShot1ImageView, screenShot2ImageView, screenShot3ImageView
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let overStackView = VerticalStackView(arrangedSubViews: [
                                                infoTopStackView, screenShotStackView], spacing: 16)
        
        addSubview(overStackView)
        overStackView.fillSuperview(padding: .init(top: 15, left: 15, bottom: 15, right: 15))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

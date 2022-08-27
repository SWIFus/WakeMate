//
//  BadgeCell.swift
//  wakemate
//
//  Created by BoMin on 2022/08/27.
//

import UIKit

class BadgeCell: UICollectionViewCell {
    static let identifier = "BadgeCell"
    
    let myBadgeView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(myBadgeView)
        
        NSLayoutConstraint.activate([
            self.myBadgeView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.myBadgeView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.myBadgeView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.myBadgeView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myBadgeView.image = nil
    }
    
    func prepare(image: UIImage?) {
        self.myBadgeView.image = image
    }
}


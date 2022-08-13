//
//  BadgeCollectionViewCell.swift
//  wakemate
//
//  Created by BoMin on 2022/08/06.
//

import UIKit

class BadgeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BadgeCollectionViewCell"
    
    private let myBadgeView: UIImageView = {
        let BadgeView = UIImageView()
        BadgeView.clipsToBounds = true
        BadgeView.contentMode = .scaleAspectFill
        BadgeView.layer.masksToBounds = true
        BadgeView.layer.cornerRadius = 25.0
        BadgeView.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        
        return BadgeView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.addSubview(myBadgeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myBadgeView.frame = contentView.bounds
    }
    
    public func configure(with name: String) {
        myBadgeView.image = UIImage(named: name)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myBadgeView.image = nil
    }
    
}

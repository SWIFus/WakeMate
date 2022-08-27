//
//  TeamRankTableViewCell.swift
//  wakemate
//
//  Created by BoMin on 2022/08/26.
//

import UIKit

class TeamRankTableViewCell: UITableViewCell {
    
    static let cellID = "CellId"
    
    let nameLabel = UILabel()
    let rankLabel = UILabel()
    let rankImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(nameLabel)
        self.addSubview(rankLabel)
        self.addSubview(rankImage)
        nameLabelAutoLayout()
        rankLabelAutoLayout()
        rankImageAutoLayout()
        rankImage.isHidden = true
    }
    
    func nameLabelAutoLayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func rankLabelAutoLayout() {
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            rankLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func rankImageAutoLayout() {
        rankImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            rankImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rankImage.widthAnchor.constraint(equalToConstant: self.contentView.frame.size.height*0.8),
            rankImage.heightAnchor.constraint(equalToConstant: self.contentView.frame.size.height*0.8)
        ])
    }
}


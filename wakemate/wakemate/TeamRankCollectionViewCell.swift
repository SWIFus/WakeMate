//
//  TeamRankCollectionViewCell.swift
//  wakemate
//
//  Created by BoMin on 2022/08/07.
//

import UIKit

class TeamRankCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeamRankCollectionViewCell"
    
    private let myTeamRankView: UILabel = {
        let TeamRankView = UILabel()
        TeamRankView.clipsToBounds = true
        TeamRankView.contentMode = .scaleAspectFill
        TeamRankView.layer.masksToBounds = true
        TeamRankView.layer.cornerRadius = 25.0
        //TeamRankView.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        TeamRankView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        TeamRankView.text = "TEAM NAME\nTEAM WAKE UP TIME: 12:00"
        TeamRankView.numberOfLines = 2
        TeamRankView.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        TeamRankView.textAlignment = .center
        
        return TeamRankView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.addSubview(myTeamRankView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myTeamRankView.frame = contentView.bounds
    }
    
//    public func configure(with name: String) {
//        myTeamRankView.im = UIImage(named: name)
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        myTeamRankView.image = nil
//    }
    
}

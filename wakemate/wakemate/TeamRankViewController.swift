//
//  TeamRankViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/07.
//

import UIKit

class TeamRankViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView?
    
//MARK: Rank
    let rank: UILabel = {
        let rankLabel = UILabel()
        
        rankLabel.frame = CGRect(x: 0, y: 0, width: 317, height: 38)
        rankLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        rankLabel.textColor = UIColor(red: 1, green: 0.847, blue: 0.051, alpha: 1)
        rankLabel.font = .boldSystemFont(ofSize: 30)
        rankLabel.text = "RANK"
        
        return rankLabel
    }()
    
    override func viewDidLoad() {
        
        let view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        setAutoLayouts()
        
//MARK: TEAM RANK CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 320, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView?.register(TeamRankCollectionViewCell.self, forCellWithReuseIdentifier: TeamRankCollectionViewCell.identifier)

        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        guard let myCollection = collectionView else {
            return
        }
        self.view.addSubview(myCollection)
    }
    
    func setAutoLayouts() {
        self.view.addSubview(rank)
        
        rankAutoLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 37, y: 152, width: 320, height: 500).integral
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var teamRankCount = 10
        return teamRankCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamRankCollectionViewCell.identifier, for: indexPath) as! TeamRankCollectionViewCell
//        cell.configure(with: "")
        return cell
    }
}

extension TeamRankViewController {
    func rankAutoLayout() {
        rank.translatesAutoresizingMaskIntoConstraints = false
        rank.widthAnchor.constraint(equalToConstant: 317).isActive = true
        rank.heightAnchor.constraint(equalToConstant: 38).isActive = true
        rank.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27).isActive = true
        rank.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
    }
    
}

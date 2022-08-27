//
//  TeamRankViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/07.
//

//import UIKit
//
//class TeamRankViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    struct TeamRank {
//        static var teamName: [String] = ["Team1", "Team2", "Team3", "Team4", "Team5", "Team6", "Team7", "Team8", "Team9", "Team10"]
//        static var teamTime: [String] = ["07:00", "08:00", "09:00", "07:00", "08:00", "09:00", "07:00", "08:00", "09:00", "06:00"]
//    }
//
//    private var collectionView: UICollectionView?
//
////MARK: Rank
//    let rank: UILabel = {
//        let rankLabel = UILabel()
//
//        rankLabel.frame = CGRect(x: 0, y: 0, width: 317, height: 38)
//        rankLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        rankLabel.textColor = UIColor(red: 1, green: 0.847, blue: 0.051, alpha: 1)
//        rankLabel.font = .boldSystemFont(ofSize: 30)
//        rankLabel.text = "RANK"
//
//        return rankLabel
//    }()
//
//    override func viewDidLoad() {
//
//        let view = UILabel()
//
//        view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//
//        setAutoLayouts()
//
////MARK: TEAM RANK CollectionView
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 320, height: 150)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
//        collectionView?.register(TeamRankCollectionViewCell.self, forCellWithReuseIdentifier: TeamRankCollectionViewCell.identifier)
//
//        collectionView?.showsVerticalScrollIndicator = false
//        collectionView?.delegate = self
//        collectionView?.dataSource = self
//        collectionView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//
//        guard let myCollection = collectionView else {
//            return
//        }
//        self.view.addSubview(myCollection)
//    }
//
//    func setAutoLayouts() {
//        self.view.addSubview(rank)
//
//        rankAutoLayout()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView?.frame = CGRect(x: 37, y: 152, width: 320, height: 500).integral
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        var teamRankCount = TeamRank.teamName.count
//        return teamRankCount
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamRankCollectionViewCell.identifier, for: indexPath) as! TeamRankCollectionViewCell
////        cell.configure(with: "")
//        return cell
//    }
//}
//
//extension TeamRankViewController {
//    func rankAutoLayout() {
//        rank.translatesAutoresizingMaskIntoConstraints = false
//        rank.widthAnchor.constraint(equalToConstant: 317).isActive = true
//        rank.heightAnchor.constraint(equalToConstant: 38).isActive = true
//        rank.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27).isActive = true
//        rank.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
//    }
//
//}
//
//extension TeamRankViewController: UICollectionViewDataSource {
//    func collection
//}

import UIKit

class TeamRankViewController: UIViewController {
    let table = UITableView()
    
    class Sect {
        init(teams: [String], ranks:[String]) {
            self.teams = teams
            self.ranks = ranks
        }
        
        let teams: [String]
        let ranks: [String]
    }

    
    let sect: [Sect] = [
        Sect(teams: ["HUFSMate", "Swift", "iOS", "Wake", "Mate", "Early", "Wakeup"], ranks: ["1", "2", "3", "4", "5", "6", "7"]),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
    }
    
    func attribute() {
        table.register(TeamRankTableViewCell.self, forCellReuseIdentifier: TeamRankTableViewCell.cellID)
        table.delegate = self
        table.dataSource = self
    }
    
    func layout() {
        view.addSubview(table)
        view.backgroundColor = .black
        table.separatorColor = .clear
//        table.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        table.backgroundColor = .clear
        
        
        setTableAutoLayout()
    }
    
    func setTableAutoLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: self.view.frame.size.height*0.05),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(self.view.frame.size.height*0.05)),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}

extension TeamRankViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        print("---\(sect[indexPath.section].teams[indexPath.row])---")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}


extension TeamRankViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sect[section].teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: TeamRankTableViewCell.cellID, for: indexPath) as! TeamRankTableViewCell
        
//        cell.nameLabel.text = sect[indexPath.row].name
        cell.nameLabel.text = sect[indexPath.section].teams[indexPath.row]
        cell.nameLabel.textColor = .white
        cell.nameLabel.font = .boldSystemFont(ofSize: 20)
        
        if indexPath.row == 0 {
            cell.rankLabel.isHidden = true
            cell.rankImage.isHidden = false
            cell.rankImage.image = UIImage(named: "firstPlace")
        } else if indexPath.row == 1 {
            cell.rankLabel.isHidden = true
            cell.rankImage.isHidden = false
            cell.rankImage.image = UIImage(named: "secondPlace")
        } else if indexPath.row == 2 {
            cell.rankLabel.isHidden = true
            cell.rankImage.isHidden = false
            cell.rankImage.image = UIImage(named: "thirdPlace")
        } else {
            cell.rankLabel.text = String(indexPath.row+1)
            cell.rankLabel.textColor = .white
            cell.rankLabel.font = .systemFont(ofSize: 15)
        }
        
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sect.count
    }
}

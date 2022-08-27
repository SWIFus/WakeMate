//
//  ProfileViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/03.
//

import UIKit

let badgeImageSet = [
    UIImage(named: "badgeEgg"),
    UIImage(named: "badgeBread"),
    UIImage(named: "greenMate"),
    UIImage(named: "redMate"),
    UIImage(named: "blueMate"),
    UIImage(named: "purpleMate"),
    UIImage(named: "yellowMate"),
]

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView? // badge collection view

    
//MARK: Badge
    let badge: UILabel = {
        let badgeLabel = UILabel()
        
        badgeLabel.frame = CGRect(x: 0, y: 0, width: 61, height: 44)
        badgeLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        badgeLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        badgeLabel.textAlignment = .center
        badgeLabel.font = .boldSystemFont(ofSize: 15)
        badgeLabel.text = "BADGE"
        
        return badgeLabel
    }()
    
//MARK: Name
    let name: UILabel = {
        let nameLabel = UILabel()

        nameLabel.frame = CGRect(x: 0, y: 0, width: 207, height: 38)
        nameLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.text = "NAME"
        
        return nameLabel
    }()
    
    
//MARK: Profile
    let profile: UILabel = {
        let profileLabel = UILabel()
        
        profileLabel.frame = CGRect(x: 0, y: 0, width: 317, height: 38)
        profileLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        profileLabel.textColor = UIColor(red: 1, green: 0.847, blue: 0.051, alpha: 1)
        profileLabel.font = .boldSystemFont(ofSize: 30)
        profileLabel.text = "PROFILE"
        
        return profileLabel
    }()
    
    let profileImg: UILabel = {
        let profileImgBox = UILabel()
        
        profileImgBox.frame = CGRect(x: 0, y: 0, width: 103, height: 108)
        profileImgBox.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        profileImgBox.layer.masksToBounds = true
        profileImgBox.layer.cornerRadius = 25
        
        return profileImgBox
    }()
    
    
//MARK: Team
    let team: UILabel = {
        let teamLabel = UILabel()
        
        teamLabel.frame = CGRect(x: 0, y: 0, width: 61, height: 44)
        teamLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        teamLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        teamLabel.textAlignment = .center
        teamLabel.font = .boldSystemFont(ofSize: 15)
        teamLabel.text = "TEAM"
        
        return teamLabel
    }()
    
    let teamBox: UILabel = {
        let teamBoxLabel = UILabel()
        
        teamBoxLabel.frame = CGRect(x: 0, y: 0, width: 320, height: 80)
        teamBoxLabel.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        teamBoxLabel.layer.masksToBounds = true
        teamBoxLabel.layer.cornerRadius = 25
        
        return teamBoxLabel
    }()
    
    let teamButton: UIButton = {
        let teamBtn = UIButton()
        
        teamBtn.frame = CGRect(x: 0, y: 0, width: 320, height: 80)
        teamBtn.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        teamBtn.layer.masksToBounds = true
        teamBtn.layer.cornerRadius = 25
        teamBtn.setTitle("TAP TO VIEW YOUR TEAM", for: .normal)
        teamBtn.setTitle("TAPPED", for: .highlighted)
        teamBtn.addTarget(self, action: #selector(teamButtonPressed(_:)), for: .touchUpInside)

        return teamBtn
    }()

    
//MARK: viewDidLoad
    override func viewDidLoad() {
    
        setView()
        

        setAutoLayouts()
        
        
        //MARK: BADGE CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView?.register(BadgeCollectionViewCell.self, forCellWithReuseIdentifier: BadgeCollectionViewCell.identifier)

        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        guard let myCollection = collectionView else {
            return
        }
        
        view.addSubview(myCollection)
    }
    
    func setView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func setAutoLayouts() {
        view.addSubview(badge)
        view.addSubview(name)
        view.addSubview(profile)
        view.addSubview(profileImg)
        view.addSubview(team)
        //view.addSubview(teamBox)
        view.addSubview(teamButton)
        
        badgeAutoLayout()
        nameAutoLayout()
        profileAutoLayout()
        profileImgAutoLayout()
        teamAutoLayout()
        //teamBoxAutoLayout()
        teamButtonAutoLayout()
    }
    
    override func viewDidLayoutSubviews() { // for badge cv
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 27, y: 366, width: view.frame.size.width, height: 60).integral
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // set badge counts
        var badgeCount = badgeImageSet.count
        return badgeCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // for badge cv
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCollectionViewCell.identifier, for: indexPath) as! BadgeCollectionViewCell
        cell.configure(with: "")
        return cell
    }
    
    @objc func teamButtonPressed(_ sender:UIButton!) {
        print("Team Button Tapped")
        
        let teamDetailVC = TeamDetailViewController()
        self.navigationController?.pushViewController(teamDetailVC, animated: true)
        self.present(teamDetailVC, animated: true)
        
        
//        self.present(TeamDetailViewController(), animated: true)
        
        
//        let teamDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailViewController") as! TeamDetailViewController
//        self.navigationController?.pushViewController(teamDetailVC, animated: true)
//        self.present(teamDetailVC, animated: true, completion: nil)
    }

    
    
}

// MARK: Extensions

extension ProfileViewController {
    func badgeAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        let width = guide.layoutFrame.width
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.widthAnchor.constraint(equalToConstant: 61).isActive = true
        badge.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        badge.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35).isActive = true
//        badge.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 307).isActive = true
        badge.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: width * 0.1).isActive = true
        badge.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height * 0.35).isActive = true
    }
    func nameAutoLayout() {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.widthAnchor.constraint(equalToConstant: 207).isActive = true
        name.heightAnchor.constraint(equalToConstant: 38).isActive = true
        name.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 148).isActive = true
        name.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 159).isActive = true
    }
    func profileAutoLayout() {
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.widthAnchor.constraint(equalToConstant: 317).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 38).isActive = true
        profile.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27).isActive = true
        profile.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
    }
    func profileImgAutoLayout() {
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.widthAnchor.constraint(equalToConstant: 103).isActive = true
        profileImg.heightAnchor.constraint(equalToConstant: 108).isActive = true
        profileImg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27).isActive = true
        profileImg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 143).isActive = true
    }
    func teamAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        let width = guide.layoutFrame.width
        
        team.translatesAutoresizingMaskIntoConstraints = false
        team.widthAnchor.constraint(equalToConstant: 61).isActive = true
        team.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        team.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35).isActive = true
        team.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: width * 0.1).isActive = true
        team.topAnchor.constraint(equalTo: self.view.topAnchor, constant: height * 0.55).isActive = true
    }
    func teamBoxAutoLayout() {
        teamBox.translatesAutoresizingMaskIntoConstraints = false
        teamBox.widthAnchor.constraint(equalToConstant: 320).isActive = true
        teamBox.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //teamBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        teamBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        teamBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 520).isActive = true
    }
    func teamButtonAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        
        teamButton.translatesAutoresizingMaskIntoConstraints = false
        teamButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        teamButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        teamButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        teamButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: height * 0.1).isActive = true
    }
    
}

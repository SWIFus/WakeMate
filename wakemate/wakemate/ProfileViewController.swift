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
//    UIImage(named: "greenMate"),
    UIImage(named: "redMate"),
    UIImage(named: "blueMate"),
    UIImage(named: "purpleMate"),
    UIImage(named: "yellowMate"),
]

class ProfileViewController: UIViewController {
    
    private var collectionView: UICollectionView? // badge collection view

    
//MARK: Badge
    let badge: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize:15)
//        label.font = UIFont(name: "Arimo-BoldItalic", size: 15)
        label.text = "BADGE"
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.clear
        label.textColor = .white
//        label.layer.cornerRadius = 5
        return label
    }()
    
    let badgeView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor.clear.cgColor
//        view.layer.backgroundColor = UIColor.systemPink.cgColor
//        view.layer.cornerRadius = 30
        
        return view
    }()
    
    let badgeFlowLayout: BadgeCollectionViewFlowLayout = {
        let layout = BadgeCollectionViewFlowLayout()
        layout.cellSpacing = 10
        layout.numOfColumns = 1
        return layout
    }()
    
    var dataSource = getBadgeImages()
    
    lazy var badgeCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.badgeFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = true
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .clear
//        view.backgroundColor = .systemCyan
        view.clipsToBounds = true
        view.register(BadgeCell.self, forCellWithReuseIdentifier: BadgeCell.identifier)
        
        return view
    }()
    
//MARK: Name
    let name: UILabel = {
        let nameLabel = UILabel()

        nameLabel.frame = CGRect(x: 0, y: 0, width: 207, height: 38)
        nameLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.font = .systemFont(ofSize: 30)
        nameLabel.text = StartViewController.Values.nameValue
        
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
    
    let profileImg: UIImageView = {
        let profileImgBox = UIImageView()
        
        profileImgBox.frame = CGRect(x: 0, y: 0, width: 103, height: 108)
        profileImgBox.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        profileImgBox.layer.masksToBounds = true
        profileImgBox.layer.cornerRadius = 25
        profileImgBox.image = UIImage(named: "greenMate")
        
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
    }
    
    
    func setView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        setAutoLayouts()
    }
    
    func setAutoLayouts() {
        self.view.addSubview(profile)
        self.view.addSubview(profileImg)
        profileAutoLayout()
        profileImgAutoLayout()
        
        self.view.addSubview(name)
        nameAutoLayout()
        
        self.view.addSubview(badge)
        badgeAutoLayout()
        
        self.view.addSubview(badgeView)
        badgeViewAutoLayout()
        
        self.badgeView.addSubview(self.badgeCollectionView)
        badgeCollectionViewAutoLayout()
        
        self.badgeCollectionView.dataSource = self
        self.badgeCollectionView.delegate = self
        
        self.view.addSubview(team)
        teamAutoLayout()
        //view.addSubview(teamBox)
        //teamBoxAutoLayout()
        self.view.addSubview(teamButton)
        teamButtonAutoLayout()
        
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
        badge.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            badge.topAnchor.constraint(equalTo: self.profileImg.bottomAnchor, constant: self.profileImg.frame.size.height*0.4),
            badge.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.size.width*0.1),
        ])
    }
    func badgeViewAutoLayout() {
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            badgeView.topAnchor.constraint(equalTo: self.badge.bottomAnchor, constant: 10),
            badgeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            badgeView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width*0.8),
            badgeView.heightAnchor.constraint(equalToConstant: self.view.frame.size.width*0.2),
        ])
    }
    func badgeCollectionViewAutoLayout() {
        badgeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.badgeCollectionView.leadingAnchor.constraint(equalTo: self.badgeView.leadingAnchor),
            self.badgeCollectionView.trailingAnchor.constraint(equalTo: self.badgeView.trailingAnchor),
            self.badgeCollectionView.centerYAnchor.constraint(equalTo: self.badgeView.centerYAnchor),
            self.badgeCollectionView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height*0.08)
        ])
        
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
        teamBox.widthAnchor.constraint(equalToConstant: self.view.frame.size.width*0.8).isActive = true
        teamBox.heightAnchor.constraint(equalToConstant: self.view.frame.size.width*0.2).isActive = true
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

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCell.identifier, for: indexPath) as! BadgeCell
        cell.prepare(image: self.dataSource[indexPath.item])
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? BadgeCollectionViewFlowLayout, flowLayout.numOfColumns > 0 else { fatalError() }
        
//        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        let widthOfCells = collectionView.bounds.height
        let widthOfSpacing = CGFloat(flowLayout.numOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numOfColumns)
        
        return CGSize(width: width, height: width * flowLayout.ratioHeighttoWidth)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

func getBadgeImages() -> [UIImage?] {
    badgeImageSet
}

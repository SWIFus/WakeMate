//
//  TeamDetailViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/07.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
//    struct Theme {
//        let theme = ["Apple Thema", "Banana Thema", "Midnight Thema", "Night Thema","Night Thema","Night Thema"]
//    }
    
    var frontCard: Bool = true
    
// MARK: - 팀 타이틀
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "TEAM : BOLD"
        label.font =  UIFont.boldSystemFont(ofSize:30)
        label.textColor = UIColor.init(rgb: 0xFFD80D)
        return label
        
    }()

//MARK: - Team Front Card View
    
    var teamFrontCardView: UIView = {
        let teamFrontCard = UIView()
        
        teamFrontCard.frame = CGRect(x: 0, y: 0, width: 310, height: 600)
//        teamFrontCard.backgroundColor = .systemCyan
        teamFrontCard.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        teamFrontCard.clipsToBounds = true
        teamFrontCard.layer.cornerRadius = 25
        
        return teamFrontCard
    }()
    
//MARK: - Dark Header
    let darkView: UIView = {
        let header = UIView()
        header.backgroundColor = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)
//        header.backgroundColor = .red
        return header
    }()
    
//MARK: - Wake Up Time
    let wakeUpTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "AM 7 : 00"
        //label.font = UIFont(name: "archivo-narrow.bold", size: 30)
        label.font =  UIFont.boldSystemFont(ofSize:30)
        label.textColor = UIColor.init(rgb: 0xFFD80D)
        return label
    }()
    
//MARK: - Team Description
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = " Description "

        label.font =  UIFont.boldSystemFont(ofSize:13)
        label.layer.masksToBounds = true
        label.backgroundColor =  UIColor.init(rgb: 0xFFD80D)
        label.textColor = .white
        label.layer.cornerRadius = 5
        return label
    }()
    
    let detailView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.init(rgb: 0xD9D9D9)
        view.layer.cornerRadius = 5
        return view
    }()
    
    let detailTeamLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "매일 아침 7시 일어나 요가를 하는\n 미라클 모닝팀입니다."
        // Label에 코너를 주기 위해 필요한 코드
        //label.layer.masksToBounds = true
        //label.backgroundColor = UIColor.init(rgb: 0xD9D9D9)
        //label.layer.cornerRadius = 5
        return label
    }()
    
//MARK: - 팀원 설명 파트
    let mateLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize:13)
        label.text = " Wake up Mate "
        label.layer.masksToBounds = true
        label.backgroundColor =  UIColor.init(rgb: 0xFFD80D)
        label.textColor = .white
        label.layer.cornerRadius = 5
        return label
    }()
    
//MARK: - 출석률 파트
    let attendanceLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.boldSystemFont(ofSize:13)
        label.text = " Attendance Rate "
        label.layer.masksToBounds = true
        label.backgroundColor =  UIColor.init(rgb: 0xFFD80D)
        label.textColor = .white
        label.layer.cornerRadius = 5
        return label
    }()
    
    
//MARK: - Team Back Card View
    let teamBackCardView: UIView = {
        let teamBackCard = UIView()
        
//        teamBackCard.frame = CGRect(x: 0, y: 0, width: 310, height: 600)
        teamBackCard.backgroundColor = .red
        teamBackCard.layer.cornerRadius = 25
        
        return teamBackCard
    }()
    
    
    let switchButton: UIButton = {
        let switchBtn = UIButton()
        
        switchBtn.frame = CGRect(x: 0, y: 0, width: 270, height: 30)
        switchBtn.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
//        switchBtn.backgroundColor = .systemPink
        switchBtn.layer.masksToBounds = true
        switchBtn.layer.cornerRadius = 10
        switchBtn.setTitle("Switch", for: .normal)
        switchBtn.setTitle("TAPPED", for: .highlighted)
        switchBtn.addTarget(self, action: #selector(switchButtonPressed(_:)), for: .touchUpInside)

        return switchBtn
    }()
    
    override func viewDidLoad() {
        print("VIEW LOADED")
        setView()
        setAutoLayouts()
    }
    
    func setView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        view.addSubview(teamLabel)
        
        view.addSubview(teamFrontCardView)
        
        setFrontCardView()
        
        view.addSubview(switchButton)
        
        
    }
    
    func setDetailCardView() {
        
    }
    
    func setFrontCardView() {
        self.teamFrontCardView.addSubview(descriptionLabel)
        teamFrontCardViewAutoLayout()
        self.teamFrontCardView.addSubview(darkView)
        darkViewAutoLayout()
        self.darkView.addSubview(wakeUpTimeLabel)
        wakeUpTimeLabelAutoLayout()
        self.teamFrontCardView.addSubview(detailView)
        detailViewAutoLayout()
        self.detailView.addSubview(detailTeamLabel)
        detailTeamLabelAutoLayout()
        self.teamFrontCardView.addSubview(mateLabel)
        mateLabelAutoLayout()
        self.teamFrontCardView.addSubview(attendanceLabel)
        attendanceLabelAutoLayout()
    }
    
    func setBackCardView() {
        
    }
    
    func setAutoLayouts() {
        teamLabelAutoLayout()
        
//        teamDetailCardViewAutoLayout()
        
//        teamFrontCardViewAutoLayout()
        descriptionLabelAutoLayout()
        
//        teamBackCardViewAutoLayout()
        
        switchButtonAutoLayout()
    }
    
//    var test1 = true
    
    @objc func switchButtonPressed(_ sender:UIButton!) {
        if frontCard {
            frontCard = false
            teamFrontCardView.addSubview(teamBackCardView)
            teamBackCardViewAutoLayout()
            UIView.transition(with: teamFrontCardView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: switchButton, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            frontCard = true
            teamBackCardView.removeFromSuperview()
            UIView.transition(with: teamFrontCardView, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
            UIView.transition(with: switchButton, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }

    
}

extension TeamDetailViewController {
    
    func teamLabelAutoLayout() {
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 35)
        ])
    }
    
    func teamFrontCardViewAutoLayout() {
        teamFrontCardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamFrontCardView.topAnchor.constraint(equalTo: teamLabel.topAnchor, constant: 70),
            teamFrontCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            teamFrontCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(self.view.frame.size.height*0.12)),
            teamFrontCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func darkViewAutoLayout() {
        darkView.translatesAutoresizingMaskIntoConstraints = false
        darkView.topAnchor.constraint(equalTo: self.teamFrontCardView.topAnchor, constant: 0).isActive = true
        darkView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        darkView.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor).isActive = true
        darkView.trailingAnchor.constraint(equalTo: self.teamFrontCardView.trailingAnchor).isActive = true
    }
    
    func wakeUpTimeLabelAutoLayout() {
        wakeUpTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeLabel.centerXAnchor.constraint(equalTo: darkView.centerXAnchor),
            wakeUpTimeLabel.centerYAnchor.constraint(equalTo: darkView.centerYAnchor),

        ])
    }
    
    func descriptionLabelAutoLayout() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.teamFrontCardView.topAnchor, constant: 110),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor, constant: 10)
        ])
    }
    
    func detailViewAutoLayout() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailView.heightAnchor.constraint(equalToConstant: 80),
            detailView.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 30),
            detailView.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor, constant: 10),
            detailView.trailingAnchor.constraint(equalTo: self.teamFrontCardView.trailingAnchor, constant: -10),
        ])
    }
    
    func detailTeamLabelAutoLayout() {
        detailTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailTeamLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 50),
            detailTeamLabel.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor, constant: 30),
            detailTeamLabel.trailingAnchor.constraint(equalTo: self.teamFrontCardView.trailingAnchor, constant: -10),
        ])
    }
    
    func mateLabelAutoLayout() {
        mateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mateLabel.topAnchor.constraint(equalTo: self.detailTeamLabel.topAnchor, constant: 80),
            mateLabel.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor, constant: 10),
        ])
    }
    
    func attendanceLabelAutoLayout() {
        attendanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            attendanceLabel.topAnchor.constraint(equalTo: self.detailTeamLabel.topAnchor, constant: 210),
            attendanceLabel.leadingAnchor.constraint(equalTo: self.teamFrontCardView.leadingAnchor, constant: 10),
        ])
    }
    
    
    func teamBackCardViewAutoLayout() {
        teamBackCardView.translatesAutoresizingMaskIntoConstraints = false
        teamBackCardView.widthAnchor.constraint(equalToConstant: self.teamFrontCardView.frame.size.width).isActive = true
        teamBackCardView.heightAnchor.constraint(equalToConstant: self.teamFrontCardView.frame.size.height).isActive = true
        teamBackCardView.centerXAnchor.constraint(equalTo: self.teamFrontCardView.centerXAnchor).isActive = true
        teamBackCardView.centerYAnchor.constraint(equalTo: self.teamFrontCardView.centerYAnchor).isActive = true
    }
    
//    func teamDetailCardViewAutoLayout() {
//        teamDetailCardView.translatesAutoresizingMaskIntoConstraints = false
////        teamDetailCardView.widthAnchor.constraint(equalToConstant: 310).isActive = true
////        teamDetailCardView.heightAnchor.constraint(equalToConstant: 600).isActive = true
////        teamDetailCardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
////        teamDetailCardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(height * 0.05)).isActive = true
//        NSLayoutConstraint.activate([
//            teamDetailCardView.topAnchor.constraint(equalTo: teamLabel.topAnchor, constant: 70),
//            teamDetailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            teamDetailCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(self.view.frame.size.height*0.12)),
//            teamDetailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
//        ])
//    }
    
    func switchButtonAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        switchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.teamFrontCardView.bottomAnchor, constant: -(height * 0.03)).isActive = true
    }
}

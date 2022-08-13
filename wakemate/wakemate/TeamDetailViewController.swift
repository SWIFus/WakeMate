//
//  TeamDetailViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/07.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    var frontCard: Bool = true
    
    let teamFrontCardView: UIView = {
        let teamFrontCard = UIView()
        
        teamFrontCard.frame = CGRect(x: 0, y: 0, width: 310, height: 600)
        teamFrontCard.backgroundColor = .blue
        teamFrontCard.layer.cornerRadius = 25
        
        return teamFrontCard
    }()
    
    let teamBackCardView: UIView = {
        let teamBackCard = UIView()
        
        teamBackCard.frame = CGRect(x: 0, y: 0, width: 310, height: 600)
        teamBackCard.backgroundColor = .red
        teamBackCard.layer.cornerRadius = 25
        
        return teamBackCard
    }()
    
    var teamDetailCardView: UIView = {
        let teamDetailCard = UIView()
        
        teamDetailCard.frame = CGRect(x: 0, y: 0, width: 310, height: 600)
        teamDetailCard.backgroundColor = .blue
        teamDetailCard.layer.cornerRadius = 25
        
        return teamDetailCard
    }()
    
    let switchButton: UIButton = {
        let switchBtn = UIButton()
        
        switchBtn.frame = CGRect(x: 0, y: 0, width: 270, height: 30)
        switchBtn.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
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
    }
    
    func setDetailCardView() {
        
    }
    
    func setFrontCardView() {
        
    }
    
    func setBackCardView() {
        
    }
    
    func setAutoLayouts() {
        view.addSubview(teamDetailCardView)
        view.addSubview(switchButton)
        
        teamDetailCardViewAutoLayout()
        switchButtonAutoLayout()
    }
    
    var test1 = true
    
    @objc func switchButtonPressed(_ sender:UIButton!) {
        if frontCard {
            frontCard = false
            teamDetailCardView.addSubview(teamBackCardView)
            teamBackCardViewAutoLayout()
            UIView.transition(with: teamDetailCardView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: switchButton, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            frontCard = true
            teamDetailCardView.addSubview(teamFrontCardView)
            teamFrontCardViewAutoLayout()
            UIView.transition(with: teamDetailCardView, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
            UIView.transition(with: switchButton, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }

    
}

extension TeamDetailViewController {
    
    func teamFrontCardViewAutoLayout() {
        teamFrontCardView.translatesAutoresizingMaskIntoConstraints = false
        teamFrontCardView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        teamFrontCardView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        teamFrontCardView.centerXAnchor.constraint(equalTo: self.teamDetailCardView.centerXAnchor).isActive = true
        teamFrontCardView.centerYAnchor.constraint(equalTo: self.teamDetailCardView.centerYAnchor).isActive = true
    }
    func teamBackCardViewAutoLayout() {
        teamBackCardView.translatesAutoresizingMaskIntoConstraints = false
        teamBackCardView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        teamBackCardView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        teamBackCardView.centerXAnchor.constraint(equalTo: self.teamDetailCardView.centerXAnchor).isActive = true
        teamBackCardView.centerYAnchor.constraint(equalTo: self.teamDetailCardView.centerYAnchor).isActive = true
    }
    func teamDetailCardViewAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        
        teamDetailCardView.translatesAutoresizingMaskIntoConstraints = false
        teamDetailCardView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        teamDetailCardView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        teamDetailCardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        teamDetailCardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(height * 0.05)).isActive = true
    }
    func switchButtonAutoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        let height = guide.layoutFrame.height
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        switchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.teamDetailCardView.bottomAnchor, constant: -(height * 0.03)).isActive = true
    }
}

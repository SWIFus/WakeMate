//
//  TabBarViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/13.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .blue

        let vc1 = HomeViewController()
        let vc2 = TeamDetailViewController()
        let vc3 = TeamRankViewController()
        let vc4 = ThemeShopViewController()
        let vc5 = ProfileViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        vc2.tabBarItem = UITabBarItem(title: "Team", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        vc3.tabBarItem = UITabBarItem(title: "Rank", image: UIImage(systemName: "mostViewed"), selectedImage: UIImage(systemName: "mostViewed.fill"))
        vc4.tabBarItem = UITabBarItem(title: "Theme", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        vc5.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

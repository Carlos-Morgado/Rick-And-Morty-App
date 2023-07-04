//
//  ViewController.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 3/7/23.
//

import UIKit
/// Controller to house tabs and root tab controllers
final class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTabs()
    }
    
    private func setUpTabs() {
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        let navigation1 = UINavigationController(rootViewController: charactersVC)
        let navigation2 = UINavigationController(rootViewController: locationsVC)
        let navigation3 = UINavigationController(rootViewController: episodesVC)
        let navigation4 = UINavigationController(rootViewController: settingsVC)
        
        for navigation in [navigation1, navigation2, navigation3, navigation4] {
            navigation.navigationBar.prefersLargeTitles = true
        }
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        navigation1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navigation2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navigation3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navigation4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([navigation1, navigation2, navigation3, navigation4], animated: true)
    }

}


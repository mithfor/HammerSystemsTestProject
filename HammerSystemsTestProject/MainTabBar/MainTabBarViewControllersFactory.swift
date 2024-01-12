//
//  MainTabBarViewControllersFactory.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class MainTabBarViewControllersFactory {
    static func makeMenuViewController() -> UIViewController {
        let vc = MenuViewController()
        vc.tabBarItem.title = Constants.Strings.Title.menu
        vc.tabBarItem.image = UIImage(systemName: Constants.Strings.IconFill.menu) ?? UIImage()
        return vc
    }

    static func makeContactsViewController() -> UIViewController {
        let vc = MenuViewController()
        vc.tabBarItem.title = Constants.Strings.Title.contacts
        vc.tabBarItem.image = UIImage(systemName: Constants.Strings.IconFill.contacts) ?? UIImage()
        return vc
    }

    static func makeProfileViewController() -> UIViewController {
        let vc = MenuViewController()
        vc.tabBarItem.title = Constants.Strings.Title.profile
        vc.tabBarItem.image = UIImage(systemName: Constants.Strings.IconFill.profile) ?? UIImage()
        return vc
    }

    static func makeCartViewController() -> UIViewController {
        let vc = MenuViewController()
        vc.tabBarItem.title = Constants.Strings.Title.cart
        vc.tabBarItem.image = UIImage(systemName: Constants.Strings.IconFill.cart) ?? UIImage()
        return vc
    }
}

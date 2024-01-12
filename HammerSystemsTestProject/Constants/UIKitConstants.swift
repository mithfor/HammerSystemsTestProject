//
//  UIKitConstants.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit


enum UIConstants {
    enum Colors {
        static let mainBackground: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//        static let mainBackground: UIColor = .systemBackground
        static let tabBarItemTint: UIColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
    }

    enum Tabs {
        case menu
        case contacts
        case profile
        case cart

        var index: Int {
            switch self {
            case .menu:
                return 0
            case .contacts:
                return 1
            case .profile:
                return 2
            case .cart:
                return 3
            }
        }

        var item: UITabBarItem {
            switch self {
            case .menu:
                return UITabBarItem(title: Constants.Strings.Title.menu,
                                    image: UIImage(named: Constants.Strings.IconFill.menu),
                                    tag: index)
            case .contacts:
                return UITabBarItem(title: Constants.Strings.Title.contacts,
                                    image: UIImage(named: Constants.Strings.IconFill.contacts),
                                    tag: index)
            case .profile:
                return UITabBarItem(title: Constants.Strings.Title.profile,
                                    image: UIImage(named: Constants.Strings.IconFill.profile),
                                    tag: index)
            case .cart:
                return UITabBarItem(title: Constants.Strings.Title.cart,
                                    image: UIImage(named: Constants.Strings.IconFill.cart),
                                    tag: index)
            }
        }
    }
}

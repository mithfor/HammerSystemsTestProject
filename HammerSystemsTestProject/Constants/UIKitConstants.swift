//
//  UIKitConstants.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

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
                                image: UIImage(systemName:  Constants.Strings.IconFill.menu),
                                tag: index)
        case .contacts:
            return UITabBarItem(title: Constants.Strings.Title.contacts,
                                image: UIImage(systemName: Constants.Strings.IconFill.contacts),
                                tag: index)
        case .profile:
            return UITabBarItem(title: Constants.Strings.Title.profile,
                                image: UIImage(systemName: Constants.Strings.IconFill.profile),
                                tag: index)
        case .cart:
            return UITabBarItem(title: Constants.Strings.Title.cart,
                                image: UIImage(systemName: Constants.Strings.IconFill.cart),
                                tag: index)
        }
    }
}

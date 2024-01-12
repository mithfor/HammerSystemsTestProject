//
//  MainTabBarController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

// MARK: - MainTabBarController
final class MainTabBarController: UITabBarController {

    // MARK: - Init
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private
    private func setupAppearance() {
        view.backgroundColor = .systemGreen
        tabBar.tintColor = UIConstants.Colors.tabBarItemTint
    }
}

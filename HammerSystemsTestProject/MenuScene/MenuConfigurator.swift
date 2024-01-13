//
//  MenuConfigurator.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import Foundation

class MenuConfigurator {
    static var shared = MenuConfigurator()

    private init() {

    }

    func configure(viewController: MenuViewController) {
        let presenter = MenuPresenter()
        presenter.output = viewController

        let interactor = MenuInteractor()
        interactor.output = presenter

        viewController.output = interactor
    }
}

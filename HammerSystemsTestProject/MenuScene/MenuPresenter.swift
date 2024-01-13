//
//  MenuPresenter.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import Foundation

typealias MenuPresenterInput = MenuInteractorOutput

class MenuPresenter {
    var output: MenuViewControllerInput?
}

extension MenuPresenter: MenuPresenterInput {
    func presentBanners(_ banners: Banners) {
        output?.displayBanners(banners)
    }
}
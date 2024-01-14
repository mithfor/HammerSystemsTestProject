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
    func presentBanners(_ banners: [Banner]) {
        //        guard let banners = banners else { return }
        output?.displayBanners(
            ViewModelFactory.shared.makeBannersViewModel(banners)
        )
    }

    func presentCategories(_ categories: Categories) {
        output?.displayCategories(categories)
    }
}

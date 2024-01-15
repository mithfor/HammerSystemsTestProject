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
    func presentMeals(_ meals: Meals) {
        print(#function)
        ViewModelFactory.shared.makeMealViewModels(meals) { viewModels in
            self.output?.displayMeals(viewModels)
        }
    }

    func presentBanners(_ banners: Banners) {
        print(#function)

        output?.displayBanners(
            ViewModelFactory.shared.makeBannerViewModels(banners)
        )
    }

    func presentCategories(_ categories: Categories) {
        print(#function)

        output?.displayCategories(
            ViewModelFactory.shared.makeCategoryViewModels(categories)
        )
    }
}

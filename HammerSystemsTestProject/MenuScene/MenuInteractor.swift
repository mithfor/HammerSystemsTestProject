//
//  MenuInteractor.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import Foundation

typealias MenuInteractorInput = MenuViewControllerOutput

protocol MenuInteractorOutput {
    func presentBanners(_ banners: Banners)
    func presentCategories(_ categories: Categories)
}

class MenuInteractor {
    var output: MenuInteractorOutput?
}

extension MenuInteractor: MenuInteractorInput {
    func fetchCategories() {

        // TODO: - Extract to worker!!!
        APIManager.loadCategories { [weak self] categories in
            self?.output?.presentCategories(categories)
        }
    }

    func fetchBanners() {

        print(#function)
        // TODO: - Extract to worker!!!
        APIManager.loadBanners { [weak self] banners in
            self?.output?.presentBanners(banners)
        }
    }
}

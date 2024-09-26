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
    func presentMeals(_ meals: Meals)
}

protocol InteracorWorker {

}

class InitialWorker {
//    func init(interactor: ) {
//
//    }
}

class MenuInteractor {
    var output: MenuInteractorOutput?
}

extension MenuInteractor: MenuInteractorInput {
    func fetchInitial() {
        let worker = InitialWorker()

    }

    func fetchMealGoods(by category: String) {
        // TODO: - Extract to worker!!!
            NetworkManager.shared.loadCategoryMeals(for: category) { result in
                switch result {
                case .failure(let error):
                    print("Error fetching meals \(error)")
                case .success(let response):
                    self.output?.presentMeals(response.meals)                  }
            }
    }

    func fetchCategories() {

        // TODO: - Extract to worker!!!

        NetworkManager.shared.loadCategories { result in
                  switch result {
                  case .failure(let error):
                      print("Error fetching categories \(error)")
                  case .success(let response):
                      self.output?.presentCategories(response.categories)                  }
              }
    }

    func fetchBanners() {

        // TODO: - Extract to worker!!!
        APIManager.loadBanners { [weak self] banners in
            self?.output?.presentBanners(banners)
        }
    }
}

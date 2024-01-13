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

        NetworkManager.shared.loadCategories { result in
                  switch result {
                  case .failure(let error):
                      print("Error fetching categories \(error)")
                  case .success(let response):
                      self.output?.presentCategories(response.categories)                  }
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

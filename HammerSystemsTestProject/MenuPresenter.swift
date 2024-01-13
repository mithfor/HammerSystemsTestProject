//
//  MenuPresenter.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import Foundation

typealias MenuPresenterInput = MenuInteractorOutput

class MenuPresenter {

}

extension MenuPresenter: MenuPresenterInput {
    func presentBanners(_ banners: Banners) {
        print(#function)
    }
}

//
//  MenuSection.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

enum MenuSection {

    case banners([BannerViewModel])
    case categories([MealCategoryViewModel])
//    case mealgoods([MealGoodViewModel])

    var items: [ViewModel] {
        switch self {
        case .banners(let array):
            return array
        case .categories(let array):
            return array
//        case .mealgoods(let array):
//            return array
        }
    }

    var count: Int {
        items.count
    }
}

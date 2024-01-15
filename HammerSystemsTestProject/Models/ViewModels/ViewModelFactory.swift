//
//  ViewModelFactory.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

class ViewModelFactory {
    static let shared = ViewModelFactory()

    func makeBannerViewModels(_ banners: [Banner]) -> [BannerViewModel] {
        let banners = banners
        var viewModels: [BannerViewModel] = []

        banners.forEach { banner in
            viewModels.append(BannerViewModel(imageName: banner.image))
        }

        return viewModels
    }

    func makeCategoryViewModels(_ categories: [MealCategory]) -> [MealCategoryViewModel] {
        let categories = categories
        var viewModels: [MealCategoryViewModel] = []

        categories.forEach { category in
            viewModels.append(MealCategoryViewModel(title: category.strCategory))
        }

        return viewModels
    }
}

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
            viewModels.append(MealCategoryViewModel(idCategory: category.idCategory, title: category.strCategory))
        }

        return viewModels
    }

    func makeMealViewModels(_ meals: [Meal], completion: @escaping (([MealGoodViewModel]) -> Void)) {
        let meals = meals
        var viewModels: [MealGoodViewModel] = []

        let dispatchGroup = DispatchGroup()
        meals.forEach { meal in
            dispatchGroup.enter()
            ImageDownloader.downloadImage(meal.strMealThumb) {
                  image, urlString in
                     if let imageObject = image {

                            viewModels.append(MealGoodViewModel(
                                image: imageObject,
                                title: meal.strMeal,
                                description: meal.strMealThumb,
                                priceTitle: "Valueless"))
                     }
                dispatchGroup.leave()
                  }
        }

        dispatchGroup.notify(queue: .main) {
            completion(viewModels)

        }
    }
}

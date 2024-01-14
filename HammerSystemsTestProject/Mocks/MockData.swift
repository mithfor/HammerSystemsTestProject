//
//  MockData.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

struct MockData {

    static let shared = MockData()

    private let banners: MenuSection = {
        .banners([
            .init(image: UIImage(named: "pizza-banner")!),
            .init(image: UIImage(named: "pizza-banner")!),
            .init(image: UIImage(named: "pizza-banner")!)
        ])
    }()

    private let mealCategories: MenuSection = {
        .categories([
            .init(title: "first"),
            .init(title: "second"),
            .init(title: "third"),
            .init(title: "forth"),
            .init(title: "fifth"),
            .init(title: "sixth")
        ])
    }()

    private let mealgoods: MenuSection = {
        .mealgoods([
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title1",
                  description: "Description1",
                  priceTitle: "from 350"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450"),
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title2",
                  description: "Description2",
                  priceTitle: "from 450")
        ])
    }()

    var pageData: [MenuSection] {
        [banners, mealCategories, mealgoods]
    }
}

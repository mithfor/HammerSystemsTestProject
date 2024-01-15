//
//  MockData.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

struct MockData {

    static let shared = MockData()

    private var banners: MenuSection = {
        .banners([
            .init(imageName: "pizza-banner"),
            .init(imageName: "pizza-banner"),
            .init(imageName: "pizza-banner"),
        ])
    }()

    private var mealCategories: MenuSection = {
        .categories([
            .init(title: "first"),
            .init(title: "second"),
            .init(title: "third"),
            .init(title: "forth"),
            .init(title: "fifth"),
            .init(title: "sixth")
        ])
    }()

    private var mealgoods: MenuSection = {
        .mealgoods([
            .init(image: UIImage(named: "pizza-banner")!,
                  title: "Title1",
                  description: " Description1 Description2 Description3 Description4 Description5 Description6 Description7 Description8 Description9 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 Description1 ",
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

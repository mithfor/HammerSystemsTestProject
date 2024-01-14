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
            BannerViewModel.init(image: UIImage(named: "pizza-banner")!),
            BannerViewModel.init(image: UIImage(named: "pizza-banner")!),
            BannerViewModel.init(image: UIImage(named: "pizza-banner")!)
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

    var pageData: [MenuSection] {
        [banners, mealCategories]
    }
}

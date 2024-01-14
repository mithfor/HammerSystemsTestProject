//
//  ViewModelFactory.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

class ViewModelFactory {
    static let shared = ViewModelFactory()

    func makeBannersViewModel(_ banners: [Banner]) -> [BannerViewModel] {
        let banners = banners
        var viewModel: [BannerViewModel] = []

        banners.forEach { banner in
            viewModel.append(BannerViewModel(image: banner.image))
        }

        return viewModel
    }
}

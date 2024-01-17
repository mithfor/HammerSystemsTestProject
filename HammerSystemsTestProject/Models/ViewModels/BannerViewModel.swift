//
//  BannerViewModel.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

class BannerViewModel: ViewModel, Identifiable {

    var imageName: String

    internal init(imageName: String) {
        self.imageName = imageName
    }
}


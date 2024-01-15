//
//  MealGoodViewModel.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

class MealGoodViewModel: ViewModel {
    var image: UIImage
    var title: String
    var description: String
    var priceTitle: String

    internal init(image: UIImage, title: String, description: String, priceTitle: String) {
        self.image = image
        self.title = title
        self.description = description
        self.priceTitle = priceTitle
    }
    

}

//
//  MealCategoryViewModel.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import Foundation

class MealCategoryViewModel: ViewModel {
    internal init(idCategory: String, title: String) {
        self.idCategory = idCategory
        self.title = title
    }
    
    var idCategory: String
    var title: String
}

//
//  MealCategory.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import Foundation

// MARK: - MealCategory
struct MealCategory: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

// MARK: - Category
struct CategoriesResponse: Codable {
    let categories: [MealCategory]
}

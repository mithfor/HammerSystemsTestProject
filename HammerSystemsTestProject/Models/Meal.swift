//
//  Meal.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 15.01.2024.
//

import Foundation

import Foundation

// MARK: - Meals
struct MealsResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

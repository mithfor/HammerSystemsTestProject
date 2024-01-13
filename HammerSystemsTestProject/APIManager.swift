//
//  APIManager.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class APIManager {
    static func loadBanners(completion: @escaping ([UIImage?]) -> ()) {
            completion([UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner")])
    }

    static func loadCategories(completion: @escaping ([String?]) -> ()) {
            completion(["Пицца",
                        "Комбо",
                        "Десерты",
                        "Напитки",
                        "Кофе"])
    }
}

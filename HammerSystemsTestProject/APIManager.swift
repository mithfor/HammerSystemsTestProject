//
//  APIManager.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class APIManager {
    static func loadBanners(completion: @escaping ([UIImage?]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion([UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner")])
        }
    }
}

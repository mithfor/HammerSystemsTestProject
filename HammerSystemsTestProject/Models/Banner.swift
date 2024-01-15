//
//  Banner.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

struct Banner: Codable {
    let image: String
}

struct BannerResponse: Codable {
    let banners: [Banner]
}



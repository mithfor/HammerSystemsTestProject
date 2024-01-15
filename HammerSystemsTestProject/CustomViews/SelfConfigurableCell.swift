//
//  SelfConfiguringCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 15.01.2024.
//

import Foundation

protocol SelfConfigurableCell {
    static var identifier: String { get }
    func configure(with viewModel: any ViewModel)
}

//
//  ViewModel.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import Foundation

protocol ViewModel: Hashable {
    static var id: UUID { get }
}

extension ViewModel {
    static var id: UUID {
        UUID()
    }
}

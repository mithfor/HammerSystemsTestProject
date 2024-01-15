//
//  ViewModel.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import Foundation

protocol ViewModel: Identifiable<UUID>, Hashable {
    var id: UUID { get }
}

extension ViewModel {
    var id: UUID {
        UUID()
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

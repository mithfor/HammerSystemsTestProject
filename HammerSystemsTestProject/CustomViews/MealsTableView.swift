//
//  MealsTableView.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 16.01.2024.
//

import UIKit

class MealsTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension MealsTableView {
    func initialize() {
        showsVerticalScrollIndicator = false
    }
}

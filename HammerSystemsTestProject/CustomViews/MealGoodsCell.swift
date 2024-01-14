//
//  MealGoodsCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit
import SwiftUI

// MARK: - MealGoodsCell
class MealGoodsCell: UICollectionViewListCell {
    static let identifier = "MealGoodsCell"

    // MARK: - Public methods
    func configure(with viewModel: MealGoodViewModel) {
        self.imageView.image = viewModel.image
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemCyan
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Provate properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}

// MARK: - Private methods
private extension MealGoodsCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.pinToEdges(of: contentView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: UIConstants.BannersSection.Banner.height),
            imageView.widthAnchor.constraint(equalToConstant: UIConstants.BannersSection.Banner.width),
            ])
    }
}


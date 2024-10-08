//
//  MealGoodsCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

// MARK: - MealGoodsCell
class MealGoodsCell: UICollectionViewListCell {

    // MARK: - Public methods
    func configure(with viewModel: MealGoodViewModel) {
        self.imageView.image = viewModel.image
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.priceLabel.text = viewModel.priceTitle
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIConstants.Colors.mainBackground
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.lineBreakMode = .byTruncatingTail

        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private let priceLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        label.padding(8, 8, 18, 18)
        label.layer.cornerRadius = 6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Private methods
private extension MealGoodsCell {
    func initialize() {


        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: UIConstants.MealGoodsSection.MealGoods.ImageView.height),
            imageView.widthAnchor.constraint(equalToConstant: UIConstants.MealGoodsSection.MealGoods.ImageView.width),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),


            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: descriptionLabel.font.pointSize * 4),

            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            priceLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

extension MealGoodsCell: SelfConfigurableCell {
    static var identifier: String {
        "MealGoodsCell"
    }

    func configure(with viewModel: any ViewModel) {
        if let viewModel = viewModel as? MealGoodViewModel {
            titleLabel.text = viewModel.title
            descriptionLabel.text = viewModel.description
            priceLabel.text = viewModel.priceTitle
            imageView.image = viewModel.image
        }
    }
}



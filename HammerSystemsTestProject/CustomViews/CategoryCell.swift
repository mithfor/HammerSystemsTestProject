//
//  CategoryCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    static let identifier = "CategoryCell"

    // MARK: - Public properties
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        label.textAlignment = .center
        label.layer.cornerRadius = 32 / 2
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()

    var category: MealCategory?

    // MARK: - Public methods
    func configure(with category: MealCategory) {
        self.label.text = category.strCategory
        self.category = category
    }

    func select() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if self.isSelected {
                self.label.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
                self.label.layer.borderWidth = 0
                print(self.category?.strCategory as Any)
            } else {
                self.label.backgroundColor = .clear
                self.label.layer.borderWidth = 1
            }
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension CategoryCell {
    func initialize() {
        contentView.addSubview(label)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 20

        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 32),
            label.widthAnchor.constraint(equalToConstant: 88),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ])
    }
}


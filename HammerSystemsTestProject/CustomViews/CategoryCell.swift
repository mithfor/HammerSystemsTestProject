//
//  CategoryCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 13.01.2024.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    static let identifier = "CategoryCell"

    // MARK: - Public methods
    func configure(with title: String) {
        self.label.text = title
    }

    func select() {
        DispatchQueue.main.async {
            if self.isSelected {
                self.label.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
                self.label.layer.borderWidth = 0
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

    // MARK: - Private properties
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
}

// MARK: - Private methods
private extension CategoryCell {
    func initialize() {
        contentView.addSubview(label)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
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


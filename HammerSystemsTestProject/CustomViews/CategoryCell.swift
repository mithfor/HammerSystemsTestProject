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

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Provate properties
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
        label.textColor = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
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
//        contentView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 32),
            label.widthAnchor.constraint(equalToConstant: 88),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ])

        // Auto layout, variables, and unit scale are not yet supported
//        var view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 88, height: 32)
//        view.layer.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2).cgColor
//        view.layer.cornerRadius = 20
//        var parent = self.view!
//        parent.addSubview(view)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 88).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
//        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
//        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 240).isActive = true
    }
}


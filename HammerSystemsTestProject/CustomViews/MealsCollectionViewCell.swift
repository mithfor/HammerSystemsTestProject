//
//  MealsCollectionViewCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 16.01.2024.
//

import UIKit

class  MealsCollectionViewCell: UICollectionViewCell {

    static let identifier = "MealsCollectionViewCell"

    private lazy var tableView: MealsTableView = {
        let tableView = MealsTableView(frame: .zero)
        return tableView
    }()

    private var viewModels: MealGoodViewModels = []

    func configure(viewModels: MealGoodViewModels) {
        self.viewModels = viewModels
        tableView.reloadData()
        print(viewModels.count)
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIConstants.Colors.mainBackground

        initialize()
        registerCells()
        setupDelegates()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func prepareForReuse() {
        super.prepareForReuse()
        viewModels = []
    }
}

private extension MealsCollectionViewCell {

    func initialize() {
        contentView.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.pinToEdges(of: self)
    }

    func registerCells() {
        tableView.register(MealTableViewCell.self, forCellReuseIdentifier: MealTableViewCell.identifier)
    }

    func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MealsCollectionViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as? MealTableViewCell {
            cell.configure(with: viewModels[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
}

extension MealsCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIConstants.MealGoodsSection.MealGoods.height
    }
}

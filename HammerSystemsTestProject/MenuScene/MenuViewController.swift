//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

typealias Banners = [UIImage?]
typealias Categories = [String?]

protocol MenuViewControllerInput {
    func displayBanners(_ banners: Banners)
    func displayCategories(_ categories: Categories)
}

protocol MenuViewControllerOutput {
    func fetchBanners()
    func fetchCategories()
}

class MenuViewController: UIViewController {

    var output: MenuViewControllerOutput?

    // MARK: - Private vars
    private var bannerCollectionView: BannerCollectionView!
    private var banners: Banners = []

    private var categoriesCollectionView: CategoriesCollectionView!
    private var categories: Categories = []

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
        MenuConfigurator.shared.configure(viewController: self)
        output?.fetchBanners()
        output?.fetchCategories()
    }
}


// MARK: - Private methods
private extension MenuViewController {
    func initialize() {
        view.backgroundColor = UIConstants.Colors.mainBackground

        setupBannerCollectionView()
        setupCategoriesCollectioView()
    }

    func setupBannerCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        bannerCollectionView = BannerCollectionView(frame: .zero,
                                                collectionViewLayout: collectionViewLayout)
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerCollectionView)
        NSLayoutConstraint.activate([
            bannerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 140)
        ])
        bannerCollectionView.register(BannerCell.self,
                                      forCellWithReuseIdentifier: BannerCell.identifier)
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        bannerCollectionView.showsHorizontalScrollIndicator = false

    }

    func setupCategoriesCollectioView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        categoriesCollectionView = CategoriesCollectionView(frame: .zero,
                                                collectionViewLayout: collectionViewLayout)
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoriesCollectionView)
        NSLayoutConstraint.activate([
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollectionView.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor, constant: 0),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 32)
        ])
        categoriesCollectionView.register(CategoryCell.self,
                                      forCellWithReuseIdentifier: CategoryCell.identifier)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView is BannerCollectionView {
            return banners.count
        } else {
            return categories.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView is BannerCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier,
                                                             for: indexPath) as? BannerCell {

                cell.configure(image: banners[indexPath.item] ?? UIImage())
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier,
                                                             for: indexPath) as? CategoryCell {

                cell.configure(with: categories[indexPath.item] ?? "Empty")
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView is BannerCollectionView {
            return CGSize(width: 300, height: 130)
        } else {
            return CGSize(width: 88, height: 32)
        }
    }
}

// MARK: - MenuViewControllerInput
extension MenuViewController: MenuViewControllerInput {
    func displayCategories(_ categories: Categories) {
        print(#function)
        print(categories)

        DispatchQueue.main.async {
            self.categories = categories
            self.categoriesCollectionView.reloadData()
        }
    }

    func displayBanners(_ banners: Banners) {
        print(#function)

        DispatchQueue.main.async {
            self.banners = banners
            self.bannerCollectionView.reloadData()
        }
    }
}


//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

typealias BannerViewModels = [BannerViewModel]
typealias MealCategoryViewModels = [MealCategoryViewModel]
typealias Categories = [MealCategory]
typealias Banners = [Banner]

// MARK: - Protocols
protocol MenuViewControllerInput {
    func displayBanners(_ banners: BannerViewModels)

    func displayCategories(_ categories: MealCategoryViewModels)

    @available(*, deprecated, message: "Use func configure(with viewModel: MealCategoryViewModel) instead")
    func displayCategories(_ categories: Categories)
}

protocol MenuViewControllerOutput {
    func fetchBanners()
    func fetchCategories()
}

class MenuViewController: UIViewController {

    var output: MenuViewControllerOutput?

    // MARK: - Private vars

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIConstants.Colors.mainBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    enum AppSection: Int, CaseIterable {
        case banners
        case categories
        case mealgoods
    }

    private lazy var diffableDataSource: UICollectionViewDiffableDataSource<AppSection, AnyHashable> = .init(collectionView: self.collectionView) {
        (collectionView, indexPath, object) -> UICollectionViewCell? in

        if let object = object as? BannerViewModel {
            return self.makeBannerCell(with: object, for: indexPath)
        } else  if let object = object as? MealCategoryViewModel {
            return self.makeCategoryCell(with: object, for: indexPath)
        }
        return nil
    }


    private var bannerViewModels: [BannerViewModel] = [
        BannerViewModel(imageName: Banner(image: "pizza-banner").image),
        BannerViewModel(imageName: Banner(image: "star").image),
        BannerViewModel(imageName: Banner(image: "pizza-banner").image),
        BannerViewModel(imageName: Banner(image: "moon").image)
    ]
    private var categoryViewModels: MealCategoryViewModels = []
    private var categories: Categories = []

//    private var sections = MockData.shared.pageData

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        MenuConfigurator.shared.configure(viewController: self)
        
//        output?.fetchBanners()
        output?.fetchCategories()
    }
}

// MARK: - Private methods

fileprivate extension UICollectionView {
    func registerCells() {
        self.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        self.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        self.register(MealGoodsCell.self, forCellWithReuseIdentifier: MealGoodsCell.identifier)
    }
}
private extension MenuViewController {
    func setupView() {
        view.backgroundColor = UIConstants.Colors.mainBackground
        view.addSubview(collectionView)
        collectionView.pinToEdges(of: view)
        collectionView.registerCells()
        collectionView.collectionViewLayout = createLayout()
    }

    func initialize() {
        setupView()
        setupDiffableDatasource()
        setupDelegates()
    }

    private func setupDiffableDatasource() {
        collectionView.dataSource = diffableDataSource

        reloadData()
    }

    func setupDelegates() {
        collectionView.delegate = self
//        collectionView.dataSource = self
    }


// MARK: - Make Cells
    func makeBannerCell(with viewModel: BannerViewModel, for indexPath: IndexPath) -> BannerCell {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath) as? BannerCell {

                cell.configure(with: viewModel)
                return cell
            } else {
                return BannerCell()
            }
        }

    func makeCategoryCell(with viewModel: MealCategoryViewModel, for indexPath: IndexPath) -> CategoryCell {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath) as? CategoryCell {

                cell.configure(with: viewModel)
                return cell
            } else {
                return CategoryCell()
            }
        }

    func makeGoodsCell(with viewModel: MealGoodViewModel, for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MealGoodsCell.identifier,
            for: indexPath) as? MealGoodsCell {

            cell.configure(with: viewModel)
            return cell
        } else {
            return MealGoodsCell()
        }
    }
}

// MARK: - Create Layout
private extension MenuViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = AppSection.allCases[sectionIndex]

            switch section {
            case .banners:
                return self.createBannersSection()
            case .categories:
                return self.createMealCategoriesSection()
            case .mealgoods:
                return self.createMealGoodsSection(with: layoutEnvironment)
            }
        }
    }

    func createLayoutSection(group: NSCollectionLayoutGroup,
                             behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior? = nil,
                             interGroupSpacing: CGFloat) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = interGroupSpacing
        return section
    }

    func createBannersSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(UIConstants.BannersSection.Banner.width),
                heightDimension: .estimated(UIConstants.BannersSection.Banner.height)),
            subitems: [item])

        let section = createLayoutSection(
            group: group,
            behavior: .groupPaging,
            interGroupSpacing: UIConstants.BannersSection.interSpacing)

        return section
    }

    func createMealCategoriesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(UIConstants.CategoriesSection.Category.width),
                heightDimension: .estimated(UIConstants.CategoriesSection.Category.height)),
            subitems: [item])

        let section = createLayoutSection(
            group: group,
            behavior: .groupPagingCentered,
            interGroupSpacing: UIConstants.CategoriesSection.interSpacing)

        return section
    }

    func createMealGoodsSection(with environment : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {

        let listConfig = UICollectionLayoutListConfiguration(appearance: .plain)

        let section = NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: environment)

        section.contentInsets.top = 20

        return section
    }
}

// MARK: - UICollectionViewDataSource
//extension MenuViewController: UICollectionViewDataSource {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        sections[section].count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        switch sections[indexPath.section] {
//
//        case .banners(let items):
//            return makeBannerCell(with: items[indexPath.row], for: indexPath)
//        case .categories(let items):
//            return makeCategoryCell(with: items[indexPath.row], for: indexPath)
//        case .mealgoods(let items):
//            return makeGoodsCell(with: items[indexPath.row], for: indexPath)
//        }
//    }
//}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.select()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.select()
        }
    }

}

// MARK: - MenuViewControllerInput
extension MenuViewController: MenuViewControllerInput {

    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<AppSection, AnyHashable>()

        snapshot.appendSections([.banners, .categories, .mealgoods])
        if !snapshot.itemIdentifiers(inSection: .banners).isEmpty {
            snapshot.reconfigureItems(self.bannerViewModels)
        } else {
            snapshot.appendItems(self.bannerViewModels, toSection: AppSection.banners)
        }

        if !snapshot.itemIdentifiers(inSection: .categories).isEmpty {
            snapshot.reconfigureItems(self.categoryViewModels)
        } else {
            snapshot.appendItems(self.categoryViewModels, toSection: AppSection.categories)
        }

        self.diffableDataSource.applySnapshotUsingReloadData(snapshot)
    }

    func displayCategories(_ categories: MealCategoryViewModels) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.categoryViewModels = categories
            self.reloadData()
        }
    }

    func displayCategories(_ categories: Categories) {
        print(#function)
        print(categories)

        DispatchQueue.main.async {
            self.categories = categories
//            self.categoriesCollectionView.reloadData()
        }
    }

    func displayBanners(_ banners: BannerViewModels) {
        print(#function)
        let banners = banners
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.bannerViewModels = banners

//            self.reloadData()

        }
    }
}


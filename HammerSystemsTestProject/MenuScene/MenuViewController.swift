//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

typealias BannerViewModels = [BannerViewModel]
typealias MealCategoryViewModels = [MealCategoryViewModel]
typealias MealGoodViewModels = [MealGoodViewModel]
typealias Categories = [MealCategory]
typealias Banners = [Banner]
typealias Meals = [Meal]

// MARK: - Protocols
protocol MenuViewControllerInput {
    func displayBanners(_ banners: BannerViewModels)
    func displayCategories(_ categories: MealCategoryViewModels)
    func displayMeals(_ meals: MealGoodViewModels)
}

protocol MenuViewControllerOutput {
    func fetchBanners()
    func fetchCategories()
    func fetchMealGoods(by category: String)
}

//MARK: - MenuViewController
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
        } else if let object = object as? MealCategoryViewModel {
            return self.makeCategoryCell(with: object, for: indexPath)
        } else if let object = object as? MealGoodViewModel {
            return self.makeMealsCell(with: object, for: indexPath)
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
    private var mealViewModels: MealGoodViewModels = []
    private var currentCategory: String = "Beef"
    var isHiddenBannersSection: Bool = false

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        MenuConfigurator.shared.configure(viewController: self)

        output?.fetchBanners()
        output?.fetchCategories()
        output?.fetchMealGoods(by: currentCategory)
    }
}

// MARK: - Private methods

fileprivate extension UICollectionView {
    func registerCells() {
        self.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        self.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        self.register(MealsCollectionViewCell.self, forCellWithReuseIdentifier: MealsCollectionViewCell.identifier)
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
    }

    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<AppSection, AnyHashable>()
//
        snapshot.appendSections(AppSection.allCases)
        snapshot.appendItems(self.bannerViewModels, toSection: AppSection.banners)
        snapshot.appendItems(self.categoryViewModels, toSection: AppSection.categories)
        snapshot.appendItems(self.mealViewModels, toSection: AppSection.mealgoods)
//        AppSection.allCases.forEach {
//            reloadData(in: $0)
//        }

        self.diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func reloadData(in section: AppSection) {
        var snapshot = diffableDataSource.snapshot()

        switch section {

        case .banners:
            if snapshot.itemIdentifiers(inSection: .banners).isEmpty {
                snapshot.appendItems(self.bannerViewModels, toSection: .banners)
            } else {
                snapshot.reloadItems(self.bannerViewModels)
            }
            break
        case .categories:

            if snapshot.itemIdentifiers(inSection: .categories).isEmpty {
                snapshot.appendItems(self.categoryViewModels, toSection: .categories)
            } else {
                snapshot.reloadItems(self.categoryViewModels)
            }
        case .mealgoods:
            if snapshot.itemIdentifiers(inSection: .mealgoods).isEmpty {
                snapshot.appendItems(self.mealViewModels, toSection: .mealgoods)
            } else {
                snapshot.reloadItems(self.mealViewModels)
            }
        }

        self.diffableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func hideBannersSection() {
        if !isHiddenBannersSection {
            isHiddenBannersSection = true
            collectionView.setCollectionViewLayout(createLayout(), animated: true)
        }
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

    func makeGoodsCell(with viewModel: MealGoodViewModel, for indexPath: IndexPath) -> MealGoodsCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MealGoodsCell.identifier,
            for: indexPath) as? MealGoodsCell {

            cell.configure(with: viewModel)
            return cell
        } else {
            return MealGoodsCell()
        }
    }

    func makeMealsCell(with viewModel: MealGoodViewModel, for indexPath: IndexPath) -> MealsCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MealsCollectionViewCell.identifier,
            for: indexPath) as? MealsCollectionViewCell {

            cell.configure(viewModels: mealViewModels)
            return cell
        } else {
            return MealsCollectionViewCell()
        }
    }

}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch AppSection.allCases[indexPath.section] {
            
        case .banners:
//            hideBannersSection()
            break
        case .categories:
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
                cell.select { [weak self] category in
                    self?.currentCategory = cell.label.text ?? ""
                    self?.output?.fetchMealGoods(by: category)

//                    collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
                }
            }

            hideBannersSection()

        case .mealgoods:
            break
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.select { [weak self] category in
                self?.currentCategory = cell.label.text ?? ""
//                self?.output?.fetchMealGoods(by: category)
            }
        }
    }
}

// MARK: - MenuViewControllerInput
extension MenuViewController: MenuViewControllerInput {

    func displayBanners(_ banners: BannerViewModels) {
        print(#function)
        let banners = banners
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.bannerViewModels = banners

            self.reloadData()

        }
    }

    func displayCategories(_ categories: MealCategoryViewModels) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.categoryViewModels = categories

            self.collectionView.selectItem(at: IndexPath(item: 0, section: AppSection.categories.rawValue), animated: true, scrollPosition: .centeredHorizontally)

            self.reloadData()
        }
    }

    func displayMeals(_ meals: MealGoodViewModels) {
        let meals = meals
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mealViewModels = meals

            self.reloadData()
        }
    }
}


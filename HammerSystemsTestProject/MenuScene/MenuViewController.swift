//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

typealias Banners = [UIImage?]
typealias Categories = [MealCategory]


// MARK: - Protocols
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

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var banners: Banners = []
    private var categories: Categories = []

    private let sections = MockData.shared.pageData

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        MenuConfigurator.shared.configure(viewController: self)
        
        output?.fetchBanners()
        output?.fetchCategories()
    }
}

// MARK: - Private methods

extension UICollectionView {
    func registerCells() {
        self.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        self.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
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
        setupDelegates()
    }

    func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func makeBannerCell(with viewModel: BannerViewModel, for indexPath: IndexPath) -> BannerCell {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath) as? BannerCell {

                cell.configure(image: viewModel.image)
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

    // TODO: - Implement MeallGoodCell !!!
    func makeGoodsCell(at indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - Create Layout
private extension MenuViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]

            switch section {

            case .banners(_):
                return self.createBannersSection()
            case .categories(_):
                return self.createMealCategoriesSection()
//            case .mealgoods(_):
//                break
            }
        }
    }



    func createLayoutSection(group: NSCollectionLayoutGroup,
                             behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
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
                              heightDimension: .fractionalWidth(1)))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(UIConstants.CategoriesSection.Category.width),
                heightDimension: .estimated(UIConstants.CategoriesSection.Category.height)),
            subitems: [item])

        let section = createLayoutSection(
            group: group,
            behavior: .continuousGroupLeadingBoundary,
            interGroupSpacing: UIConstants.CategoriesSection.interSpacing)

        return section
    }



}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section] {

        case .banners(let items):
            return makeBannerCell(with: items[indexPath.row], for: indexPath)
        case .categories(let items):
            return makeCategoryCell(with: items[indexPath.row], for: indexPath)
//        case .mealgoods(_):
//            return makeGoodsCell(at: indexPath)
        }
    }
}

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

// MARK: - UICollectionViewDelegateFlowLayout
//extension MenuViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView is BannerCollectionView {
//            return CGSize(width: 300, height: 130)
//        } else {
//            return CGSize(width: 88, height: 32)
//        }
//    }
//}

// MARK: - MenuViewControllerInput
extension MenuViewController: MenuViewControllerInput {
    func displayCategories(_ categories: Categories) {
        print(#function)
        print(categories)

        DispatchQueue.main.async {
            self.categories = categories
//            self.categoriesCollectionView.reloadData()
        }
    }

    func displayBanners(_ banners: Banners) {
        print(#function)

        DispatchQueue.main.async {
            self.banners = banners
//            self.bannerCollectionView.reloadData()
        }
    }
}


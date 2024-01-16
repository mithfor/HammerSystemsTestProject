//
//  MenuViewControllerLayout.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 15.01.2024.
//

import UIKit

// MARK: - Create Layout
extension MenuViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = AppSection.allCases[sectionIndex]

            switch section {
            case .banners:
                return self.isHiddenBannersSection ? self.createEmptyBannersSection() : self.createBannersSection()
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

    func createEmptyBannersSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(0),
                heightDimension: .estimated(0)),
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
//
//        let listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
//        let section = NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: environment)
//
//        section.contentInsets.top = 20

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .fractionalHeight(1)))


        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .estimated(UIConstants.MealGoodsSection.MealGoods.width),
                heightDimension: .fractionalHeight(0.66)),
            subitems: [item])

        let section = createLayoutSection(
            group: group,
            behavior: .groupPagingCentered,
            interGroupSpacing: UIConstants.MealGoodsSection.interSpacing)

        section.contentInsets.top = 20

        return section
    }
}

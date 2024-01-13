//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

typealias Banners = [UIImage?]

protocol MenuViewControllerInput {
    func displayBanners(_ banners: Banners)
}

protocol MenuViewControllerOutput {
    func fetchBanners()
}

class MenuViewController: UIViewController {

    var output: MenuViewControllerOutput?

    // MARK: - Private vars
    private var bannerCollectionView: BannerCollectionView!
    private var banners: Banners = []

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
        MenuConfigurator.shared.configure(viewController: self)
        output?.fetchBanners()
    }
}


// MARK: - Private methods
private extension MenuViewController {
    func initialize() {
        view.backgroundColor = UIConstants.Colors.mainBackground

        setupBannerCollectionView()
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
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        bannerCollectionView.register(BannerCell.self,
                                      forCellWithReuseIdentifier: BannerCell.identifier)
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        bannerCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier,
                                                         for: indexPath) as? BannerCell {

            cell.configure(image: banners[indexPath.item] ?? UIImage())
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 150)
    }
}

extension MenuViewController: MenuViewControllerInput {
    func displayBanners(_ banners: Banners) {
        print(#function)

        DispatchQueue.main.async {
            self.banners = banners
            self.bannerCollectionView.reloadData()
        }
    }
}


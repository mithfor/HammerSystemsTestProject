//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Private vars
    private var bannerCollectionView: BannerCollectionView!
    private var banners: [UIImage?] = []

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
}


// MARK: - Private methods
private extension MenuViewController {
    func initialize() {
        view.backgroundColor = UIConstants.Colors.mainBackground

        setupBannerCollectionView()

        // TODO: - Extract to interactor and presenter!!!
        APIManager.loadBanners { [weak self] banners in
            self?.banners = banners
            DispatchQueue.main.async {
                self?.bannerCollectionView.reloadData()
            }
        }
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


//
//  MenuViewController.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Private vars
    private var bannerCollectionView: UICollectionView!
    private var banners: [UIImage?] = []

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
}


// MARK: - Private methods
private extension MenuViewController {
    func setup() {
        view.backgroundColor = UIConstants.Colors.mainBackground

        setupBannerCollectionView()
    }

    func setupBannerCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        bannerCollectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: collectionViewLayout)
        bannerCollectionView.backgroundColor = .magenta
        view.addSubview(bannerCollectionView)
        NSLayoutConstraint.activate([
            bannerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 112)
        ])

        bannerCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }


}


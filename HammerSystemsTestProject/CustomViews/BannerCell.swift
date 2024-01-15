//
//  BannerCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class BannerCell: UICollectionViewCell {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Provate properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}

// MARK: - Private methods
private extension BannerCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.pinToEdges(of: contentView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: UIConstants.BannersSection.Banner.height),
            imageView.widthAnchor.constraint(equalToConstant: UIConstants.BannersSection.Banner.width),
            ])
    }
}

extension BannerCell: SelfConfigurableCell {
    static var identifier: String {
        "BannerCell"
    }

    func configure(with viewModel: any ViewModel) {
        if let viewModel = viewModel as? BannerViewModel {
            self.imageView.image = UIImage(named: viewModel.imageName) ?? UIImage(systemName: viewModel.imageName) ?? UIImage()
        }
    }


}

//
//  BannerCell.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class BannerCell: UICollectionViewCell {

    static let identifier = "BannerCell"

    // MARK: - Public methods
    func configure(image: UIImage) {
        self.imageView.image = image
    }

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
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            ])


//        // Auto layout, variables, and unit scale are not yet supported
//        var view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 300, height: 112)
//        var shadows = UIView()
//        shadows.frame = view.frame
//        shadows.clipsToBounds = false
//        view.addSubview(shadows)
//        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 10)
//        let layer0 = CALayer()
//        layer0.shadowPath = shadowPath0.cgPath
//        layer0.shadowColor = UIColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 0.17).cgColor
//        layer0.shadowOpacity = 1
//        layer0.shadowRadius = 10
//        layer0.shadowOffset = CGSize(width: 0, height: 0)
//        layer0.bounds = shadows.bounds
//        layer0.position = shadows.center
//        shadows.layer.addSublayer(layer0)
//        var shapes = UIView()
//        shapes.frame = view.frame
//        shapes.clipsToBounds = true
//        view.addSubview(shapes)
//        let image1 = UIImage(named: "pitstsa_banner-_1_min.jpg")?.cgImage
//        let layer1 = CALayer()
//        layer1.contents = image1
//        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.03, b: 0, c: 0, d: 1, tx: -0.01, ty: 0))
//        layer1.bounds = shapes.bounds
//        layer1.position = shapes.center
//        shapes.layer.addSublayer(layer1)
//        shapes.layer.cornerRadius = 10
//        var parent = self.view!
//        parent.addSubview(view)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 112).isActive = true
//        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
//        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 104).isActive = true
    }


}

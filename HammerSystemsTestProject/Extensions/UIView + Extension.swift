//
//  UIView + Extension.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 14.01.2024.
//

import UIKit

extension UIView {

    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }

    func pinToLeading(of superview: UIView, constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }

    func pinToTrailing(of superview: UIView, constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
    }

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

//
//  Extensions.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 7/7/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

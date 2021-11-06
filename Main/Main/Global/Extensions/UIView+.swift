//
//  UIView.swift
//  Main
//
//  Created by soyeon on 2021/11/06.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

//
//  UIView+.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

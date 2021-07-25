//
//  File.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UIView {
    func fillSuperview(
        padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0),
        inSafeArea: Bool = false
    ) {
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *), inSafeArea {
            self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding.top).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: padding.bottom).isActive = true
            self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding.left).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: padding.right).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding.bottom).isActive = true
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: padding.right).isActive = true
        }
    }
}

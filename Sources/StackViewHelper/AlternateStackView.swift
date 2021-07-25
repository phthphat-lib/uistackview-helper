//
//  File.swift
//  
//
//  Created by Phat Pham on 24/07/2021.
//

import UIKit

//Because stackview can't show shadow
open class AlternateStackView: UIView {
    public init(axis: NSLayoutConstraint.Axis, views: [UIView]) {
        super.init(frame: .zero)
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
            if index == 0 {
                if axis == .vertical {
                    view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                } else {
                    view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                }
            }
            if index == views.count - 1 {
                if axis == .vertical {
                    view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                } else {
                    view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                }
            }
            if axis == .vertical {
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            } else {
                view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            }
            if index > 0 {
                let preView = views[index - 1]
                if axis == .vertical {
                    view.topAnchor.constraint(equalTo: preView.bottomAnchor).isActive = true
                } else {
                    view.leadingAnchor.constraint(equalTo: preView.trailingAnchor).isActive = true
                }
            }
        }
    }
    convenience public init(axis: NSLayoutConstraint.Axis, _ views: UIView...) {
        self.init(axis: axis, views: views)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

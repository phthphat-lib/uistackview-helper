//
//  File.swift
//  
//
//  Created by Phat Pham on 26/06/2021.
//

import UIKit
//Declarative style
extension UIStackView {
    
    @discardableResult
    public func pad(inset: UIEdgeInsets) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = inset
        return self
    }
    
    @discardableResult
    public func pad(left: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    public func pad(top: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    
    @discardableResult
    public func pad(bottom: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
    
    @discardableResult
    public func pad(right: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
    
    @discardableResult
    public func pad(horizonal value: CGFloat) -> Self {
        return self.pad(left: value).pad(right: value)
    }
    
    @discardableResult
    public func pad(vertical value: CGFloat) -> Self {
        return self.pad(top: value).pad(bottom: value)
    }
}

extension UIStackView {
    ///Core function of this library
    public func addArrangedSubviewList(_ views: [UIView?]) {
        let _views = views.compactMap { view -> UIView? in return view }
        for index in (0..<_views.count) {
            let view = _views[index]
            if let viewsListStore = view as? StoreViewList {
                self.addArrangedSubviewList(viewsListStore.views)
                continue
            } 
            self.addArrangedSubview(view)

            if view.zIndexInStackView > 0 {
                zIndexView[view] = view.zIndexInStackView
            }
            if let multi = view.mainAxisRatioStackView {
                var anchor: NSLayoutConstraint?
                switch self.axis {
                case .vertical:
                    anchor = view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: multi, constant: view.mainAxisConstantStackView)
                case .horizontal:
                    anchor = view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multi, constant: view.mainAxisConstantStackView)
                @unknown default: break
                }
//                anchor?.priority = .
                anchor?.isActive = true
            }
            
            if let space = view.spaceAfterInStackView {
                if #available(iOS 11, *) {
                    self.setCustomSpacing(space, after: view)
                } else {
                    if space == self.spacing {
                        continue
                    }
                    let differentSpacing = space - 2 * self.spacing
                    if differentSpacing >= 0 {
                        let v = UIView()
                        v.backgroundColor = .clear
                        v.heightAnchor.constraint(equalToConstant: differentSpacing).isActive = true
                        self.addArrangedSubview(v)
                    } else {
                        print("Can't set custom spacing")
                    }
                }
            }
            if let spaceBe4 = view.spaceBeforeInStackView,
               let firstIndex = self.arrangedSubviews.firstIndex(of: view),
               firstIndex - 1 >= 0 {
                let viewBefore = self.arrangedSubviews[firstIndex - 1]
                if #available(iOS 11, *) {
                    self.setCustomSpacing(spaceBe4, after: viewBefore)
                } else {
                    print("Can't set custom spacing")
                }
            }
        }
    }
    
    public func hideOrShowIfNeeded() {
        let isAllChildViewsHidden = self.arrangedSubviews.reduce(true, { $0 && ($1.isHidden || $1 is Space) })
        self.isHiddenInStackView = isAllChildViewsHidden
    }
}

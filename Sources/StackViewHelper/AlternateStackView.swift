//
//  File.swift
//
//
//  Created by Phat Pham on 24/07/2021.
//

import UIKit

/**
 Don't use frequently because of memory usage, it is alternative for `VStackView` and `HStackView` and will be deprecated after iOS 14 is minimun in almost project.
 
 If you wanna change background, border, shadow, ... in declarative style, consider wrapping `StackView` inside an `UIView`
 */
open class AlternateStackView: UIView {
    private(set) var leftPaddingConstraint: NSLayoutConstraint?
    private(set) var rightPaddingConstraint: NSLayoutConstraint?
    private(set) var topPaddingConstraint: NSLayoutConstraint?
    private(set) var bottomPaddingConstraint: NSLayoutConstraint?
    
    public init(axis: NSLayoutConstraint.Axis, views: [UIView?], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        addViewsToParent(views, axis: axis, spacing: spacing)
    }
    convenience public init(axis: NSLayoutConstraint.Axis, _ views: UIView?..., spacing: CGFloat = 0) {
        self.init(axis: axis, views: views, spacing: spacing)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addViewsToParent(_ views: [UIView?], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        let _views = views.compactMap { $0 }
        for (index, view) in _views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            if view is StoreViewList {
                #if DEBUG
                fatalError("Don't use StoreViewList for render")
                #endif
                continue
            }
            self.addSubview(view)
            if index == 0 {
                if axis == .vertical {
                    self.topPaddingConstraint = view.topAnchor.constraint(equalTo: self.topAnchor)
                    self.topPaddingConstraint?.isActive = true
                    //Set base constraint for padding
                    self.leftPaddingConstraint = view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
                    self.leftPaddingConstraint?.isActive = true
                    self.rightPaddingConstraint = view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                    self.rightPaddingConstraint?.isActive = true
                } else {
                    self.leftPaddingConstraint = view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
                    self.leftPaddingConstraint?.isActive = true
                    //Set base constraint for padding
                    self.topPaddingConstraint = view.topAnchor.constraint(equalTo: self.topAnchor)
                    self.topPaddingConstraint?.isActive = true
                    self.bottomPaddingConstraint = view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                    self.bottomPaddingConstraint?.isActive = true
                }
            }
            if index == views.count - 1 {
                if axis == .vertical {
                    self.bottomPaddingConstraint = view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                    self.bottomPaddingConstraint?.isActive = true
                } else {
                    self.rightPaddingConstraint = view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                    self.rightPaddingConstraint?.isActive = true
                }
            }
            
            if views.count == 1 {
                continue
            }
            
            if index > 0 {
                let preView = _views[index - 1]
                let firstView = _views[0]
                let realSpace = preView.spaceAfterInStackView ?? spacing
                if axis == .vertical {
                    view.topAnchor.constraint(equalTo: preView.bottomAnchor, constant: realSpace).isActive = true
                    //
                    view.leadingAnchor.constraint(equalTo: firstView.leadingAnchor).isActive = true
                    view.trailingAnchor.constraint(equalTo: firstView.trailingAnchor).isActive = true
                } else {
                    view.leadingAnchor.constraint(equalTo: preView.trailingAnchor, constant: realSpace).isActive = true
                    //
                    view.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
                    view.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
                }
            }
        }
    }
    
}

extension AlternateStackView {
    //Declarative style
    @discardableResult
    open func pad(top value: CGFloat) -> Self {
        self.topPaddingConstraint?.constant = value
        return self
    }
    
    @discardableResult
    open func pad(bottom value: CGFloat) -> Self {
        self.bottomPaddingConstraint?.constant = -value
        return self
    }
    
    @discardableResult
    open func pad(left value: CGFloat) -> Self {
        self.leftPaddingConstraint?.constant = value
        return self
    }
    
    @discardableResult
    open func pad(right value: CGFloat) -> Self {
        self.rightPaddingConstraint?.constant = -value
        return self
    }
    
    @discardableResult
    open func pad(vertical value: CGFloat) -> Self {
        return self.pad(top: value).pad(bottom: value)
    }
    
    @discardableResult
    open func pad(horizontal value: CGFloat) -> Self {
        return self.pad(left: value).pad(right: value)
    }
    
    @discardableResult
    open func pad(inset value: UIEdgeInsets) -> Self {
        return self
            .pad(left: value.left).pad(right: value.right)
            .pad(top: value.top).pad(bottom: value.bottom)
    }
}

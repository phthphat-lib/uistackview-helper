//
//  File.swift
//  File
//
//  Created by Phat Pham on 25/07/2021.
//

import UIKit

extension UIView {
    private static var spaceAfterInStackViewKey: String = UUID().uuidString //unique id

    var spaceAfterInStackView: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &Self.spaceAfterInStackViewKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &Self.spaceAfterInStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    ///Set space after for this view in `Stackview`
    @discardableResult
    public func spaceAfter(_ value: CGFloat) -> Self {
        self.spaceAfterInStackView = value
        return self
    }
}

extension UIView {
    private static var spaceBeforeInStackViewKey: String = UUID().uuidString //unique id

    var spaceBeforeInStackView: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &Self.spaceBeforeInStackViewKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &Self.spaceBeforeInStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    ///Set space after for view in stackView, it will have higher priority than `spaceAfter` of previous arranged subviews in `UIStackView`, only use it when needed especially.
    @discardableResult
    public func spaceBefore(_ value: CGFloat) -> Self {
        self.spaceBeforeInStackView = value
        return self
    }
}


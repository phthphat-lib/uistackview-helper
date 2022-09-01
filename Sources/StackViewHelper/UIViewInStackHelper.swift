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

extension UIView {
    private static var zIndexInStackViewKey = UUID().uuidString

    var zIndexInStackView: CGFloat { //Default 0
        get {
            return objc_getAssociatedObject(self, &Self.zIndexInStackViewKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &Self.zIndexInStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    ///Set for view in stackView
    @discardableResult
    public func zIndex(_ value: CGFloat) -> Self {
        self.zIndexInStackView = value
        return self
    }
}

extension UIView {
    private static var mainAxisRatioStackViewKey = UUID().uuidString
    private static var mainAxisConstantStackViewKey = UUID().uuidString

    var mainAxisRatioStackView: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &Self.mainAxisRatioStackViewKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &Self.mainAxisRatioStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var mainAxisConstantStackView: CGFloat {
        get {
            return objc_getAssociatedObject(self, &Self.mainAxisConstantStackViewKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &Self.mainAxisConstantStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    ///Set the ratio with main axis, example set width ratio with `HStackView`
    @discardableResult
    public func ratioInMainAxis(multi: CGFloat, constant: CGFloat = 0) -> Self {
        self.mainAxisRatioStackView = multi
        self.mainAxisConstantStackView = constant
        return self
    }
}
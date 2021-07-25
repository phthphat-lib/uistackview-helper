//
//  File.swift
//  File
//
//  Created by Phat Pham on 25/07/2021.
//

import UIKit

public protocol StackViewHelper: UIView {
}

extension StackViewHelper {
    //Set space after for view in stackView
    public func spaceAfter(_ value: CGFloat) -> Self {
        self.spaceAfterInStackView = value
        return self
    }
}

extension UIView {
    private static var spaceBeforeInStackViewKey: UInt32 = 12938102 //random number

    var spaceAfterInStackView: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &Self.spaceBeforeInStackViewKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &Self.spaceBeforeInStackViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIView: StackViewHelper {}

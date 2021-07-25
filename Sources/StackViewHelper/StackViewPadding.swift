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

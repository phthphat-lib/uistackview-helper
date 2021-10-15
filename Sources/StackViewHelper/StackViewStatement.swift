//
//  File.swift
//  File
//
//  Created by Phat Pham on 11/09/2021.
//

import Foundation
import UIKit
/**
 Functions below combine with `addArrangedSubviewList` to make a decalrative stackview style
 */
///Try to unwrap an optional value, if it has, generate a view with this unwrapped value
public func unwrap<T>(_ value: @autoclosure () -> T?, _ action: (T) -> UIView?) -> UIView? {
    guard let value = value() else { return nil }
    return action(value)
}
/**
 Functions below combine with `addArrangedSubviewList` to make a decalrative stackview style
 */
///If condition is true, generate a view
public func ifTrue(_ condition: @autoclosure () -> Bool, _ viewBuilder: @autoclosure () -> UIView?) -> UIView? {
    if condition() {
        return viewBuilder()
    }
    return nil
}


public protocol StoreViewList {
    var views: [UIView] { get }
}
///A class store a list view to be add to stackview via `addArrangedSubviewList`
final public class ListView: UIView, StoreViewList {
    public var views = [UIView]()
    /// Add a list view to parent is stackview
    public init(_ viewList: [UIView?]) {
        super.init(frame: .zero)
        self.views = viewList.compactMap { $0 }
    }
    public override func draw(_ rect: CGRect) {
        fatalError("This class is not used for rendering")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

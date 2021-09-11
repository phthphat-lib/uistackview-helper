//
//  File.swift
//  File
//
//  Created by Phat Pham on 11/09/2021.
//

import Foundation
import UIKit

public func unwrap<T, U: UIView>(_ value: @autoclosure () -> T?, _ action: (T) -> U?) -> U? {
    guard let value = value() else { return nil }
    return action(value)
}
public func ifTrue<U: UIView>(_ condition: @autoclosure () -> Bool, _ viewBuilder: @autoclosure () -> U?) -> U? {
    if condition() {
        return viewBuilder()
    }
    return nil
}

final public class ForEachItem: UIView {
    public var views = [UIView]()
    public init<T>(array: [T], _ viewBuilder: (T) -> UIView) {
        super.init(frame: .zero)
        for item in array {
            self.views.append(viewBuilder(item))
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func draw(_ rect: CGRect) {
        //Do nothing
    }
}

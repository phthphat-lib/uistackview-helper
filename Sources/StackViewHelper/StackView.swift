
import UIKit

public enum StackViewConfig {
    case spacing(_ value: CGFloat)
    case alignment(_ value: UIStackView.Alignment)
    case distribution(_ value: UIStackView.Distribution)
}

open class StackView: UIStackView {
    public init(axis: NSLayoutConstraint.Axis, configs: [StackViewConfig], views: [UIView?]) {
        super.init(frame: .zero)
        self.axis = axis
        
        if #available(iOS 11.0, *) {
            insetsLayoutMarginsFromSafeArea = false
        } else {
            // Fallback on earlier versions
        }
        configs.forEach { config in
            switch config {
            case .alignment(let value): self.alignment = value
            case .spacing(let value): self.spacing = value
            case .distribution(let value): self.distribution = value
            }
        }
        self.addArrangedSubviewList(views)
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

open class VStackView: StackView {
    public convenience init(_ views: UIView?..., configs: [StackViewConfig] = []) {
        self.init(views: views, configs: configs)
    }
    public init(views: [UIView?], configs: [StackViewConfig] = []) {
        super.init(axis: .vertical, configs: configs, views: views)
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

open class HStackView: StackView {
    public convenience init(_ views: UIView?..., configs: [StackViewConfig] = []) {
        self.init(views: views, configs: configs)
    }
    public init(views: [UIView?], configs: [StackViewConfig] = []) {
        super.init(axis: .horizontal, configs: configs, views: views)
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

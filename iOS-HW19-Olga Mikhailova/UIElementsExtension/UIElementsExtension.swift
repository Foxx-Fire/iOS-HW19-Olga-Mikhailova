//
//  UIElementsExtension.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 08.08.2025.
//

import UIKit

extension UIImageView {
    
    func configureDefault(contentMode: UIView.ContentMode = .scaleAspectFit,
                          tintColor: UIColor? = nil) {
        self.contentMode = contentMode
        if let tintColor = tintColor {
            self.tintColor = tintColor
        }
    }
    
    func configureSystemIcon(name: String, tint: UIColor) {
        self.image = UIImage(systemName: name)
        self.tintColor = tint
        self.contentMode = .scaleAspectFit
    }
}

extension UILabel {
    
    func configureTitle(fontSize: CGFloat = 24,
                        weight: UIFont.Weight = .semibold,
                        textColor: UIColor = .label,
                        alignment: NSTextAlignment = .natural,
                        lines: Int = 1) {
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = lines
    }
    
    func configureSecondary(fontSize: CGFloat = 16,
                            textColor: UIColor = .secondaryLabel,
                            alignment: NSTextAlignment = .natural) {
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.textAlignment = alignment
    }
    
    func configureBadge(fontSize: CGFloat = 12,
                        backgroundColor: UIColor = .systemRed,
                        cornerRadius: CGFloat = 10) {
        self.font = .systemFont(ofSize: fontSize, weight: .semibold)
        self.textColor = .white
        self.backgroundColor = backgroundColor
        self.textAlignment = .center
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UIStackView {
    
    func configureVertical(spacing: CGFloat,
                           alignment: UIStackView.Alignment = .center) {
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = alignment
    }
    
    func configureHorizontal(spacing: CGFloat,
                             alignment: UIStackView.Alignment = .center) {
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
    }
}

extension UISwitch {
    
    func configureDefault(onTintColor: UIColor = .systemBlue) {
        self.onTintColor = onTintColor
    }
}

extension UIButton {
    
    func configureSystemButton(title: String,
                               tintColor: UIColor = .systemBlue,
                               target: Any?,
                               action: Selector,
                               for event: UIControl.Event = .touchUpInside) {
        self.setTitle(title, for: .normal)
        self.tintColor = tintColor
        self.addTarget(target, action: action, for: event)
    }
}

extension UIView {
    func configureRoundedCorners(radius: CGFloat, masksToBounds: Bool = true) {
        layer.cornerRadius = radius
        layer.masksToBounds = masksToBounds
    }
}

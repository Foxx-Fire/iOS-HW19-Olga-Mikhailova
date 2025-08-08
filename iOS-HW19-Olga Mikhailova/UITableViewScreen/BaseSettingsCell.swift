//
//  BaseSettingsCell.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 08.08.2025.
//

import UIKit

class BaseSettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier  = "SettingsCell"
    
    // MARK: - Coommon UI Elements
    
    lazy var iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconContainer, titleLabel])
        stack.configureHorizontal(spacing: Constants.stackSpacing)
        return stack
    }()
    
    let iconImageView: UIImageView = {
        let image = UIImageView()
        image.configureDefault(tintColor: .white)
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.configureTitle(fontSize: Constants.titleFontSize)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(contentStack)
    }
    
    private func setupLayout() {
        iconContainer.setSize(width: Constants.iconContainerSize,
                              height: Constants.iconContainerSize)
        
        iconImageView.centerX(to: iconContainer)
        iconImageView.centerY(to: iconContainer)
        iconImageView.setSize(width: Constants.iconSize,
                              height: Constants.iconSize)
        
        contentStack.leadingToSuperview(offset: Constants.contentLeadingInset)
        contentStack.centerY(to: contentView)
        contentStack.trailing(lessThanOrEqualTo: contentView.trailingAnchor,
                              offset: Constants.stackTrailingInset)
    }
    
    // MARK: - Configuration
    
    func configureBase(with settings: SettingsModel) {
        let image = settings.image.image
        iconImageView.image = image
        iconContainer.backgroundColor = settings.color.uiColor
        titleLabel.text = settings.settings.rawValue
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        titleLabel.text = nil
    }
}

// MARK: - Constants

extension BaseSettingsCell {
    enum Constants {
        static let cornerRadius: CGFloat = 7
        static let stackSpacing: CGFloat = 12
        static let titleFontSize: CGFloat = 16
        static let iconContainerSize: CGFloat = 30
        static let iconSize: CGFloat = 22
        static let contentLeadingInset: CGFloat = 18
        static let stackTrailingInset: CGFloat = 40
        static let contentTrailingInset: CGFloat = 25
    }
}

//
//  SettingsCell.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//
import UIKit

final class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier  = "SettingsCell"
    
    // MARK: - UI Elements
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconContainer, titleLabel])
        stack.configureHorizontal(spacing: Constants.stackSpacing)
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.configureDefault(tintColor: .white)
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.configureTitle(fontSize: Constants.titleFontSize)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.configureSecondary(fontSize: Constants.subtitleFontSize, textColor: .gray)
        label.textColor = .gray
        return label
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.configureDefault(onTintColor: .systemBlue)
        return switchControl
    }()
    
    private let chevronImageView: UIImageView = {
        let image = UIImageView()
        image.configureSystemIcon(name: "chevron.right", tint: .lightGray)
        return image
    }()
    
    private lazy var redRound: UILabel = {
        let label = UILabel()
        label.configureBadge(
            fontSize: Constants.redRoundFontSize,
            cornerRadius: Constants.redRoundCornerRadius
        )
        label.isHidden = true
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
        contentView.addSubview(redRound)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(switchControl)
        contentView.addSubview(chevronImageView)
    }
    
    private func setupLayout() {
            // Icon сontainer
            iconContainer.setSize(width: Constants.iconContainerSize,
                                  height: Constants.iconContainerSize)
            // Icon inside container
        iconImageView.centerX(to: iconContainer)
        iconImageView.centerY(to: iconContainer)
        iconImageView.setSize(width: Constants.iconSize,
                              height: Constants.iconSize)
            
            // Content stack
        contentStack.leadingToSuperview(offset: Constants.contentLeadingInset)
        contentStack.centerY(to: contentView)
        contentStack.trailing(lessThanOrEqualTo: subtitleLabel.leadingAnchor,
                              offset: Constants.contentTrailingInset)
            
            // Red round label
        redRound.trailingToSuperview(offset: Constants.redRoundTrailingInset)
        redRound.centerY(to: contentStack)
        redRound.width(greaterThanOrEqualTo: Constants.redRoundMinSize)
        redRound.setSize(width: 0, height: Constants.redRoundMinSize)
            
            // Subtitle
        subtitleLabel.trailingToSuperview(offset: Constants.subtitleTrailingInset)
        subtitleLabel.centerY(to: contentView)
        
        // Switch control
        switchControl.trailingToSuperview(offset: Constants.switchTrailingInset)
        switchControl.centerY(to: contentView)
            
            // Chevron
        chevronImageView.trailingToSuperview(offset: Constants.chevronTrailingInset)
        chevronImageView.centerY(to: contentView)
    }
    
    //MARK: - Configuration
    
   func configureCell(with settings: SettingsModel) {
        
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
       let image = settings.image.image
        iconImageView.image = image
        iconContainer.backgroundColor = settings.color.uiColor
        titleLabel.text = settings.settings.rawValue
        redRound.text = settings.redRound
        redRound.isHidden = settings.redRound == nil
        subtitleLabel.text = settings.subtitle
        subtitleLabel.isHidden = settings.subtitle == nil
        switchControl.isHidden = !settings.hasSwitch
        switchControl.isOn = false
        chevronImageView.isHidden = !settings.hasChevron || settings.hasSwitch
        
        if settings.subtitle != nil {
            contentStack.trailingAnchor.constraint(
                lessThanOrEqualTo: subtitleLabel.leadingAnchor,
                constant: -Constants.stackToSubtitleSpacing
            ).isActive = true
        } else {
            contentStack.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor,
                constant: -Constants.stackTrailingInset
            ).isActive = true
        }
        
        contentView.setNeedsLayout()
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        switchControl.isOn = false
        redRound.text = nil
    }
}

// MARK: - Constants
extension SettingsCell {
    enum Constants {
        static let cornerRadius: CGFloat = 7
        static let stackSpacing: CGFloat = 12
        static let titleFontSize: CGFloat = 16
        static let subtitleFontSize: CGFloat = 14
        static let redRoundFontSize: CGFloat = 12
        static let redRoundCornerRadius: CGFloat = 10
        static let redRoundMinSize: CGFloat = 20
        static let iconContainerSize: CGFloat = 30
        static let iconSize: CGFloat = 22
        static let contentLeadingInset: CGFloat = 18
        static let contentTrailingInset: CGFloat = 25
        static let redRoundTrailingInset: CGFloat = 40
        static let subtitleTrailingInset: CGFloat = 40
        static let switchTrailingInset: CGFloat = 16
        static let chevronTrailingInset: CGFloat = 16
        static let stackToSubtitleSpacing: CGFloat = 8
        static let stackTrailingInset: CGFloat = 40
        static let symbolPointSize: CGFloat = 22
    }
}

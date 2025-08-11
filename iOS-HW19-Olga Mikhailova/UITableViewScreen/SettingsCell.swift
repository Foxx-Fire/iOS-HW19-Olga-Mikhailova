//
//  SettingsCell.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//
import UIKit

final class SettingsCell: BaseSettingsCell {
    
    // MARK: - UI Elements
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.configureSecondary(
            fontSize: Constants.subtitleFontSize,
            textColor: .gray
        )
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
        contentView.addSubview(contentStack)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(redRound)
        contentView.addSubview(chevronImageView)
        contentView.addSubview(switchControl)
    }
    
    private func setupLayout() {
        contentStack.leadingToSuperview(offset: Constants.contentLeadingInset)
        contentStack.centerY(to: contentView)
        
        chevronImageView.trailingToSuperview(offset: Constants.chevronTrailingInset)
        chevronImageView.centerY(to: contentView)
        
        redRound.trailing(to: chevronImageView.leadingAnchor,
                          offset: -Constants.badgeChevronSpacing)
        redRound.centerY(to: contentView)
        redRound.setSize(width: Constants.redRoundMinSize,
                         height: Constants.redRoundMinSize)
        
        subtitleLabel.trailing(to: chevronImageView.leadingAnchor,
                               offset: -Constants.subtitleChevronSpacing)
        subtitleLabel.centerY(to: contentView)
        
        switchControl.trailingToSuperview(offset: Constants.switchTrailingInset) 
        switchControl.centerY(to: contentView)
        
        chevronImageView.setContentHuggingPriority(.required, for: .horizontal)
        switchControl.setContentHuggingPriority(.required, for: .horizontal)
        subtitleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    //MARK: - Configuration
    
    func configureCell(with settings: SettingsModel) {
        super.configureBase(with: settings)
        
        subtitleLabel.isHidden = true
        switchControl.isHidden = true
        chevronImageView.isHidden = true
        redRound.isHidden = true
        
        switch settings.cellType {
        case .basic:
            break
            
        case .withSubtitle(let text):
            subtitleLabel.text = text
            subtitleLabel.isHidden = false
            
        case .withSwitch(let isOn):
            switchControl.isOn = isOn
            switchControl.isHidden = false
            
        case .withChevron:
            chevronImageView.isHidden = false
            
        case .badgeAndChevron(let text):
            redRound.text = text
            redRound.isHidden = false
            chevronImageView.isHidden = false
            
        case .subtitleAndChevron(let text):
            subtitleLabel.text = text
            subtitleLabel.isHidden = false
            chevronImageView.isHidden = false
            
        case .switchAndChevron(let isOn):
            switchControl.isOn = isOn
            switchControl.isHidden = false
            chevronImageView.isHidden = false
        }
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
        static let subtitleFontSize: CGFloat = 14
        static let redRoundFontSize: CGFloat = 12
        static let redRoundCornerRadius: CGFloat = 12
        static let redRoundMinSize: CGFloat = 24
        static let contentLeadingInset: CGFloat = 16
        static let chevronTrailingInset: CGFloat = 16
        static let switchTrailingInset: CGFloat = 16
        static let badgeChevronSpacing: CGFloat = 8
        static let subtitleChevronSpacing: CGFloat = 8
        static let stackToSubtitleSpacing: CGFloat = 8
    }
}

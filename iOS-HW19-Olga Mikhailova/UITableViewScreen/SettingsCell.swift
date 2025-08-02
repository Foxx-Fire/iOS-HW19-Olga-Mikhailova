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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconContainer, titleLabel])
        stack.axis = .horizontal
        stack.spacing = Constants.stackSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.titleFontSize)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = .systemBlue
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    private let chevronImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.tintColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var redRound: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(
            ofSize: Constants.redRoundFontSize,
            weight: .semibold)
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.layer.cornerRadius = Constants.redRoundCornerRadius
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            // Контейнер иконки
            iconContainer.widthAnchor.constraint(equalToConstant: Constants.iconContainerSize),
            iconContainer.heightAnchor.constraint(equalToConstant: Constants.iconContainerSize),
            
            // Иконка внутри контейнера
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.iconSize),
            
            // Content stack
            contentStack.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.contentLeadingInset
            ),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.trailingAnchor.constraint(
                lessThanOrEqualTo: subtitleLabel.leadingAnchor,
                constant: -Constants.contentTrailingInset
            ),
            
            // Red round label
            redRound.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.redRoundTrailingInset
            ),
            redRound.centerYAnchor.constraint(equalTo: contentStack.centerYAnchor),
            redRound.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.redRoundMinSize),
            redRound.heightAnchor.constraint(equalToConstant: Constants.redRoundMinSize),
            
            // Subtitle
            subtitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.subtitleTrailingInset
            ),
            subtitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Switch control
            switchControl.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.switchTrailingInset
            ),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Chevron
            chevronImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.chevronTrailingInset
            ),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Configuration
    
   func configureCell(with settings: SettingsModel) {
        
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        let image = settings.image.withConfiguration(config).withRenderingMode(.alwaysTemplate)
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

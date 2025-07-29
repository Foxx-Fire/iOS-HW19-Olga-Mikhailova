//
//  SettingsCell.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//
import UIKit

final class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    var settings: SettingsModel?  {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    // MARK: - Initialization
    
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
        contentView.addSubview(switchControl)
        contentView.addSubview(chevronImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        contentStack.trailingAnchor.constraint(lessThanOrEqualTo: subtitleLabel.leadingAnchor, constant: -25),
        
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        subtitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        
        switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        
        chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Configuration
    
    private func configureCell() {
        guard let settings = settings else { return }
        
        iconImageView.image = settings.image
        titleLabel.text = settings.settings.rawValue
        subtitleLabel.text = settings.subtitle
        subtitleLabel.isHidden = settings.subtitle == nil
        switchControl.isOn = settings.hasSwitch
        switchControl.isHidden = !settings.hasSwitch
        chevronImageView.isHidden = !settings.hasChevron || settings.hasSwitch
        
        if settings.subtitle != nil {
            contentStack.trailingAnchor.constraint(lessThanOrEqualTo: subtitleLabel.leadingAnchor, constant: -8).isActive = true
        } else {
            contentStack.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -40).isActive = true
        }
        
        contentView.setNeedsLayout()
    }
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        subtitleLabel.isHidden = true
        switchControl.isOn = false
    }
}

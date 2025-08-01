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
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconContainer, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 12
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
    
    private lazy var redRound: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
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
            iconContainer.widthAnchor.constraint(equalToConstant: 30),
            iconContainer.heightAnchor.constraint(equalToConstant: 30),
            
            // Иконка внутри контейнера (центрированная)
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 22),
            iconImageView.heightAnchor.constraint(equalToConstant: 22),
            
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.trailingAnchor.constraint(lessThanOrEqualTo: subtitleLabel.leadingAnchor, constant: -25),
            
            redRound.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            redRound.centerYAnchor.constraint(equalTo: contentStack.centerYAnchor),
            redRound.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
            redRound.heightAnchor.constraint(equalToConstant: 20),
            
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
        iconContainer.backgroundColor = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        switchControl.isOn = false
        redRound.text = nil
    }
}

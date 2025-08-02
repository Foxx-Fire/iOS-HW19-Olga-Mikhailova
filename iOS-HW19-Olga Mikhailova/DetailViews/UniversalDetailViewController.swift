//
//  DetailViewController.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 01.08.2025.
//

import UIKit

final class UniversalDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let setting: SettingsModel
    
    // MARK: - UI Elements
    
    private lazy var iconView: UIView = {
        let iconView = UIView()
        iconView.layer.cornerRadius = Constants.smallCornerRadius
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = setting.settings.rawValue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    // MARK: - Init
    
    init(setting: SettingsModel) {
        self.setting = setting
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        configureViews()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Настройка"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupHierarchy() {
        view.addSubview(iconView)
        iconView.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(toggleSwitch)
    }
    
    private func configureViews() {
        iconView.backgroundColor = setting.color.uiColor
        
        let config = UIImage.SymbolConfiguration(
            pointSize: Constants.iconPointSize,
            weight: .regular
        )
        iconImageView.image = setting.image.withConfiguration(config)
        
        titleLabel.text = setting.settings.rawValue
        descriptionLabel.text = "Подробное описание для \"\(setting.settings.rawValue)\" в стадии разработки"
        
        toggleSwitch.isOn = false
        toggleSwitch.isHidden = !setting.hasSwitch
        toggleSwitch.onTintColor = .systemBlue
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.mediumSpacing
            ),
            iconView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.mediumSpacing
            ),
            iconView.widthAnchor.constraint(
                equalToConstant: Constants.iconContainerSize
            ),
            iconView.heightAnchor.constraint(
                equalToConstant: Constants.iconContainerSize
            ),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.iconSize),
            
            titleLabel.topAnchor.constraint(
                equalTo: iconView.bottomAnchor,
                constant: Constants.mediumSpacing
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.mediumSpacing
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.mediumSpacing
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.smallSpacing
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.mediumSpacing
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.mediumSpacing
            ),
            
            toggleSwitch.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.mediumSpacing
            ),
            toggleSwitch.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.mediumSpacing
            )
        ])
    }
}

// MARK: - Extensions

extension UniversalDetailViewController {
    enum Constants {
        static let smallCornerRadius: CGFloat = 12
        static let iconPointSize: CGFloat = 28
        static let iconContainerSize: CGFloat = 50
        static let iconSize: CGFloat = 30
        static let smallSpacing: CGFloat = 10
        static let mediumSpacing: CGFloat = 20
    }
}

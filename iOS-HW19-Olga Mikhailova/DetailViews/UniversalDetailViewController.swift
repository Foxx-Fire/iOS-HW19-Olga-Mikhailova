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
        view.layer.cornerRadius = Constants.smallCornerRadius
        return iconView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureDefault(tintColor: .white)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configureTitle()
        label.text = setting.settings.rawValue
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.configureSecondary(numberOfLines: 0)
        return label
    }()
    
    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.configureDefault()
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
        iconImageView.image = setting.image.image
        
        titleLabel.text = setting.settings.rawValue
        descriptionLabel.text = "Подробное описание для \"\(setting.settings.rawValue)\" в стадии разработки"
        
        toggleSwitch.isOn = false
        toggleSwitch.isHidden = !setting.hasSwitch
        toggleSwitch.onTintColor = .systemBlue
    }
    
    private func setupLayout() {
        iconView.topToSuperview(offset: Constants.mediumSpacing, safeArea: true)
        iconView.leadingToSuperview(offset: Constants.mediumSpacing)
        iconView.setSize(width: Constants.iconContainerSize, height: Constants.iconContainerSize)
        
        iconImageView.centerX(to: iconView)
        iconImageView.centerY(to: iconView)
        iconImageView.setSize(width: Constants.iconSize, height: Constants.iconSize)
        
        titleLabel.pinTopToBottom(of: iconView, offset: Constants.mediumSpacing)
        titleLabel.horizontalToSuperview(inset: Constants.mediumSpacing)
        
        descriptionLabel.pinTopToBottom(of: titleLabel, offset: Constants.smallSpacing)
        descriptionLabel.horizontalToSuperview(inset: Constants.mediumSpacing)
        
        toggleSwitch.pinTopToBottom(of: descriptionLabel, offset: Constants.mediumSpacing)
        toggleSwitch.trailingToSuperview(offset: Constants.mediumSpacing)
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

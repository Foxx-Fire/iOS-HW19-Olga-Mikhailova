//
//  Untitled.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 01.08.2025.
//

import UIKit

final class WiFiDetailViewController: UIViewController {
    // MARK: - Properties
    
    private let setting: SettingsModel
    
    // MARK: - UI Elements
    
    private lazy var wifiImageView: UIImageView = {
        let imageView = UIImageView(image: setting.image)
        imageView.configureDefault()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configureTitle(alignment: .center)
        return label
    }()
    
    private lazy var networkLabel: UILabel = {
        let label = UILabel()
        label.configureSecondary(alignment: .center)
        return label
    }()
    
    private lazy var joinButton: UIButton = {
        let button = UIButton(type: .system)
        button.configureSystemButton(
            title: "Выбрать сеть",
            target: self,
            action: #selector(joinButtonTapped)
            )
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.configureVertical(spacing: Constants.mediumSpacing)
        return stack
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
        title = setting.settings.rawValue
    }
    
    private func setupHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(wifiImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(networkLabel)
        stackView.addArrangedSubview(joinButton)
    }
    
    private func configureViews() {
        wifiImageView.image = setting.image
        wifiImageView.tintColor = setting.color.uiColor
        titleLabel.text = setting.settings.rawValue
        networkLabel.text = "Текущая сеть: \(setting.subtitle ?? "Не подключено")"
    }
    
    private func setupLayout() {
        stackView.centerXToSuperview()
        stackView.centerYToSuperview(offset: -Constants.offset)
        wifiImageView.setSize(width: Constants.iconSize, height: Constants.iconSize)
    }
    
    @objc private func joinButtonTapped() {
        print("Переход к выбору сети Wi-Fi")
    }
}

// MARK: - Extensions

extension WiFiDetailViewController {
    enum Constants {
        static let iconSize: CGFloat = 60
        static let mediumSpacing: CGFloat = 16
        static let offset: CGFloat = 40
    }
}

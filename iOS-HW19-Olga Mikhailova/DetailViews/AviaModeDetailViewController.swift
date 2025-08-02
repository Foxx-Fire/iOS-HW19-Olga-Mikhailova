//
//  AviaModeDetailViewController.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 01.08.2025.
//

import UIKit

final class AviaModeDetailViewController: UIViewController {
    // MARK: - Properties
    
    private let setting: SettingsModel
    
    // MARK: - UI Elements
    
    private lazy var airplaneImageView: UIImageView = {
        let imageView = UIImageView(image: setting.image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Constants.mediumSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupHierarchy() {
        stackView.addArrangedSubview(airplaneImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(toggleSwitch)
        view.addSubview(stackView)
    }
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = setting.settings.rawValue     
    }
    
    private func configureViews() {
        airplaneImageView.image = setting.image
        airplaneImageView.tintColor = setting.color.uiColor
        titleLabel.text = setting.settings.rawValue
        toggleSwitch.onTintColor = setting.color.uiColor
        toggleSwitch.isOn = false
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            airplaneImageView.widthAnchor.constraint(
                equalToConstant: Constants.iconSize
            ),
            airplaneImageView.heightAnchor.constraint(
                equalToConstant: Constants.iconSize
            )
        ])
    }
}

// MARK: - Extension

extension AviaModeDetailViewController {
    enum Constants {
        static let iconSize: CGFloat = 60
        static let mediumSpacing: CGFloat = 20
    }
}


//
//  SettingsViewController.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//

import UIKit

final class SettingsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private var settingsData = SettingsModel.settings
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        title = Constants.title
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(
            SettingsCell.self,
            forCellReuseIdentifier: SettingsCell.identifier
        )
        tableView.separatorInset = Constants.separatorInsets
        tableView.rowHeight = Constants.rowHeight
        tableView.backgroundColor = .white
        
        // Убираем лишние отступы
        //  tableView.sectionHeaderHeight = UITableView.automaticDimension
        //MARK: - У меня вопрос - почему без дублирования тут - остается какой-то зазор снизу секции, даже при том что у меня написано на 91 строке что футер 0
        tableView.sectionFooterHeight = Constants.sectionFooterHeight
    }
}

// MARK: - UITableViewDataSource

extension SettingsTableViewController {
    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.count
    }
    
    // Количество строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData[section].count
    }
    
    // Конфигурация ячейки
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsCell.identifier,
            for: indexPath
        ) as? SettingsCell
        let setting = settingsData[indexPath.section][indexPath.row]
        cell?.configureCell(with: setting)
        
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension SettingsTableViewController {
    // Обработка нажатия на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let setting = settingsData[indexPath.section][indexPath.row]
        let detailVC = setting.makeDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // Высота заголовка секции
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
    }
    
    // Высота футера секции
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.sectionFooterHeight
    }
    
    // Цвет хэдера
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .systemGroupedBackground
        return header
    }
}

// MARK: - Constants
extension SettingsTableViewController {
    enum Constants {
        static let title = "Настройки"
        static let separatorInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        static let rowHeight: CGFloat = 44
        static let sectionHeaderHeight: CGFloat = 36
        static let sectionFooterHeight: CGFloat = 0
    }
}

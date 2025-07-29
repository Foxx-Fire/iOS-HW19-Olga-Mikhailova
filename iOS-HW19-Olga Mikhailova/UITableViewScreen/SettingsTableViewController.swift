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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        title = "Настройки"
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        tableView.rowHeight = 44
        
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 20
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.settings = settingsData[indexPath.section][indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsTableViewController {
    // Обработка нажатия на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedSetting = settingsData[indexPath.section][indexPath.row]
        print("Selected: \(selectedSetting.settings.rawValue)")
    }
    
    // Высота заголовка секции
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    // Высота подвала секции
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    // Вид подвала секции
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

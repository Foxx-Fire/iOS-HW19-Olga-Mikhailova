//
//  SettingsModel.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//

import UIKit

enum SettingsSections: String, CaseIterable {
    case airplaneMode = "Авиарежим"
    case wifi = "Wi-Fi"
    case bluetooth = "Bluetooth"
    case cellular = "Сотовая связь"
    case personalHotspot = "Режим модема"
    case vpn = "VPN"
    case notifications = "Уведомления"
    case sounds = "Звуки, тактильные сигналы"
    case doNotDisturb = "Не беспокоить"
    case screenTime = "Экранное время"
    case general = "Основные"
    case controlCenter = "Пункт управления"
    case display = "Экран и яркость"
    case homeScreen = "Экран «Домой»"
    case universalAccess = "Универсальный доступ"
    case wallpaper = "Обои"
}

enum BackgroundColors {
    case orange
    case blue
    case green
    case red
    case gray
    case purple
    
    var uiColor: UIColor {
        switch self {
        case .orange: return .systemOrange
        case .blue: return .systemBlue
        case .green: return .systemGreen
        case .red: return .systemRed
        case .gray: return .systemGray
        case .purple: return .systemPurple
        }
    }
}

enum SettingsSectionType {
    case airplaneMode
    case wifi
    case bluetooth
    case cellular
    case personalHotspot
    case vpn
    case notifications
    case sounds
    case doNotDisturb
    case screenTime
    case general
    case controlCenter
    case display
    case homeScreen
    case universalAccess
    case wallpaper
}

enum CellType: Equatable, Hashable {
    case basic
    case withSubtitle(String)
    case withSwitch(isOn: Bool)
    case withChevron
    case badgeAndChevron(String)
    case subtitleAndChevron(String)
    case switchAndChevron(isOn: Bool)
}

struct SettingsModel: Hashable {
    var image: AppIcon
    var color: BackgroundColors
    var settings: SettingsSections
    var cellType: CellType
    var subtitle: String?
    var redRound: String?
    let sectionType: SettingsSectionType
}

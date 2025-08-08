//
//  ExtensionSettingsModel.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 29.07.2025.
//

import UIKit

extension SettingsModel {
    static var settings: [[SettingsModel]] = [
        // 1 block
        [SettingsModel(
            image: .system(.airplane),
            color: .orange,
            settings: .airplaneMode,
            cellType: .withSwitch(isOn: true),
            sectionType: .airplaneMode
        ),
         SettingsModel(
            image: .system(.wifi),
            color: .blue,
            settings: .wifi,
            cellType: .subtitleAndChevron("Не подключено"),
            sectionType: .wifi
         ),
         SettingsModel(
            image: .asset(.bluetooth),
            color: .blue,
            settings: .bluetooth,
            cellType: .subtitleAndChevron("Вкл."),
            sectionType: .bluetooth
         ),
         SettingsModel(
            image: .system(.antenna),
            color: .green,
            settings: .cellular,
            cellType: .withChevron,
            sectionType: .cellular
         ),
         SettingsModel(
            image: .system(.personalHotspot),
            color: .green,
            settings: .personalHotspot,
            cellType: .withChevron,
            sectionType: .personalHotspot
         ),
         SettingsModel(
            image: .asset(.vpn),
            color: .blue,
            settings: .vpn,
            cellType: .withSwitch(isOn: true),
            sectionType: .vpn
         )
        ],
        // 2 block
        [SettingsModel(
            image: .system(.notifications),
            color: .red,
            settings: .notifications,
            cellType: .withChevron,
            sectionType: .notifications
        ),
         SettingsModel(
            image: .system(.sounds),
            color: .red,
            settings: .sounds,
            cellType: .withChevron,
            sectionType: .sounds
         ),
         SettingsModel(
            image: .system(.moon),
            color: .purple,
            settings: .doNotDisturb,
            cellType: .withChevron,
            sectionType: .doNotDisturb
         ),
         SettingsModel(
            image: .system(.hourglass),
            color: .purple,
            settings: .screenTime,
            cellType: .withChevron,
            sectionType: .screenTime
         )
        ],
        // 3 block
        [SettingsModel(
            image: .system(.gear),
            color: .gray,
            settings: .general,
            cellType: .badgeAndChevron("1"),
            sectionType: .general
        ),
         SettingsModel(
            image: .system(.controlCenter),
            color: .gray,
            settings: .controlCenter,
            cellType: .withChevron,
            sectionType: .controlCenter
         ),
         SettingsModel(
            image: .system(.display),
            color: .blue,
            settings: .display,
            cellType: .withChevron,
            sectionType: .display
         ),
         SettingsModel(
            image: .system(.homeScreen),
            color: .blue,
            settings: .homeScreen,
            cellType: .withChevron,
            sectionType: .homeScreen
         ),
         SettingsModel(
            image: .system(.universalAccess),
            color: .blue,
            settings: .universalAccess,
            cellType: .withChevron,
            sectionType: .universalAccess
         ),
         SettingsModel(
            image: .system(.wallpaper),
            color: .blue,
            settings: .wallpaper,
            cellType: .withChevron,
            sectionType: .wallpaper
         )
        ]
    ]
}

extension SettingsModel {
    func makeDetailViewController() -> UIViewController {
        switch sectionType {
        case .airplaneMode:
            return AviaModeDetailViewController(setting: self)
        case .wifi:
            return WiFiDetailViewController(setting: self)
        default:
            return UniversalDetailViewController(setting: self)
        }
    }
}


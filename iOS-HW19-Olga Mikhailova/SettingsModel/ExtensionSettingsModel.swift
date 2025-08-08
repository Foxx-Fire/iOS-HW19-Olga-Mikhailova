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
            hasSwitch: true,
            hasChevron: false,
            sectionType: .airplaneMode
        ),
         SettingsModel(
            image: .system(.wifi),
            color: .blue,
            settings: .wifi,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Не подключено",
            sectionType: .wifi
         ),
         SettingsModel(
            image: .asset(.bluetooth),
            color: .blue,
            settings: .bluetooth,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Вкл.",
            sectionType: .bluetooth
         ),
         SettingsModel(
            image: .system(.antenna),
            color: .green,
            settings: .cellular,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .cellular
         ),
         SettingsModel(
            image: .system(.personalHotspot),
            color: .green,
            settings: .personalHotspot,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .personalHotspot
         ),
         SettingsModel(
            image: .asset(.vpn),
            color: .blue,
            settings: .vpn,
            hasSwitch: true,
            hasChevron: false,
            sectionType: .vpn
         )
        ],
        // 2 block
        [SettingsModel(
            image: .system(.notifications),
            color: .red,
            settings: .notifications,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .notifications
        ),
         SettingsModel(
            image: .system(.sounds),
            color: .red,
            settings: .sounds,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .sounds
         ),
         SettingsModel(
            image: .system(.moon),
            color: .purple,
            settings: .doNotDisturb,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .doNotDisturb
         ),
         SettingsModel(
            image: .system(.hourglass),
            color: .purple,
            settings: .screenTime,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .screenTime
         )
        ],
        // 3 block
        [SettingsModel(
            image: .system(.gear),
            color: .gray,
            settings: .general,
            hasSwitch: false,
            hasChevron: true,
            redRound: "1",
            sectionType: .general
        ),
         SettingsModel(
            image: .system(.controlCenter),
            color: .gray,
            settings: .controlCenter,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .controlCenter
         ),
         SettingsModel(
            image: .system(.display),
            color: .blue,
            settings: .display,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .display
         ),
         SettingsModel(
            image: .system(.homeScreen),
            color: .blue,
            settings: .homeScreen,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .homeScreen
         ),
         SettingsModel(
            image: .system(.universalAccess),
            color: .blue,
            settings: .universalAccess,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .universalAccess
         ),
         SettingsModel(
            image: .system(.wallpaper),
            color: .blue,
            settings: .wallpaper,
            hasSwitch: false,
            hasChevron: true,
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


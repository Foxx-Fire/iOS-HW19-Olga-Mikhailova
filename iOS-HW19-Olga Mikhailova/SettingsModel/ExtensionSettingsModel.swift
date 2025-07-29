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
            image: UIImage(systemName: "airplane") ?? UIImage(),
            settings: .airplaneMode,
            hasSwitch: true,
            hasChevron: false
        ),
         SettingsModel(
            image: UIImage(systemName: "wifi") ?? UIImage(),
            settings: .wifi,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Не подключено"
         ),
         SettingsModel(
            image: UIImage(systemName: "bluetooth") ?? UIImage(),
            settings: .bluetooth,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Вкл."
         ),
         SettingsModel(
            image: UIImage(systemName: "antenna.radiowaves.left.and.right") ?? UIImage(),
            settings: .cellular,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "personalhotspot") ?? UIImage(),
            settings: .personalHotspot,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "network.badge.shield.half.filled") ?? UIImage(),
            settings: .vpn,
            hasSwitch: false,
            hasChevron: true
         )
        ],
        // 2 block
        [SettingsModel(
            image: UIImage(systemName: "bell.badge") ?? UIImage(),
            settings: .notifications,
            hasSwitch: false,
            hasChevron: true
        ),
         SettingsModel(
            image: UIImage(systemName: "speaker.wave.3") ?? UIImage(),
            settings: .sounds,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "moon") ?? UIImage(),
            settings: .doNotDisturb,
            hasSwitch: true,
            hasChevron: false
         ),
         SettingsModel(
            image: UIImage(systemName: "hourglass") ?? UIImage(),
            settings: .screenTime,
            hasSwitch: false,
            hasChevron: true
         )
        ],
        // 3 block
        [SettingsModel(
            image: UIImage(systemName: "gear") ?? UIImage(),
            settings: .general,
            hasSwitch: false,
            hasChevron: true,
            redRound: "1"
        ),
         SettingsModel(
            image: UIImage(systemName: "switch.2") ?? UIImage(),
            settings: .controlCenter,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "textformat.size") ?? UIImage(),
            settings: .display,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "apps.ipad") ?? UIImage(),
            settings: .homeScreen,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "figure.arms.open") ?? UIImage(),
            settings: .universalAccess,
            hasSwitch: false,
            hasChevron: true
         ),
         SettingsModel(
            image: UIImage(systemName: "photo") ?? UIImage(),
            settings: .wallpaper,
            hasSwitch: false,
            hasChevron: true
         )
        ]
    ]
}

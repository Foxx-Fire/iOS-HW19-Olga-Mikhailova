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
            color: .orange,
            settings: .airplaneMode,
            hasSwitch: true,
            hasChevron: false,
            sectionType: .airplaneMode
        ),
         SettingsModel(
            image: UIImage(systemName: "wifi") ?? UIImage(),
            color: .blue,
            settings: .wifi,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Не подключено",
            sectionType: .wifi
         ),
         SettingsModel(
            image: UIImage(named: "bluetooth") ?? UIImage(),
            color: .blue,
            settings: .bluetooth,
            hasSwitch: false,
            hasChevron: true,
            subtitle: "Вкл.",
            sectionType: .bluetooth
         ),
         SettingsModel(
            image: UIImage(systemName: "antenna.radiowaves.left.and.right") ?? UIImage(),
            color: .green,
            settings: .cellular,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .cellular
         ),
         SettingsModel(
            image: UIImage(systemName: "personalhotspot") ?? UIImage(),
            color: .green,
            settings: .personalHotspot,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .personalHotspot
         ),
         SettingsModel(
            image: UIImage(named: "vpn") ?? UIImage(),
            color: .blue,
            settings: .vpn,
            hasSwitch: true,
            hasChevron: false,
            sectionType: .vpn
         )
        ],
        // 2 block
        [SettingsModel(
            image: UIImage(systemName: "arrow.rectanglepath") ?? UIImage(),
            color: .red,
            settings: .notifications,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .notifications
        ),
         SettingsModel(
            image: UIImage(systemName: "speaker.wave.3.fill") ?? UIImage(),
            color: .red,
            settings: .sounds,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .sounds
         ),
         SettingsModel(
            image: UIImage(systemName: "moon.fill") ?? UIImage(),
            color: .purple,
            settings: .doNotDisturb,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .doNotDisturb
         ),
         SettingsModel(
            image: UIImage(systemName: "hourglass") ?? UIImage(),
            color: .purple,
            settings: .screenTime,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .screenTime
         )
        ],
        // 3 block
        [SettingsModel(
            image: UIImage(systemName: "gearshape") ?? UIImage(),
            color: .gray,
            settings: .general,
            hasSwitch: false,
            hasChevron: true,
            redRound: "1",
            sectionType: .general
        ),
         SettingsModel(
            image: UIImage(systemName: "slider.horizontal.2.square.on.square") ?? UIImage(),
            color: .gray,
            settings: .controlCenter,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .controlCenter
         ),
         SettingsModel(
            image: UIImage(systemName: "textformat.size") ?? UIImage(),
            color: .blue,
            settings: .display,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .display
         ),
         SettingsModel(
            image: UIImage(systemName: "square.grid.3x3.middle.filled") ?? UIImage(),
            color: .blue,
            settings: .homeScreen,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .homeScreen
         ),
         SettingsModel(
            image: UIImage(systemName: "figure.arms.open") ?? UIImage(),
            color: .blue,
            settings: .universalAccess,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .universalAccess
         ),
         SettingsModel(
            image: UIImage(systemName: "photo") ?? UIImage(),
            color: .blue,
            settings: .wallpaper,
            hasSwitch: false,
            hasChevron: true,
            sectionType: .wallpaper
         )
        ]
    ]
}

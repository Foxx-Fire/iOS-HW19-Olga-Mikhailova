//
//  ImagesEnums.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 08.08.2025.
//

import UIKit

public enum SystemIcon: String {
    case airplane = "airplane"
    case wifi = "wifi"
    case antenna = "antenna.radiowaves.left.and.right"
    case personalHotspot = "personalhotspot"
    case notifications = "arrow.rectanglepath"
    case sounds = "speaker.wave.3.fill"
    case moon = "moon.fill"
    case hourglass = "hourglass"
    case gear = "gearshape"
    case controlCenter = "slider.horizontal.2.square.on.square"
    case display = "textformat.size"
    case homeScreen = "square.grid.3x3.middle.filled"
    case universalAccess = "figure.arms.open"
    case wallpaper = "photo"
    case chevronRight = "chevron.right"
    
    var image: UIImage {
        UIImage(systemName: self.rawValue) ?? UIImage()
    }
}

public enum AssetIcon: String {
    case bluetooth = "bluetooth"
    case vpn = "vpn"
    
    var image: UIImage {
        UIImage(named: self.rawValue) ?? UIImage()
    }
}

public enum AppIcon: Hashable {
    case system(SystemIcon)
    case asset(AssetIcon)
    
    var image: UIImage {
        switch self {
        case .system(let systemIcon):
            return systemIcon.image
        case .asset(let assetIcon):
            return assetIcon.image
        }
    }
}


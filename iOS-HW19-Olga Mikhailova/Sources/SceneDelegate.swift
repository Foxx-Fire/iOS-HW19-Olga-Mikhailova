//
//  SceneDelegate.swift
//  iOS-HW19-Olga Mikhailova
//
//  Created by FoxxFire on 28.07.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let settingsTableViewController = SettingsTableViewController()
        let navigationController = UINavigationController(
            rootViewController: settingsTableViewController
        )
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SplashViewController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
            self?.window?.backgroundColor = .white
            self?.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}


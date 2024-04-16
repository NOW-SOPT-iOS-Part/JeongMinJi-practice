//
//  SceneDelegate.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 3/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
         
        let mainViewController =   LoginViewController_SnapKit()
        let navigationController = UINavigationController(rootViewController: mainViewController)
                
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}


//
//  LoginViewController_3rd.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/20/24.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_CustomView: UIViewController {
    private let rootView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setTarget()
        
    }
    override func loadView() {
            self.view = rootView
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_CustomView()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.rootView.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        welcomeViewController.setLabelText(id: rootView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

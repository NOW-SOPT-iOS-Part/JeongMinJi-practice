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
            guard let id = rootView.idTextField.text else { return }
            guard let password = rootView.passwordTextField.text else { return }
        
        let request = LoginRequestModel(
            authenticationId: id,
            password: password
        )
        
        UserService.shared.login(request: request) { [weak self] response in
            switch response {
            case .success(let data):
                guard data is LoginResponseModel else {
                    return }
                self?.pushToWelcomeVC()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_CustomView()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.rootView.idTextField.text = "\(id)"
        }
        welcomeViewController.setLabelText(id: rootView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

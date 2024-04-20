//
//  LoginViewController_SnapKit.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 6
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 6
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
        return textField
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
    }

    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(161)
        }
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(276)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(335)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(58)
            $0.top.equalToSuperview().offset(422)
        }
    }
    
    @objc private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_SnapKit()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

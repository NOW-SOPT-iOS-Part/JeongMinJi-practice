//
//  LoginViewController_AutoLayout.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/6/24.
//

import Foundation
import UIKit

final class LoginViewController_AutoLayout: UIViewController {
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }

        NSLayoutConstraint.activate(
            [titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 161),
             titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        NSLayoutConstraint.activate(
            [idTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 276),
             idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             idTextField.widthAnchor.constraint(equalToConstant: 335),
             idTextField.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate(
            [passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 335),
             passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             passwordTextField.widthAnchor.constraint(equalToConstant: 335),
             passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate(
            [loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 422),
             loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             loginButton.widthAnchor.constraint(equalToConstant: 335),
             loginButton.heightAnchor.constraint(equalToConstant: 58)])
    }
    
    @objc private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_AutoLayout()
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

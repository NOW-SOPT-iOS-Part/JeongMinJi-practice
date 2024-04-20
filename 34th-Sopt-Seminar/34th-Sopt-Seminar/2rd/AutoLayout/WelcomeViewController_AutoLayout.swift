//
//  WelcomeViewController_AutoLayout.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/6/24.
//

import Foundation
import UIKit

final class WelcomeViewController_AutoLayout: UIViewController {
    
    typealias handler = ((String) -> (Void))
    var completionHandler: handler?
    
    var id: String?
    
    private let mascotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mascot")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    
    private lazy var goMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(goMainButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    private lazy var reLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(reLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
        bindID()
    }
    private func setLayout() {
        
        mascotImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        goMainButton.translatesAutoresizingMaskIntoConstraints = false
        reLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        [mascotImageView, welcomeLabel, goMainButton, reLoginButton].forEach {
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate(
            [mascotImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 87),
             mascotImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             mascotImageView.heightAnchor.constraint(equalToConstant: 150),
             mascotImageView.heightAnchor.constraint(equalToConstant: 150)])
        NSLayoutConstraint.activate(
            [welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 295),
             welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        NSLayoutConstraint.activate(
            [goMainButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 426),
             goMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             goMainButton.widthAnchor.constraint(equalToConstant: 335),
             goMainButton.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate(
            [reLoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 498),
             reLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             reLoginButton.widthAnchor.constraint(equalToConstant: 335),
             reLoginButton.heightAnchor.constraint(equalToConstant: 58)])
    }
    
    @objc private func goMainButtonDidTap() {
        print("홈으로")
    }
    @objc private func reLoginButtonDidTap() {
        guard let id else { return }
            completionHandler?(id)
            self.navigationController?.popViewController(animated: true)
    }
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    func setLabelText(id: String?) {
           self.id = id
       }
    
}

//
//  ChartTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/20/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    static let identifier = "ChatTableViewCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    private let NickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "요이키"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "문정동"
        label.textColor = .grey400
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-regular", size: 12)
        return label
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "확인했습니다 감사합니다 :)"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-regular", size: 14)
        return label
    }()
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "t1")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [profileImageView, NickNameLabel, locationLabel, contentLabel, contentImageView].forEach {
            self.addSubview($0)
        }
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            
        }
        NickNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(NickNameLabel.snp.centerY)
            $0.leading.equalTo(NickNameLabel.snp.trailing).offset(4)
        }
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.bottom.equalTo(profileImageView.snp.bottom)
        }
        contentImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        NickNameLabel.text = chatData.name
        locationLabel.text = chatData.place
        contentLabel.text = chatData.message
        contentImageView.image = chatData.itemImg
    }
}

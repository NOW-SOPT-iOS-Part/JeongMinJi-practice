//
//  ItemCollectionViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/20/24.
//

import UIKit

protocol ItemCollectoinViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    var itemRow: Int?
    weak var delegate: ItemCollectoinViewCellDelegate?
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.icHeart, for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }()
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "아이폰 13프로맥스"
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-regular", size: 16)
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1,000,000원"
        label.textColor = .primaryOrange
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-bold", size: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setLayout()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.heartButton.isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [itemImageView, heartButton, itemNameLabel, priceLabel].forEach {
            self.addSubview($0)
        }
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(9)
            $0.height.equalTo(itemImageView.snp.width)
        }
        heartButton.snp.makeConstraints {
            $0.trailing.equalTo(itemImageView.snp.trailing).inset(8)
            $0.bottom.equalTo(itemImageView.snp.bottom).inset(8)
            $0.height.equalTo(16)
            $0.width.equalTo(16)
        }
        itemNameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(itemNameLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(13)
        }
    }
    
    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
}


extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        itemNameLabel.text = itemData.name
        priceLabel.text = itemData.price
        heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}

//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/20/24.
//

import Foundation
import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel{
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .c1, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),

        ]
    }
}


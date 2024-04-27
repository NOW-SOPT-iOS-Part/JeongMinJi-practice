//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/20/24.
//

import Foundation
import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profileImage1, name: "요이키", place: "문정동", message: "확인했습니다 감사합니다 :)", itemImg: .t1),
            ChatModel(profileImg: .profileImage2, name: "chan", place: "구의동", message: "넵 수고하세용", itemImg: .t2),
            ChatModel(profileImg: .profileImage3, name: "오지", place: "보문동2가", message: "안녕하세요 답장이 너무 늦었네여 죄송···", itemImg: .t3),
            ChatModel(profileImg: .profileImage1, name: "누룽지", place: "면목동", message: "이람다님이 이모티콘을 보냈어요.", itemImg: .t4),
            ChatModel(profileImg: .profileImage1, name: "kenny", place: "자양제4동", message: "네.", itemImg: .t5),
            ChatModel(profileImg: .profileImage4, name: "자리보금", place: "옥수동", message: "자리보금님이 이모티콘을 보냈어요.", itemImg: .t6),
            ChatModel(profileImg: .profileImage5, name: "리빙스턴", place: "면목동", message: "리빙스턴님이 이모티콘을 보냈어요.", itemImg: .t7),
            ChatModel(profileImg: .profileImage1, name: "꺄롱이", place: "중곡동", message: "네", itemImg: .t8),
            ChatModel(profileImg: .profileImage1, name: "깨롱이", place: "중곡동", message: "네", itemImg: .t9),
            ChatModel(profileImg: .profileImage6, name: "요우", place: "군자동", message: "감사합니다!! 조심히가세요!", itemImg: .t10)
        ]
    }
}

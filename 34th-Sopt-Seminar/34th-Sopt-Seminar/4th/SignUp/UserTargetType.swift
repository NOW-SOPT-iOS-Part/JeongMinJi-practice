//
//  UserTargetType.swift
//  34th-Sopt-Seminar
//
//  Created by 정민지 on 4/27/24.
//

import Foundation

import Moya


enum UserTargetType {
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
    case login(request: LoginRequestModel)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/member/join"
        case .getUserInfo:
            return "/member/info"
        case .login:
            return "/member/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp, .login:
            return .post
        case .getUserInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        case .login(let request):
            return .requestJSONEncodable(request)
        case .getUserInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case.signUp, .login:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        }
        
    }
}


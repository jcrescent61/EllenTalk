//
//  SignUpViewData.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/10.
//

import UIKit

protocol SignUpViewable: UIView {}

enum SignUpContentsData {
    case email
    case password
    case passwordCheck
    
    func returnView() -> SignUpViewable {
        switch self {
        case .email:
            return SignUpContentsView(title: "이메일", placeHolder: "ex)jcrescent61@gmail.com")
        case .password:
            return SignUpContentsView(title: "비밀번호", placeHolder: "대,소,특수문자 1회 포함한 최소 8자리")
        case .passwordCheck:
            return SignUpContentsView(title: "비밀번호 확인", placeHolder: "")
        }
    }
}

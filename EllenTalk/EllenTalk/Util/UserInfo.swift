//
//  UserInfo.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/07.
//

import Foundation

struct UserInfo {
    private let email: String
    private let password: String
    private let passwordCheck: String
    
    init(email: String, password: String, passwordCheck: String) {
        self.email = email
        self.password = password
        self.passwordCheck = passwordCheck
    }
}

//
//  InfoChecker.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/07.
//

import Foundation

protocol InfoCheckable {
    func check() -> Bool
}

struct EmailChecker: InfoCheckable {
    private let pattern: String = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}$"
    private let email: String?
    
    init(_ email: String?) {
        self.email = email
    }
    
    func check() -> Bool {
        guard let email = email else { return false }
        let regex = try? NSRegularExpression(pattern: self.pattern)
        guard let _ = regex?.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) else {
            return false
        }
        return true
    }
}

struct PasswordChecker: InfoCheckable {
    private let pattern: String = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$"
    private let password: String?
    
    init(_ password: String?) {
        self.password = password
    }
    
    func check() -> Bool {
        guard let password = password else { return false }
        let regex = try? NSRegularExpression(pattern: self.pattern)
        guard let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) else {
            return false
        }
        return true
    }
}

struct PasswordIsSameChecker: InfoCheckable {
    private let password: String?
    private let passwordCheck: String?
    
    init(_ password: String?, _ passwordCheck: String?) {
        self.password = password
        self.passwordCheck = passwordCheck
    }
    
    func check() -> Bool {
        return password == passwordCheck
    }
}

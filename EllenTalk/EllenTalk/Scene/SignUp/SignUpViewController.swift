//
//  SignUpViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

protocol SignUpViewable: UIView {}

enum SignUpContentsData {
    case email
    case password
    
    func returnView() -> SignUpViewable {
        switch self {
        case .email:
            return SignUpContentsView(SignUpConponent(title: "이메일",
                                                      placeHolder: "ex)jcrescent61@google.com"))
        case .password:
            return DoubleSignUpContentsView(SignUpConponent(title: "비밀번호",
                                                            placeHolder: "대,소,특수문자 최소 1회 포함"),
                                            SignUpConponent(title: "비밀번호 확인",
                                                            placeHolder: "동일한 비밀번호를 입력하세요"))
        }
    }
}

class SignUpViewController: UIViewController {
    private lazy var signUpView: SignUpView = SignUpView([SignUpContentsData.email.returnView(),
                                                          SignUpContentsData.password.returnView()])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    deinit {
        print("SignUpView was Deinitialized")
    }
}

extension SignUpViewController {
    
    private func setUp() {
        view = signUpView
    }
}

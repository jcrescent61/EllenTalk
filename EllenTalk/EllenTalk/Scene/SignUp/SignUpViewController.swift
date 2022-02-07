//
//  SignUpViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SignUpViewController: UIViewController, SignUpViewDelegate {
    private lazy var signUpView: SignUpView = SignUpView(frame: view.bounds)
    
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
        signUpView.delegate = self
    }
    
    func touchUpDoneButton() {
        let userInfo: [String?] = signUpView.returnText()
        print(EmailChecker(userInfo[0]).check() && PasswordChecker(userInfo[1]).check() && PasswordIsSameChecker(userInfo[1], userInfo[2]).check())
    }
}

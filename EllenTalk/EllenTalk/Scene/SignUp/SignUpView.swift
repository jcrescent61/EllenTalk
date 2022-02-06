//
//  SignUpView.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func touchUpDoneButton()
}

class SignUpView: UIView {
    
    weak var delegate: SignUpViewDelegate?
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "이메일"
        label.textColor = .init(named: "subColor")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.layer.cornerRadius = 8
        textField.textAlignment = .init(.justified)
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "비밀번호"
        label.textColor = .init(named: "subColor")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.layer.cornerRadius = 8
        textField.textAlignment = .init(.justified)
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        return textField
    }()
    
    private lazy var passwordCheckLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "비밀번호 확인"
        label.textColor = .init(named: "subColor")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var passwordCheckTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.layer.cornerRadius = 8
        textField.textAlignment = .init(.justified)
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        return textField
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .init(named: "subColor")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchUpDoneButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpUI()
    }
}

extension SignUpView {
    private func setUp() {
        self.backgroundColor = .white
        addSubviews(emailLabel,
                    emailTextField,
                    passwordLabel,
                    passwordTextField,
                    passwordCheckLabel,
                    passwordCheckTextField,
                    doneButton)
    }
    
    private func setUpUI() {
        
        // MARK: - emailLabel
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // MARK: - emailTextField
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // MARK: - passwordLabel
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // MARK: - passwordTextField
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // MARK: - passwordCheckLabel
        NSLayoutConstraint.activate([
            passwordCheckLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            passwordCheckLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordCheckLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordCheckLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // MARK: - passwordCheckTextField
        NSLayoutConstraint.activate([
            passwordCheckTextField.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor),
            passwordCheckTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordCheckTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordCheckTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // MARK: - doneButton
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            doneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 60),
            doneButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc
    private func touchUpDoneButton() {
        delegate?.touchUpDoneButton()
        print("DoneButton Touch Event")
    }
}

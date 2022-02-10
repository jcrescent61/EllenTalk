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
    private var signUpContentsViews: [SignUpViewable] = [
        SignUpContentsData.email.returnView(),
        SignUpContentsData.password.returnView(),
        SignUpContentsData.passwordCheck.returnView()
    ]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
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
        
        addSubviews(stackView,
                    doneButton)
        
        signUpContentsViews.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setUpUI() {
        
        // MARK: - stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
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
    }
    
    func returnText() -> [String?] {
        return ["", "", ""]
    }
}

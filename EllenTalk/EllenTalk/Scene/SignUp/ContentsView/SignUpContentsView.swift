//
//  UserInfoHandler.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/07.
//

import UIKit

struct SignUpConponent {
    let title: String
    let placeHolder: String
}

class SignUpContentsView: UIView, SignUpViewable {
    
     private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .init(named: "subColor")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textFiledBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = .black
        textField.backgroundColor = .clear
        textField.textAlignment = .init(.justified)
        textField.font = .systemFont(ofSize: 15, weight: .bold)
        return textField
    }()
    
    private lazy var lightView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        view.tintColor = .green
       return view
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

extension SignUpContentsView {
    convenience init(_ component: SignUpConponent) {
        self.init(frame: .zero)
        titleLabel.text = component.title
        textField.placeholder = component.placeHolder
        setUp()
        setUpUI()
    }
    
    private func setUp() {
        backgroundColor = .white
        addSubviews(titleLabel,
                    textFiledBackground,
                    textField,
                    lightView)
    }
    
    private func setUpUI() {
        
        // MARK: titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // MARK: textFieldBackground
        NSLayoutConstraint.activate([
            textFiledBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            textFiledBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            textFiledBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            textFiledBackground.heightAnchor.constraint(equalToConstant: 42),
            textFiledBackground.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // MARK: textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: textFiledBackground.topAnchor),
            textField.leadingAnchor.constraint(equalTo: textFiledBackground.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: lightView.leadingAnchor),
            textField.bottomAnchor.constraint(equalTo: textFiledBackground.bottomAnchor)
        ])
        
        // MARK: lightView
        NSLayoutConstraint.activate([
            lightView.topAnchor.constraint(equalTo: textFiledBackground.topAnchor, constant: 10),
            lightView.trailingAnchor.constraint(equalTo: textFiledBackground.trailingAnchor, constant: -10),
            lightView.bottomAnchor.constraint(equalTo: textFiledBackground.bottomAnchor, constant: -10),
            lightView.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}

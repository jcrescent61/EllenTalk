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
        label.textColor = UIColor(named: "subColor")
        label.textAlignment = .left
         label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textFieldBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.textAlignment = .init(.justified)
        textField.font = UIFont.preferredFont(forTextStyle: .body)
        return textField
    }()
    
    private lazy var lightView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        view.tintColor = .clear
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
        backgroundColor = .clear
        addSubviews(titleLabel,
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
        
        // MARK: textField
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 42),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // MARK: lightView
        NSLayoutConstraint.activate([
            lightView.topAnchor.constraint(equalTo: textField.topAnchor, constant: 10),
            lightView.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -10),
            lightView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -10),
            lightView.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}

//
//  DoubleSignUpContentsView.swift
//  EllenTalk
//
//  Created by Ellen on 2022/04/19.
//

import UIKit

class DoubleSignUpContentsView: UIView, SignUpViewable {
    
     private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(named: "subColor")
        label.textAlignment = .left
         label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
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
    
    private lazy var secondTitleLabel: UILabel = {
       let label = UILabel(frame: .zero)
       label.textColor = UIColor(named: "subColor")
       label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .headline)
       label.numberOfLines = 0
       return label
   }()
   
   private lazy var secondTextField: UITextField = {
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
   
   private lazy var secondLightView: UIImageView = {
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

extension DoubleSignUpContentsView {
    convenience init(_ component: SignUpConponent, _ secondComponent: SignUpConponent) {
        self.init(frame: .zero)
        titleLabel.text = component.title
        textField.placeholder = component.placeHolder
        secondTitleLabel.text = secondComponent.title
        secondTextField.placeholder = secondComponent.placeHolder
        
        setUp()
        setUpUI()
    }
    
    private func setUp() {
        addSubviews(titleLabel,
                    textField,
                    lightView,
                    secondTitleLabel,
                    secondTextField,
                    secondLightView)
    }
    
    private func setUpUI() {
        backgroundColor = .clear
        
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
            textField.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        // MARK: lightView
        NSLayoutConstraint.activate([
            lightView.topAnchor.constraint(equalTo: textField.topAnchor, constant: 10),
            lightView.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -10),
            lightView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -10),
            lightView.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        // MARK: secondTitleLabel
        NSLayoutConstraint.activate([
            secondTitleLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            secondTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondTitleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // MARK: secondTextField
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 5),
            secondTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondTextField.heightAnchor.constraint(equalToConstant: 42),
            secondTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // MARK: secondLightView
        NSLayoutConstraint.activate([
            secondLightView.topAnchor.constraint(equalTo: secondTextField.topAnchor, constant: 10),
            secondLightView.trailingAnchor.constraint(equalTo: secondTextField.trailingAnchor, constant: -10),
            secondLightView.bottomAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: -10),
            secondLightView.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}

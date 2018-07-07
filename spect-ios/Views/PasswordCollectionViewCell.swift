//
//  PasswordCollectionViewCell.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/2/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

protocol RegisterDelegate {
    func handleRegister(password: String)
}

class PasswordCollectionViewCell: UICollectionViewCell {
    var delegate: RegisterDelegate?
    
    // numeric constants
    var fieldHeight: CGFloat = 40
    var fieldTopMargin: CGFloat = 8
    var fieldHorizontalMargin: CGFloat = 20
    var sectionTopMargin: CGFloat = 16
    var buttonHeight: CGFloat = 40.0
    
    // views
    var passwordLabel: UILabel!
    var passwordField: UITextField!
    var retypeLabel: UILabel!
    var retypeField: UITextField!
    var registerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordField = UITextField()
        passwordField.backgroundColor = .white
        passwordField.isSecureTextEntry = true
        
        retypeLabel = UILabel()
        retypeLabel.text = "Retype Password"
        retypeField = UITextField()
        retypeField.backgroundColor = .white
        retypeField.isSecureTextEntry = true
        
        registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.layer.cornerRadius = buttonHeight/2.0
        registerButton.layer.backgroundColor = UIColor.spectDarkBlue.cgColor
        registerButton.setTitleColor(.spectWhite, for: .normal)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordField)
        contentView.addSubview(retypeLabel)
        contentView.addSubview(retypeField)
        contentView.addSubview(registerButton)
    }
    
    override func updateConstraints() {
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.centerY).multipliedBy(0.5)
            make.leading.equalTo(contentView.snp.centerX).multipliedBy(0.25)
        }
        
        passwordField.snp.makeConstraints { make in
            make.leading.equalTo(passwordLabel)
            make.trailing.equalTo(contentView.snp.centerX).multipliedBy(1.75)
            make.top.equalTo(passwordLabel.snp.bottom).offset(fieldTopMargin)
            make.height.equalTo(fieldHeight)
        }
        
        retypeLabel.snp.makeConstraints { make in
            make.leading.equalTo(passwordLabel)
            make.top.equalTo(passwordField.snp.bottom).offset(sectionTopMargin)
        }
        
        retypeField.snp.makeConstraints { make in
            make.leading.height.trailing.equalTo(passwordField)
            make.top.equalTo(retypeLabel.snp.bottom).offset(fieldTopMargin)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(retypeField.snp.bottom).offset(sectionTopMargin*4)
            make.height.equalTo(buttonHeight)
            make.leading.trailing.equalTo(passwordField)
        }
        
        super.updateConstraints()
    }
    
    @objc func register() {
        guard let password = passwordField.text else {
            return
        }
        delegate?.handleRegister(password: password)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

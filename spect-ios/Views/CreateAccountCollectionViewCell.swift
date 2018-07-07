//
//  CreateAccountCollectionViewCell.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/2/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

protocol CreateAccountDelegate {
    func next(firstName: String, lastName: String)
}

class CreateAccountCollectionViewCell: UICollectionViewCell {
    var delegate: CreateAccountDelegate!
    
    // consts
    var fieldHeight = 40
    var fieldTopMargin = 8
    var fieldHorizontalMargin: CGFloat = 20
    var sectionTopMargin = 16
    var buttonHeight: CGFloat = 40.0
    
    
    // views
    var firstNameLabel: UILabel!
    var firstNameField: UITextField!
    var lastNameLabel: UILabel!
    var lastNameField: UITextField!
    var dobLabel: UILabel!
    var monthField: UITextField!
    var dayField: UITextField!
    var yearField: UITextField!
    var studentCodeLabel: UILabel!
    var studentCodeField: UITextField!
    var nextButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 3;
        
        firstNameLabel = UILabel()
        firstNameLabel.text = "First name"
        firstNameField = UITextField()
        firstNameField.layer.backgroundColor = UIColor.white.cgColor
        
        lastNameLabel = UILabel()
        lastNameLabel.text = "Last name"
        lastNameField = UITextField()
        lastNameField.layer.backgroundColor = UIColor.white.cgColor
        
        dobLabel = UILabel()
        dobLabel.text = "Date of Birth"
        
        monthField = CustomTextField()
        monthField.backgroundColor = .green
        monthField.placeholder = "mm"
        
        dayField = CustomTextField()
        dayField.backgroundColor = UIColor.white
        dayField.placeholder = "dd"
    
        yearField = CustomTextField()
        yearField.backgroundColor = .red
        yearField.placeholder = "yyyy"
        
        nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = buttonHeight/2.0
        nextButton.layer.backgroundColor = UIColor.spectDarkBlue.cgColor
        nextButton.setTitleColor(.spectWhite, for: .normal)
        nextButton.addTarget(self, action: #selector(handlePaging), for: .touchUpInside)
        
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(firstNameField)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(lastNameField)
        contentView.addSubview(dobLabel)
        contentView.addSubview(monthField)
        contentView.addSubview(dayField)
        contentView.addSubview(yearField)
        contentView.addSubview(nextButton)
    }
    
    override func updateConstraints() {
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.centerY).multipliedBy(0.5)
            make.leading.equalTo(contentView.snp.centerX).multipliedBy(0.25)
        }
        
        firstNameField.snp.makeConstraints { make in
            make.leading.equalTo(firstNameLabel)
            make.trailing.equalTo(contentView.snp.centerX).multipliedBy(1.75)
            make.top.equalTo(firstNameLabel.snp.bottom).offset(fieldTopMargin)
            make.height.equalTo(fieldHeight)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(firstNameLabel)
            make.top.equalTo(firstNameField.snp.bottom).offset(sectionTopMargin)
        }
        
        lastNameField.snp.makeConstraints { make in
            make.leading.equalTo(lastNameLabel)
            make.leading.trailing.height.equalTo(firstNameField)
            make.top.equalTo(lastNameLabel.snp.bottom).offset(fieldTopMargin)
        }
        
        dobLabel.snp.makeConstraints { make in
            make.leading.equalTo(firstNameLabel)
            make.top.equalTo(lastNameField.snp.bottom).offset(sectionTopMargin)
        }
        
        monthField.snp.makeConstraints { make in
            make.leading.equalTo(lastNameLabel)
            make.height.equalTo(fieldHeight)
            make.width.equalTo(56)
            make.top.equalTo(dobLabel.snp.bottom).offset(fieldTopMargin)
        }
        
        dayField.snp.makeConstraints { make in
            make.leading.equalTo(monthField.snp.trailing).offset(fieldHorizontalMargin)
            make.height.width.top.equalTo(monthField)
        }

        yearField.snp.makeConstraints { make in
            make.trailing.equalTo(firstNameField)
            make.top.height.equalTo(monthField)
            make.leading.equalTo(dayField.snp.trailing).offset(fieldHorizontalMargin)
        }
            
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(monthField.snp.bottom).offset(sectionTopMargin*4)
            make.height.equalTo(buttonHeight)
            make.leading.trailing.equalTo(firstNameField)
        }
        
        super.updateConstraints()
    }
    
    @objc func handlePaging() {
        guard let firstName = firstNameField.text, let lastName = lastNameField.text else {
            return
        }
        delegate.next(firstName: firstName, lastName: lastName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

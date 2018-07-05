//
//  CreateAccountCollectionViewCell.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/2/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

class CreateAccountCollectionViewCell: UICollectionViewCell {
    var fieldHeight = 40
    var fieldTopMargin = 8
    var fieldHorizontalMargin: CGFloat = 8
    var sectionTopMargin = 16
    
    var firstNameLabel: UILabel!
    var firstNameField: UITextField!
    var lastNameLabel: UILabel!
    var lastNameField: UITextField!
    var dobLabel: UILabel!
    var dobField: UIStackView!
    var monthField: CustomTextField!
    var dayField: CustomTextField!
    var yearField: CustomTextField!
    var studentCodeLabel: UILabel!
    var studentCodeField: UITextField!
    
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
        
        dayField = CustomTextField()
        dayField.layer.backgroundColor = UIColor.white.cgColor
        dayField.width = 4.0
        dayField.backgroundColor = .red
        
        monthField = CustomTextField()
        monthField.layer.backgroundColor = UIColor.white.cgColor
        monthField.width = 4.0
    
        yearField = CustomTextField()
        yearField.layer.backgroundColor = UIColor.white.cgColor
        yearField.width = 8.0
        yearField.backgroundColor = .red
        
        dobField = UIStackView(arrangedSubviews: [dayField, monthField, yearField])
        dobField.axis = .horizontal
        dobField.distribution = .fillProportionally
        
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(firstNameField)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(lastNameField)
        contentView.addSubview(dobLabel)
        contentView.addSubview(dobField)
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
        
        dobField.snp.makeConstraints { make in
            make.leading.equalTo(lastNameLabel)
            make.leading.trailing.height.equalTo(firstNameField)
            make.top.equalTo(dobLabel.snp.bottom).offset(fieldTopMargin)
        }
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

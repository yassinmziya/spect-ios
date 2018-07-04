//
//  AccountTypeCollectionViewCell.swift
//  spect-ios
//
//  Created by Yassin Mziya on 6/28/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

class AccountTypeCollectionViewCell: UICollectionViewCell {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = contentView.frame.height/2
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor.spectWhite
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 1
        
        label = UILabel()
        label.textColor = UIColor.spectDarkBlue
        
        contentView.addSubview(label)
    }
    
    override func updateConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

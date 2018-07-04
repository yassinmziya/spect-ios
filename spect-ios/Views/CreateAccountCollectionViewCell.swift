//
//  CreateAccountCollectionViewCell.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/2/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit

class CreateAccountCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .red;
        contentView.layer.cornerRadius = 3;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

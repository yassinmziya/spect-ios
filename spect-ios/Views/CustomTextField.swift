//
//  CustomTextField.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/4/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var width: Double = 1
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: 30)
    }

}

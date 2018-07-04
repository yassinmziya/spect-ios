//
//  StartViewController.swift
//  spect-ios
//
//  Created by Yassin Mziya on 6/28/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    var nameLabel: UILabel!
    var logoImageView: UIImageView!
    var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.spectWhite
        view.setGradientBackground(colorOne: UIColor.spectLightBlue, colorTwo: UIColor.spectWhite)
        self.navigationController?.isNavigationBarHidden = true
        
        logoImageView = UIImageView(image: UIImage(named: "spect_logo"))
        
        startButton = UIButton()
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .spectDarkBlue
        startButton.tintColor = .spectWhite
        startButton.layer.cornerRadius = 25
        startButton.layer.masksToBounds = true
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        view.addSubview(logoImageView)
        view.addSubview(startButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.snp.centerY).multipliedBy(1.75)
            make.leading.trailing.equalTo(logoImageView)
            make.height.equalTo(50)
        }
    }
    
    @objc func start() {
        self.navigationController?.pushViewController(SelectAccountTypeViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  LoginViewController.swift
//  spect-ios
//
//  Created by Yassin Mziya on 6/30/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
    // views
    var logoImageView: UIImageView!
    var idTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var registerButton: UIButton!
    
    // firebase
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //firebase
        ref = Database.database().reference(fromURL: "https://spect-ios.firebaseio.com/")
        
        // views
        view.setGradientBackground(colorOne: UIColor.spectLightBlue, colorTwo: UIColor.spectWhite)
        logoImageView = UIImageView(image: UIImage(named:"spect_logo"))
        
        idTextField = UITextField()
        idTextField.placeholder = "Student Code"
        idTextField.textAlignment = NSTextAlignment.center
        idTextField.layer.borderColor = UIColor.white.cgColor
        idTextField.layer.backgroundColor = UIColor.white.cgColor
        idTextField.layer.cornerRadius = 20
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textAlignment = NSTextAlignment.center
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 20
        
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .spectDarkBlue
        loginButton.tintColor = .spectWhite
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        loginButton.layer.shadowRadius = 2
        loginButton.layer.shadowOpacity = 1
        
        registerButton = UIButton()
        registerButton.setTitle("Create Account", for: .normal)
        registerButton.setTitleColor(.spectDarkBlue, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        registerButton.addTarget(self, action: #selector(transitionRegistration), for: .touchUpInside)
        
        view.addSubview(logoImageView)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.height.width.equalTo(140)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(224)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.height.width.equalTo(idTextField)
            make.top.equalTo(idTextField.snp.bottom).offset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(224)
            make.top.equalTo(view.snp.centerY).multipliedBy(1.5)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func transitionRegistration() {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
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

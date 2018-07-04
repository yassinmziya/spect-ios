//
//  RegisterViewController.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/2/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // consts
    let pages: Int = 2
    let accountCellReuseId: String = "accountCellReuseId"
    let passwordCellReuseId: String = "passwordCellReuseId"
    
    // views
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.setGradientBackground(colorOne: .spectLightBlue, colorTwo: .spectWhite)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CreateAccountCollectionViewCell.self, forCellWithReuseIdentifier: accountCellReuseId)
        collectionView.register(PasswordCollectionViewCell.self, forCellWithReuseIdentifier: passwordCellReuseId)
        collectionView.isPagingEnabled = true
        
        view.addSubview(collectionView)
        setupConstraints()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountCellReuseId, for: indexPath) as! CreateAccountCollectionViewCell
            cell.setNeedsUpdateConstraints()
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: passwordCellReuseId, for: indexPath) as! PasswordCollectionViewCell
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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

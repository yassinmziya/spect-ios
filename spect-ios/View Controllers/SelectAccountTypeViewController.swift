//
//  SelectAccountTypeViewController.swift
//  spect-ios
//
//  Created by Yassin Mziya on 6/28/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import UIKit
import SnapKit

class SelectAccountTypeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    var accountTypes = ["School Leader", "Teacher", "Parent", "Student"]
    var reuseIdentifier = "accountTypeCell"
    
    let hInset: CGFloat = 40;
    let hMargin: CGFloat = 8;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: UIColor.spectLightBlue, colorTwo: UIColor.spectWhite)
        
        // Do any additional setup after loading the view.
        // view.backgroundColor = UIColor.spectWhite
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: hInset, bottom: 0, right: hInset)
        let cellDiameter: CGFloat = (view.frame.width/2) - hInset - hMargin/2
        layout.estimatedItemSize = CGSize(width: cellDiameter, height: cellDiameter)
        
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AccountTypeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(collectionView)
        setupConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.centerY.bottom.equalToSuperview()
            make.top.equalTo(view.snp.centerY).offset(-75)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AccountTypeCollectionViewCell
        cell.label.text = accountTypes[indexPath.row]
        cell.setNeedsUpdateConstraints()
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let shorterAxis: CGFloat! = [view.frame.height, view.frame.width].min()
        let cellDiameter: CGFloat = shorterAxis/2 - hInset - hMargin
        return CGSize(width: cellDiameter, height: cellDiameter)
    }
    
    @objc func handleTap() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
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

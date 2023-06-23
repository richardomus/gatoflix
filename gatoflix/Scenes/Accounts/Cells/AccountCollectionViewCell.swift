//
//  AccountCollectionViewCell.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 03/06/23.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var boxView: UIView?
    @IBOutlet var userNameLabel: UILabel?
    
    func configure(_ data: UserModel?) {
        
        boxView?.layer.cornerRadius = 8
        boxView?.backgroundColor = data?.color
        userNameLabel?.text = data?.name
        
    }
}

//
//  AccountViewController.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 03/06/23.
//

import UIKit

class AccountViewController: UIViewController {

    let datasource: [UserModel] = [
        UserModel(name: "José", color: .blue),
        UserModel(name: "Ailton", color: .yellow),
        UserModel(name: "Maria", color: .systemPink),
        UserModel(name: "Donizildo", color: .purple),
        UserModel(name: "Zezinho", color: .lightGray),
        UserModel(name: "mais", color: .black)
    ]
    
    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AccountViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 128, height: 128)
    }
}

extension AccountViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "gotToLoggedHome", sender: self)
    }
}

extension AccountViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "AccountCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? AccountCollectionViewCell
       
        cell?.configure(datasource[indexPath.row])
        
        return cell! 
    }
    
}

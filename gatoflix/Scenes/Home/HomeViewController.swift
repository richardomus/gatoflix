//
//  HomeViewController.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 03/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var logo: UIImageView?
    @IBOutlet var widthConstraint: NSLayoutConstraint?
    @IBOutlet var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo?.alpha = 0.0
        
        UIView.animate(withDuration: 1.0) {
            self.logo?.alpha = 1.0
        } completion: { value in
            
            UIView.animate(withDuration: 1.6, delay: 0, options: .curveEaseIn) {
                self.widthConstraint?.constant = 8192
                self.heightConstraint?.constant = 8192
                self.logo?.alpha = 0.0
                self.view.layoutIfNeeded()
            } completion: { value in
                self.performSegue(withIdentifier: "goToAccounts", sender: self)
            }
        }
    }
}

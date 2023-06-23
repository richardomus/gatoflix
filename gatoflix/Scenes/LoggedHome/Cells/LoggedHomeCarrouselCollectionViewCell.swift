//
//  LoggedHomeCarrouselCollectionViewCell.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 04/06/23.
//

import UIKit

class LoggedHomeCarrouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(asset: String?) {
        imageView?.image = UIImage(named: asset ?? String())
    }

}

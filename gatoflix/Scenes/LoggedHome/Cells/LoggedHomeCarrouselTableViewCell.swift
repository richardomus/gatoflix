//
//  LoggedHomeCarrouselTableViewCell.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 04/06/23.
//

import UIKit

protocol LoggedHomeCarrouselTableViewCellDelegate: AnyObject {
    func didSelectedMovie(movie: String?)
}

class LoggedHomeCarrouselTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var collectionView: UICollectionView?
    
    private var datasource: [String]? = []
    
    weak var delegate: LoggedHomeCarrouselTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView?.register(UINib(nibName: "LoggedHomeCarrouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LoggedHomeCarrouselCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String?, assetList: [String]?) {
        self.titleLabel?.text = title
        self.datasource = assetList
    }
}

extension LoggedHomeCarrouselTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 128, height: 160)
    }
}

extension LoggedHomeCarrouselTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedMovie(movie: datasource?[indexPath.row])
    }
}

extension LoggedHomeCarrouselTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datasource?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "LoggedHomeCarrouselCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? LoggedHomeCarrouselCollectionViewCell
        
        cell?.configure(asset: datasource?[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

//
//  MainTableViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 11/04/2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchTF.setupRightImage(imageName: "searchIcon")
        collectionView.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
    }
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

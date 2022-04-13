//
//  CategoryCoverCollectionViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 13/04/2022.
//

import UIKit

class CategoryCoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categImage: UIImageView!
    
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Round image
        categImage.layer.masksToBounds = false
        categImage.layer.cornerRadius = categImage.frame.height/2
        categImage.clipsToBounds = true
    }
    
}



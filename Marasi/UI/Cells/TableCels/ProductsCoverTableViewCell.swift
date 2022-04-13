//
//  ProductsCoverTableViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 13/04/2022.
//

import UIKit

class ProductsCoverTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var headingTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

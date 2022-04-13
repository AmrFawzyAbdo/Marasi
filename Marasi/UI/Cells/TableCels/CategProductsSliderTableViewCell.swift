//
//  CategProductsSliderTableViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 12/04/2022.
//

import UIKit

class CategProductsSliderTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var departmentName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var allBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

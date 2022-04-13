//
//  ProductsCoverCollectionViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 13/04/2022.
//

import UIKit

class ProductsCoverCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var saleAmount: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var productTilte: UILabel!
    @IBOutlet weak var btnLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Button border
        btnLabel.setTitleColor(UIColor(red:231/255, green:93/255, blue:36/255, alpha: 1), for: .normal)
        btnLabel.backgroundColor = .clear
        btnLabel.layer.cornerRadius = 6
        btnLabel.layer.borderWidth = 1
        btnLabel.layer.borderColor = UIColor(red:231/255, green:93/255, blue:36/255, alpha: 1).cgColor
    }

    @IBAction func addToCart(_ sender: Any) {
    }
    
    
}

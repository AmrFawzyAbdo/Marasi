//
//  CategProductSliderCollectionViewCell.swift
//  Marasi
//
//  Created by Amr Ghonim on 12/04/2022.
//

import UIKit

class CategProductSliderCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var badgeLAbel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var saleAmount: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Button border
        addToCartBtn.backgroundColor = .clear
        addToCartBtn.layer.cornerRadius = 6
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor(red:231/255, green:93/255, blue:36/255, alpha: 1).cgColor
    }
    
    @IBAction func addToCart(_ sender: Any) {
    }
    
}

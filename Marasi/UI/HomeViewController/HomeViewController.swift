//
//  HomeViewController.swift
//  Marasi
//
//  Created by Amr Ghonim on 11/04/2022.
//

import UIKit
import Kingfisher
import CoreAudio

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headLabel: PaddingLabel!
    @IBOutlet weak var searchBtn: UIButton!
    
    //MARK: - Variables
    var homeContent : [Banner]?
    let progressHUD = ProgressHUD(text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        getHomeRequest()
        uiDesign()
    }


    //MARK: - Calling home requests
    func getHomeRequest(){
        self.view.addSubview(progressHUD)
        APIClient().getHome { res in
            self.progressHUD.removeFromSuperview()
            self.homeContent = res.data?.banners
            self.tableView.reloadData()
        } onError: { error in
            self.progressHUD.removeFromSuperview()
            self.showAlertController(title: "Error!", message: error, actions: [])
        }
    }
    
    //MARK: - UI
    func uiDesign(){
        //Setting the border
        headLabel.layer.borderWidth = 2
        headLabel.layer.borderColor = UIColor.white.cgColor
                
        //Setting the round
        headLabel.layer.masksToBounds = true
        headLabel.layer.cornerRadius = 6
            
        //Setting the padding label
        headLabel.edgeInset = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 3)
    }
   
    
}
    

//MARK: - TableView delegate, and datasource

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeContent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = homeContent?[indexPath.row].content
        if homeContent?[indexPath.row].type == TypeEnum.main{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            let url = URL(string:  item?.backgroundImage ?? "")
            cell.backgroundImage.kf.indicatorType = .activity
            cell.backgroundImage.kf.setImage(with: url)
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
        }else if homeContent?[indexPath.row].type == .categoryProductsSlider{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategProductsSliderTableViewCell", for: indexPath) as! CategProductsSliderTableViewCell
            let heading = homeContent?[indexPath.row].content?.heading
            if heading == "الأكثر رواجاً ⚡️" || heading == "اشتر عدد 4 بقيمة 2 فقط 🎊"{
                cell.allBtn.isHidden = false
            }else{
                cell.allBtn.isHidden = true
            }
            cell.departmentName.text = item?.heading
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
        }else if homeContent?[indexPath.row].type == .productsCover{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCoverTableViewCell", for: indexPath) as! ProductsCoverTableViewCell
            cell.headingTitle.text = item?.heading
            let url = URL(string:  item?.backgroundImage ?? "")
            cell.backgroundImage.kf.indicatorType = .activity
            cell.backgroundImage.kf.setImage(with: url)
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
            
        }else if homeContent?[indexPath.row].type == .categoryCover{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCoverTableViewCell", for: indexPath) as! CategoryCoverTableViewCell
            let url = URL(string:  item?.backgroundImage ?? "")
            cell.backgroundImage.kf.indicatorType = .activity
            cell.backgroundImage.kf.setImage(with: url)
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
        }else if homeContent?[indexPath.row].type == .brandsSlider{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandsSliderTableViewCell", for: indexPath) as! BrandsSliderTableViewCell
            cell.headingLbl.text = item?.heading
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategProductsSliderTableViewCell", for: indexPath) as! CategProductsSliderTableViewCell
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.tag = indexPath.row
            cell.collectionView.reloadData()
            return cell
        }
 
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        // hide and show search button
        if indexPath.row >= 3 {
            searchBtn.isHidden = false
        }else{
           searchBtn.isHidden = true
        }
    }
    
}


//MARK: - CollectionView delegate, and datasource

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeContent?[collectionView.tag].type == TypeEnum.main{
            return homeContent?[collectionView.tag].content?.blocks?.count ?? 0
        }else if homeContent?[collectionView.tag].type == .categoryProductsSlider {
            return homeContent?[collectionView.tag].content?.products?.count ?? 0
        }else if homeContent?[collectionView.tag].type == .productsCover{
            return homeContent?[collectionView.tag].content?.products?.count ?? 0
        }else if homeContent?[collectionView.tag].type == .categoryCover{
            return homeContent?[collectionView.tag].content?.blocks?.count ?? 0
        }else if homeContent?[collectionView.tag].type == TypeEnum.brandsSlider {
            return homeContent?[collectionView.tag].content?.brands?.count ?? 0
        }else{
            return homeContent?[collectionView.tag].content?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if homeContent?[collectionView.tag].type == TypeEnum.main{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            let item = homeContent?[collectionView.tag].content
            let url = URL(string:  item?.blocks?[indexPath.item].blockImage ?? "")
            cell.blockImage.kf.indicatorType = .activity
            cell.blockImage.kf.setImage(with: url)
            cell.title.text = item?.blocks?[indexPath.item].title
            return cell
        }else if homeContent?[collectionView.tag].type == .categoryProductsSlider {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategProductSliderCollectionViewCell", for: indexPath) as! CategProductSliderCollectionViewCell
            let item = homeContent?[collectionView.tag].content
            let url = URL(string:  item?.products?[indexPath.item].image ?? "")
            cell.productImage.kf.indicatorType = .activity
            let placeImage = UIImage(named: "noImage")
            cell.productImage.kf.setImage(with : url,placeholder: placeImage)
            cell.productTitle.text = item?.products?[indexPath.item].title
            cell.badgeLAbel.text = item?.products?[indexPath.item].variants?[0].badge
            let strikedOldPrice = NSAttributedString(string: "\(item?.products?[indexPath.item].variants?[0].price ?? 0.0)").withStrikeThrough(1)
            cell.oldPrice.attributedText = strikedOldPrice
            cell.currentPrice.text = "\(item?.products?[indexPath.item].variants?[0].salePrice ?? 0)" + " " + "\(item?.products?[indexPath.item].variants?[0].currency ?? "")"
            cell.saleAmount.text = "\(item?.products?[indexPath.item].variants?[0].saleAmount ?? 0)" + "" + " ٪ خصم"
            cell.productBrand.text = item?.products?[indexPath.item].brand
            return cell
        }else if homeContent?[collectionView.tag].type == .productsCover{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCoverCollectionViewCell", for: indexPath) as! ProductsCoverCollectionViewCell
            let item = homeContent?[collectionView.tag].content
            let url = URL(string:  item?.products?[indexPath.item].image ?? "")
            cell.productImage.kf.indicatorType = .activity
            cell.productImage.kf.setImage(with : url)
            cell.productTilte.text = item?.products?[indexPath.item].title
            cell.badgeLabel.text = item?.products?[indexPath.item].variants?[0].badge
            let strikedOldPrice = NSAttributedString(string: "\(item?.products?[indexPath.item].variants?[0].price ?? 0.0)").withStrikeThrough(1)
            cell.oldPrice.attributedText = strikedOldPrice
            cell.currentPrice.text = "\(item?.products?[indexPath.item].variants?[0].salePrice ?? 0)" + " " + "\(item?.products?[indexPath.item].variants?[0].currency ?? "")"
            cell.saleAmount.text = "\(item?.products?[indexPath.item].variants?[0].saleAmount ?? 0)" + "" + " ٪ خصم"
            cell.productBrand.text = item?.products?[indexPath.item].brand
            cell.btnLabel.setTitle("عرض الخيارات", for: .normal)
            return cell
        }else if homeContent?[collectionView.tag].type == .categoryCover{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCoverCollectionViewCell", for: indexPath) as! CategoryCoverCollectionViewCell
            let item = homeContent?[collectionView.tag].content
            let url = URL(string:  item?.blocks?[indexPath.row].image ?? "")
            cell.categImage.kf.indicatorType = .activity
            cell.categImage.kf.setImage(with: url)
            return cell
        }else if homeContent?[collectionView.tag].type == .brandsSlider{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsSliderCollectionViewCell", for: indexPath) as! BrandsSliderCollectionViewCell
            let item = homeContent?[collectionView.tag].content
            let url = URL(string:  item?.brands?[indexPath.item].image ?? "")
            cell.brandImage.kf.indicatorType = .activity
            cell.brandImage.kf.setImage(with: url)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            return cell
        }
    }
}

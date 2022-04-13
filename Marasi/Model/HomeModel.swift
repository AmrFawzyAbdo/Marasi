//
//  HomeModel.swift
//  Marasi
//
//  Created by Amr Ghonim on 11/04/2022.
//


import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    var status: Status?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var popupAd: PopupAd?
    var meta: Meta?
    var banners: [Banner]?
}

// MARK: - Banner
struct Banner: Codable {
    var type: TypeEnum?
    var content: Content?
}

// MARK: - Content
struct Content: Codable {
    var backgroundImage: String?
    var backgroundFocusPoint: String?
    var backgroundColor: Color?
    var heading: String?
    var blocks: [Block]?
    var type: String?
    var id: Int?
    var products: [Product]?
    var textColor: Color?
    var brands: [Brand]?
}

enum Color: String, Codable {
    case empty = ""
    case ffffff = "#ffffff"
}

// MARK: - Block
struct Block: Codable {
    var type: String?
    var id: Int?
    var title: String?
    var blockImage: String?
    var blockBackgroundColor, textColor: String?
    var image: String?
}

// MARK: - Brand
struct Brand: Codable {
    var id: Int?
    var image: String?
    var category: Int?
}

// MARK: - Product
struct Product: Codable {
    var id: Int?
    var title: String?
    var image: String?
    var brand: String?
    var rating: Double?
    var variants: [Variant]?
}

// MARK: - Variant
struct Variant: Codable {
    var id: Int?
    var isDefault, hasStock: Bool?
    var stock: Int?
    var unlimitedStock: Bool?
    var minQty, maxQty, weight: Int?
    var dateAdded: String?
    var onSale: Bool?
    var currency: String?
    var price, salePrice, saleAmount: Double?
    var saleType: SaleType?
    var bestSeller: Bool?
    var badge: String?
    var badgeTextColor: Color?
    var badgeBackground: BadgeBackground?
}


enum BadgeBackground: String, Codable {
    case empty = ""
    case the050505 = "#050505"
}


enum SaleType: String, Codable {
    case empty = ""
    case percent = "percent"
}

enum TypeEnum: String, Codable {
    case brandsSlider = "brandsSlider"
    case categoryCover = "categoryCover"
    case categoryProductsSlider = "categoryProductsSlider"
    case main = "main"
    case productsCover = "productsCover"
}

// MARK: - Meta
struct Meta: Codable {
    var pageNumber, pageLimit, totalPages: Int?
}

// MARK: - PopupAd
struct PopupAd: Codable {
}

// MARK: - Status
struct Status: Codable {
    var success: Bool?
    var code: Int?
    var message, devMsg: String?
    var update: Update?
}

// MARK: - Update
struct Update: Codable {
    var forceUpdate: Bool?
    var forceUpdateMessage: String?
}

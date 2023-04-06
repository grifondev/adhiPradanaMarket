//
//  page1Model.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

struct FlashSaleResponce: Codable {
    var flash_sale: [FlashSaleItem] = Array()
}       // array of flash sale items

struct FlashSaleItem : Codable {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: String
}       //one flash sale item

struct LatestDealsResponce: Codable {
    var latest: [LatestDealsItem] = Array()
}       // array of latest deals items

struct LatestDealsItem: Codable {
    var category: String
    var name: String
    var price: Int
    var image_url: String
}       //one flash sale item

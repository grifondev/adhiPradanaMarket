//
//  page1Model.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

struct FlashSaleResponce: Codable {
    var flash_sale: [FlashSaleItem] = Array()
}

struct FlashSaleItem : Codable {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: String
}

struct LatestDealsResponce: Codable {
    var latest: [LatestDealsItem] = Array()
}

struct LatestDealsItem: Codable {
    var category: String
    var name: String
    var price: Int
    var image_url: String
}

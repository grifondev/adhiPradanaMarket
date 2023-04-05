//
//  page1ViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 04.04.2023.
//

import SwiftUI

var latestDealsItems : [LatestDealsItem] = [LatestDealsItem]()
var flashSaleItems : [FlashSaleItem] = [FlashSaleItem]()

func getLatestDealsItems() -> [LatestDealsItem] {
    return latestDealsItems
}

func loadLatestDealsFromMock() {
    guard let url = URL(string:"https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
        print("Invalid URL!")
        return
    }
    
    let taskForLatest = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error == nil && data != nil && data!.count > 0 {
            if let decodedLatestDealsJSON = try? JSONDecoder().decode(LatestDealsResponce.self, from: data!) {
                latestDealsItems = decodedLatestDealsJSON.latest
            } else {
                return
            }
        } else {
            print("Invalid data!")
            return
        }
    }
    taskForLatest.resume()
}

func getFlashSaleItems() -> [FlashSaleItem] {
    return flashSaleItems
}

func loadFlashSaleFromMock() {
    guard let url2 = URL(string:"https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
        print("Invalid URL!")
        return
    }
    
    let taskForFlashSale = URLSession.shared.dataTask(with: url2) { (data, response, error) in
        if error == nil && data != nil && data!.count > 0 {
            if let decodedFlashSaleJSON = try? JSONDecoder().decode(FlashSaleResponce.self, from: data!) {
                flashSaleItems = decodedFlashSaleJSON.flash_sale
            } else {
                print("incorrect data")
                return
            }
        } else {
            print("Invalid data!")
            return
        }
    }
    taskForFlashSale.resume()
}

func drawBottomTabBarPage1() -> some View {
    return ZStack {
        Rectangle()
            .fill(Color(red: 1, green: 1, blue: 1))
            .frame(width: UIScreen.main.bounds.width, height: 100)
            .cornerRadius(30)
        HStack {
            CreateSelectedInMenuButton(buttonName: "homekit")
                CreateMenuButton(buttonName: "heart")
                CreateMenuButton(buttonName: "cart")
                CreateMenuButton(buttonName: "message")
            NavigationLink(destination: ProfileView(), label: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
            }).navigationBarBackButtonHidden(true)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
        }
    }
}

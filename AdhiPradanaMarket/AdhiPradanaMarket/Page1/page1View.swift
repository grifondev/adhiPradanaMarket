//
//  page1View.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 23.03.2023.
//

import SwiftUI

struct FlashSaleView : View {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: image_url), content: { image in
                image.image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 175)
                    .cornerRadius(15)
                    .backgroundStyle(Color(red: 1, green: 1, blue: 1))
            })
            Text(name)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .frame(width: 90, height: 30)
                .foregroundColor(Color.white)
                .padding(.top, 70)
                .padding(.trailing, 130)
                .multilineTextAlignment(.leading)
            ZStack
            {
                Rectangle()
                    .frame(width: 50, height: 18)
                    .foregroundColor(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .cornerRadius(60)
                    .opacity(0.85)
                    .padding(.top, 10)
                    .padding(.trailing, 120)
                Text(category)
                    .font(.custom("Montserrat-SemiBold", size: 8))
                    .frame(width: 20, height: 5)
                    .foregroundColor(Color(red: 7/255, green: 6/255, blue: 4/255))
                    .padding(.top, 10)
                    .padding(.trailing, 115)
                    .multilineTextAlignment(.center)
            }
            .padding(.trailing, 30)
            .padding(.horizontal, 5)
            
            Text("$ " + String(price) + "0")
                .padding(.top, 130)
                .padding(.trailing, 170)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
            
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239, opacity: 0.85))
                .padding(.top, 120)
                .padding(.leading, 165)
            
            Rectangle()
                .frame(width: 14, height: 1)
                .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                .padding(.leading, 164)
                .padding(.top, 120)
            
            Rectangle()
                .frame(width: 1, height: 14)
                .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                .padding(.leading, 164)
                .padding(.top, 120)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 249/255, green: 58/255, blue: 58/255))
                    .frame(width: 50, height: 18)
                    .cornerRadius(60)
                    .padding(.leading, 140)
                    .padding(.bottom, 130)
                Text(String(discount) + "% off")
                    .foregroundColor(Color .white)
                    .font(.custom("Montserrat-Regular", size: 10))
                    .padding(.leading, 140)
                    .padding(.bottom, 130)
            }
                
        }
            .frame(width: 220, height: 175)
            .padding(.leading, 10)
            .padding(.top, 7)
    }
}

struct latestView : View {
    var category: String
    var name: String
    var price: Int
    var image_url: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: image_url), content: { image in
                image.image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 115)
                    .cornerRadius(10)
            })
            Text(name)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .frame(width: 80, height: 22)
                .foregroundColor(Color.white)
                .padding(.top, 40)
                .padding(.trailing, 75)
                .multilineTextAlignment(.leading)
            ZStack
            {
                Rectangle()
                    .frame(width: 35, height: 12)
                    .foregroundColor(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .cornerRadius(60)
                    .opacity(0.85)
                    .padding(.top, 10)
                    .padding(.trailing, 70)
                Text(category)
                    .font(.custom("Montserrat-SemiBold", size: 5))
                    .frame(width: 20, height: 5)
                    .foregroundColor(Color(red: 7/255, green: 6/255, blue: 4/255))
                    .padding(.top, 10)
                    .padding(.trailing, 68)
                    .multilineTextAlignment(.center)
            }
            .padding(.trailing, 30)
            
            Text("$ " + String(price) + ",000")
                .padding(.top, 90)
                .padding(.trailing, 90)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239, opacity: 0.85))
                .padding(.top, 80)
                .padding(.leading, 120)
            
            Rectangle()
                .frame(width: 7, height: 1)
                .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                .padding(.leading, 120)
                .padding(.top, 80)
            
            Rectangle()
                .frame(width: 1, height: 7)
                .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                .padding(.leading, 120)
                .padding(.top, 80)
                
        }
            .frame(width: 150, height: 115)
            .padding(.leading, 10)
            .padding(.top, 7)
    }
}

struct page1View: View {
    //@State private var currentLocation: String = "Russia"
    
    @State private var searchText: String = ""
    
    @State private var resultLastDeals = [LatestDealsItem]()
    
    @State private var resultFlashSale = [FlashSaleItem]()
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    HStack {
                        Image("4lines_page1")
                            .resizable()
                            .frame(width: 22,height: 24)
                        Text("Trade by")
                            .frame(width: 90, height: 20)
                            .font(.custom("Montserrat-Bold", size: 20))
                            .padding(.trailing, -3)
                            .padding(.leading, 65)
                            .multilineTextAlignment(.trailing)
                        Text("bata")
                            .frame(width: 50, height: 15)
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(Color(red: 78/255, green: 85/255, blue: 215/255, opacity: 1))
                            .multilineTextAlignment(.leading)
                        Image("Avatar_profile")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .padding(.leading, 48)
                    }
                }
                .padding(.top, 21)
                .frame(width: 315)
                .padding(.trailing, 15)
                HStack {
                    Text("Location")
                        .frame(width: 40, height: 8)
                        .font(.custom("Montserrat-Regular", size: 8))
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255, opacity: 1))
                        .padding(.top, 15)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 6, height: 3)
                        .padding(.top, 15)
                        .padding(.leading, -5)
                }
                .padding(.leading, 290)
                .padding(.top, -15)
                
                ZStack {
                    Rectangle()
                        .frame(width: 260,height: 30)
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                        .cornerRadius(60)
                    
                    TextField("What are you looking for?", text: $searchText)
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(Color(red: 6/255, green: 4/255, blue: 4/255))
                        .textContentType(.password)
                        .multilineTextAlignment(.center)
                        .frame(width: 290, height: 30)
                        .cornerRadius(60)
                    
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                        .frame(width: 30,height: 30)
                        .opacity(0.7)
                        .padding(.leading, 210)
                }.padding(.top, 10)
                
                HStack {
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("phone_page1")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                            }
                            
                            Text("Phones")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                    
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("headphones_page1")
                                    .resizable()
                                    .frame(width: 20, height: 18)
                            }
                            
                            Text("Headphones")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                    
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("games_page1")
                                    .resizable()
                                    .frame(width: 20, height: 10)
                            }
                            
                            Text("Games")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                    
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("car_page1")
                                    .resizable()
                                    .frame(width: 20, height: 14)
                            }
                            
                            Text("Cars")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                    
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("furniture_page1")
                                    .resizable()
                                    .frame(width: 22, height: 14)
                            }
                            
                            Text("Furniture")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                    
                    Button {
                        
                    } label: {
                        
                        VStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 42, height: 38)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("kids_page1")
                                    .resizable()
                                    .frame(width: 21, height: 17)
                            }
                            
                            Text("Kids")
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                                .font(.custom("Montserrat-Regular", size: 8))
                                .frame(alignment: .center)
                                .padding(.top, 3)
                        }
                    }.padding(.horizontal, 5)
                }
                    .padding(.top, 14)
                Group {
                    HStack {
                        Text("Latest deals")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .padding(.top, 36)
                            .padding(.leading, -10)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.custom("Montserrat-Regular", size: 8))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                .padding(.trailing, 0)
                                .padding(.top, 34)
                        }
                        
                    }
                    .frame(width: 350, height: 36)
                    .task {
                        if resultFlashSale.isEmpty {
                            loadLatest()
                        }
                    }
                    if resultFlashSale.count > 0 && resultLastDeals.count > 0 {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(resultLastDeals, id: \.name) { deal in
                                    latestView(category: deal.category, name: deal.name, price: deal.price, image_url: deal.image_url)
                                }
                            }
                        }
                    }
                }
                
                Group {
                    HStack {
                        Text("Flash sale")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .padding(.top, 36)
                            .padding(.leading, -10)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.custom("Montserrat-Regular", size: 8))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                .padding(.trailing, 0)
                                .padding(.top, 34)
                        }
                        
                    }
                    .frame(width: 350, height: 36)
                    .task {
                        if resultLastDeals.isEmpty {
                            loadFlashSale()
                        }
                    }
                    
                    if resultFlashSale.count > 0 && resultLastDeals.count > 0 {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(resultFlashSale, id: \.name) { deal in
                                    FlashSaleView(category: deal.category, name: deal.name, price: deal.price, discount: deal.discount, image_url: deal.image_url)
                                }
                            }
                        }
                    }
                }
                
                ZStack
                {
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1))
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .cornerRadius(60)
                        .padding(.top, 20)
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
                                .padding(25)
                        }).navigationBarBackButtonHidden(true)
                    }
                }.position(x:200, y:130)
                
                Spacer()
            }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }.navigationBarBackButtonHidden(true)
    }
    
    func loadLatest() {
        guard let url = URL(string:"https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            print("Invalid URL!")
            return
        }
        
        let taskForLatest = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil && data!.count > 0 {
                if let decodedData = try? JSONDecoder().decode(LatestDealsResponce.self, from: data!) {
                    //print("The data was successfully decoded!")
                    resultLastDeals = decodedData.latest
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
    
    func loadFlashSale() {
        guard let url2 = URL(string:"https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
            print("Invalid URL!")
            return
        }
        
        let taskForFlashSale = URLSession.shared.dataTask(with: url2) { (data, response, error) in
            if error == nil && data != nil && data!.count > 0 {
                if let decodedData = try? JSONDecoder().decode(FlashSaleResponce.self, from: data!) {
                    //print("The data was successfully decoded!")
                    resultFlashSale = decodedData.flash_sale
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
}

struct page1View_Previews: PreviewProvider {
    static var previews: some View {
        page1View()
    }
}

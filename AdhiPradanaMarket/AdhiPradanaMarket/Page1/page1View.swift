//
//  page1View.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 23.03.2023.
//

import SwiftUI

struct page1View: View {
    
    @State private var searchText: String = ""
    
    @State private var latestDealsMockedData = getLatestDealsItems()
    
    @State private var flashSaleMockedData = getFlashSaleItems()
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
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
                            .padding(.leading, 52)
                    }
                }
                .padding(.top, 10)
                .frame(width: 315)
                .padding(.trailing, 15)     //top bar left menu + "Trade by bata" caption + avatar image
                
                HStack {
                    Text("Location")
                        .frame(width: 45, height: 10)
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255, opacity: 1))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 6, height: 3)
                        .padding(.leading, -5)
                }
                .padding(.leading, 285)     //location with chevron
                
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.screenWidth*0.7,height: 25)
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255))
                    TextField("What are you looking for ?", text: $searchText)
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                        .font(.custom("Montserrat-Regular", size: 10))
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.screenWidth*0.7, height: 30)
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                        .frame(width: 30,height: 30)
                        .padding(.leading, 210)
                }
                .cornerRadius(60)       // search field
                
                createCategories()
                    .padding(.top, 12)      //draw categories
                
                Group {
                    HStack {
                        Text("Latest deals")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .padding(.leading, 12)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.custom("Montserrat-Regular", size: 9))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                .padding(.trailing, 20)
                        }
                        
                    }       //"Latest deals" + "view all"
                    .padding(.top, 38)
                    .frame(width: UIScreen.screenWidth, height: 36)
                    .task {
                        if latestDealsMockedData.isEmpty {
                            //latestDealsMockedData = getLatestDealsItems()
                            //if there is no data in latestDeals it is trying to load it from mock
                        }
                    }
                    ZStack {
                        if flashSaleMockedData.count > 0 && latestDealsMockedData.count > 0 {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(latestDealsMockedData, id: \.name) { deal in
                                        latestDealsView(category: deal.category, name: deal.name, price: deal.price, image_url: deal.image_url)
                                    }       //displays data if it is data in flash sale and latest deals
                                }
                            }
                        }
                    }
                    
                }     //draws latest details
                
                Group {
                    HStack {
                        Text("Flash Sale")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .padding(.leading, 12)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.custom("Montserrat-Regular", size: 9))
                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                                .padding(.trailing, 20)
                        }
                        
                    }       //"Flash sale" + "view all" only text
                    .frame(width: UIScreen.screenWidth, height: 36)
                    .padding(.top, 5)
                    .task {
                        if flashSaleMockedData.isEmpty {
                            //flashSaleMockedData = getFlashSaleItems()
                            //if there is no data in flashSale it is trying to load it from mock
                        }
                    }
                    ZStack {
                        if flashSaleMockedData.count > 0 && latestDealsMockedData.count > 0 {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(flashSaleMockedData, id: \.name) { deal in
                                        FlashSaleView(category: deal.category, name: deal.name, price: deal.price, discount: deal.discount, image_url: deal.image_url)
                                    }       //displays data if it is data in flash sale and latest deals
                                }
                            }
                        }
                    }
                    .padding(.top, -10)
                }
                
                Spacer()
                
                drawBottomTabBarPage1()     //draws bottom bar
                    .padding(.bottom, -50)
                
            }
            .background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(perform: {
            endEditing()
        })      //keyboard exit when tap on empty space
    }
}

struct latestDealsView : View {
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
                    .frame(width: UIScreen.screenWidth*0.3, height: UIScreen.screenHeight*0.18)
                    .cornerRadius(10)
            })
            Text(name)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .frame(width: 80, height: 22)
                .foregroundColor(Color.white)
                .padding(.top, 70)
                .padding(.trailing, 40)
                .multilineTextAlignment(.leading)
            ZStack
            {
                Rectangle()
                    .frame(width: 35, height: 12)
                    .foregroundColor(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .cornerRadius(4)
                    .opacity(0.85)
                    .padding(.trailing, 68)
                Text(category)
                    .font(.custom("Montserrat-SemiBold", size: 5))
                    .frame(width: 20, height: 5)
                    .foregroundColor(Color(red: 7/255, green: 6/255, blue: 4/255))
                    .padding(.trailing, 68)
                    .multilineTextAlignment(.center)
            }
            .padding(.trailing, 5)
            .padding(.top, 35)
            
            Text("$ " + String(price) + ",000")
                .padding(.top, 120)
                .padding(.trailing, 70)
                .font(.custom("Montserrat-SemiBold", size: 7))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
            
            Group {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239, opacity: 0.85))
                
                Rectangle()
                    .frame(width: 7, height: 1)
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                
                Rectangle()
                    .frame(width: 1, height: 7)
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
            }
            .padding(.top, 120)
            .padding(.leading, 90)
        }
        .frame(width: UIScreen.screenWidth*0.3, height: UIScreen.screenHeight*0.18)
            .padding(.leading, 7)
            .padding(.top, 7)
    }
}       //creates one latest deals element

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
                    .frame(width: UIScreen.screenWidth*0.48, height: UIScreen.screenHeight*0.28)
                    .cornerRadius(15)
                    .backgroundStyle(Color(red: 1, green: 1, blue: 1))
            })
            Text(name)
                .font(.custom("Montserrat-Bold", size: 13))
                .foregroundColor(Color.white)
                .padding(.top, 100)
                .padding(.trailing, 75)
                .multilineTextAlignment(.leading)
                .lineSpacing(8)
            ZStack
            {
                Rectangle()
                    .frame(width: 50, height: 18)
                    .foregroundColor(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .cornerRadius(8)
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
            .padding(.trailing, 0)
            .padding(.top, 10)
            
            Text("$ " + String(price) + "0")
                .padding(.top, 190)
                .padding(.trailing, 130)
                .font(.custom("Montserrat-SemiBold", size: 10))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
            
            Group {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239, opacity: 1))
                
                Rectangle()
                    .frame(width: 14, height: 1)
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                
                Rectangle()
                    .frame(width: 1, height: 14)
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
            }
            .padding(.leading, 140)
            .padding(.top, 190)
            
            Group {
                Circle()
                    .frame(width: 28, height: 28)
                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244))
                Image(systemName: "suit.heart")
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                    .font(.custom("", size: 12))
            }
            .padding(.top, 190)
            .padding(.leading, 65)
                        
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 249/255, green: 58/255, blue: 58/255))
                    .frame(width: 50, height: 18)
                    .cornerRadius(60)
                Text(String(discount) + "% off")
                    .foregroundColor(Color .white)
                    .font(.custom("Montserrat-SemiBold", size: 9))
            }
            .padding(.leading, 110)
            .padding(.bottom, 200)
                
        }
        .frame(width: UIScreen.screenWidth*0.48, height: UIScreen.screenHeight*0.28)
        .padding(.leading, 6)
    }
}           //creates one flash sale element

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
}       //draws bottom bar

func createCategories() -> some View {
    return HStack {
        createCategory(text: "Phones", image: "phone_page1")
        createCategory(text: "Headphones", image: "headphones_page1")
        createCategory(text: "Games", image: "games_page1")
        createCategory(text: "Cars", image: "car_page1")
        createCategory(text: "Furniture", image: "furniture_page1")
        createCategory(text: "Kids", image: "kids_page1")
    }
}       //creates categories

func createCategory(text: String, image: String) -> some View {
    return Button {
        
    } label: {
        
        VStack
        {
            ZStack {
                
                Circle()
                    .frame(width: 42, height: 38)
                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                Image(image)
                    .resizable()
                    .frame(width: 21, height: 17)
            }
            
            Text(text)
                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                .font(.custom("Montserrat-Regular", size: 8))
                .frame(alignment: .center)
                .padding(.top, 3)
        }
    }.padding(.horizontal, 5)
}           //creates one category


struct page1View_Previews: PreviewProvider {
    static var previews: some View {
        page1View()
    }
}

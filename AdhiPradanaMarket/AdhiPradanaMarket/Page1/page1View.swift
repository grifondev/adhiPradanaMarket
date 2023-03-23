//
//  page1View.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 23.03.2023.
//

import SwiftUI

struct LatestDealsResponce: Codable {
    var results: [ResultLatestDeals]
}

struct ResultLatestDeals: Codable {
    var category: String
    var name: String
    var price: Int
    var image_url: String
}

let myJSON = """
        {
            "category": "Cars",
            "name": "BMW X6M",
            "price": 35000,
            "image_url": "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"

        }

""".data(using: .utf8)

struct page1View: View {
    //@State private var currentLocation: String = "Russia"
    
    @State private var searchText: String = ""
    
    @State private var resultLastDeals = [ResultLatestDeals]()
    
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
                            .foregroundColor(Color(red: 245/255, green: 246/255, blue: 247/255))
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
                    
                HStack {
                    Text("Latest deals")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .padding(.top, 36)
                        .padding(.leading, 10)
                    Spacer()
                    Text("View all")
                        .font(.custom("Montserrat-Regular", size: 8))
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        .padding(.trailing, 10)
                        .padding(.top, 34)
                }
                    .frame(width: 350, height: 36)
                    .onTapGesture {
                        loadData()
                    }
                
                Spacer()
            }
        }
    }
    
    func loadData() {
        guard let url = URL(string:"https://run.mocky.io/v3/1a6f0ea0-fa32-438c-9918-f4c00028e126") else {
            print("Invalid URL!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data != nil && data!.count > 0 {
                print("The information was recieved successfully")
                if let decodedData = try? JSONDecoder().decode(ResultLatestDeals.self, from: myJSON!) {
                    print("The data was successfully decoded!")
                    var myname = decodedData.name
                    //resultLastDeals = decodedData.name
                } else {
                    print("Invalid decoded data...")
                }
            } else {
                print("Invalid data!")
            }
        }
        task.resume()
        
    }
}

struct page1View_Previews: PreviewProvider {
    static var previews: some View {
        page1View()
    }
}

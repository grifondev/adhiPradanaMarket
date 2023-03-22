//
//  ProfileView.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 22.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var accountImage: [PhotosPickerItem] = []
    @State private var data: Data?
    
    @State private var accountName: String = "Satria Adhi Pradana"
    @State private var balance: String = "1593"
    
    @State private var conditionsOfItemBar: [String: Bool] = ["home": false,"heart": false,"cart": false,"messages": false,"profile": false]
    
    func changeCircles(_ triggeredItem: String)
    {
        for mykey in conditionsOfItemBar.keys
        {
            if mykey != triggeredItem
            {
                conditionsOfItemBar[mykey] = false
            }
        }
    }
    
    var body: some View {
        NavigationView
        {
            VStack{
                Group {
                    
                    Text("Profile")
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        .font(.custom("Montserrat-Bold", size: 14))
                        .padding(.top, 45)
                        .padding(.horizontal, 160)
                    
                    if let data = data, let uiimage = UIImage(data: data) {
                        Image(uiImage: uiimage)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(.top, 10)
                            .padding(.horizontal, 157)
                    } else {
                        Image("Avatar_profile")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(.top, 10)
                            .padding(.horizontal, 157)
                    }
                    
                    Button {
                        
                    } label: {
                        PhotosPicker(
                            selection: $accountImage,
                            maxSelectionCount: 1,
                            matching: .images
                        )   {
                            Text("Change photo")
                                .font(.custom("Montserrat-Regular", size: 8))
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 160)
                    .onChange(of: accountImage) { newValue in
                        guard let item = accountImage.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                }
                            case .failure(let failure):
                                fatalError("\(failure)")
                            }
                        }
                    }
                    
                    Text(accountName)
                        .font(.custom("Montserrat-Bold", size: 14))
                        .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                        .padding(.top, 20)
                        .padding(.horizontal, 113)
                }
                
                Button {
                    
                }   label: {
                    
                    HStack {
                        
                        Text("Upload item")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                            .frame(width: 290, height: 45)
                            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                            .cornerRadius(15)
                    }
                }
                .padding(.top, 37)
                .padding(.leading)
                
                Group {
                    
                    Button {
                        
                    } label: {
                        
                        HStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                
                                Image("card_profile")
                                    .resizable()
                                    .frame(width: 28, height: 22)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Trade store")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    }
                    .padding(.top, 14)
                    
                    Button {
                        
                    } label: {
                        HStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                
                                Image("card_profile")
                                    .resizable()
                                    .frame(width: 28, height: 22)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Payment method")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    }
                    .padding(.top, 14)
                    
                    
                    Button {
                        
                    } label: {
                        HStack
                        {
                            ZStack {
                                
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                
                                Image("card_profile")
                                    .resizable()
                                    .frame(width: 28, height: 22)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Balance")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 200, height: 14, alignment: .leading)
                            Text("$" + balance)
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 45, height: 14)
                                .padding(.trailing, 0)
                        }
                    }
                    .padding(.top, 14)
                    
                    
                    Button {
                        
                    } label: {
                        HStack
                        {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("card_profile")
                                    .resizable()
                                    .frame(width: 28, height: 22)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Trade history")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    }
                    .padding(.top, 14)
                    
                    Button {
                        
                    } label: {
                        HStack
                        {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("restore_arrows_profile")
                                    .resizable()
                                    .frame(width: 22, height: 18)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Restore Purchase")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    }
                    .padding(.top, 14)
                    
                    Button {
                        
                    } label: {
                        HStack
                        {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                            }
                            .padding(.trailing, 8)
                            
                            Text("Help")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    }
                    .padding(.top, 14)
                    
                    NavigationLink(destination: SignInView(), label: {
                        HStack
                        {
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                                Image("log_out_profile")
                                    .resizable()
                                    .frame(width: 20, height: 18)
                            }
                            .padding(.trailing, 8)
                            
                            Text("Log out")
                                .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                                .font(.custom("Montserrat-Regular", size: 14))
                                .frame(width: 240, height: 14, alignment: .leading)
                            Image("right_arrow_profile")
                                .resizable()
                                .frame(width: 5.5, height: 10)
                        }
                    })
                    .padding(.top, 14)
                    
                }
                
                ZStack
                {
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1))
                        .frame(width: UIScreen.main.bounds.width, height: 80)
                        .cornerRadius(60)
                        .padding(.top, 20)
                    HStack {
                        
                        Button {
                            changeCircles("home")
                            conditionsOfItemBar["home"] = true
                        } label : {
                            if conditionsOfItemBar["home"] == true
                            {
                                ZStack
                                {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Image(systemName: "homekit")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                                        .padding(25)
                                }
                            }
                            else
                            {
                                ZStack
                                {
                                    Image(systemName: "homekit")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                                        .padding(25)
                                }
                            }
                        }
                        Button {
                            changeCircles("heart")
                            conditionsOfItemBar["heart"] = true
                        } label : {
                            if conditionsOfItemBar["heart"] == true
                            {
                                ZStack
                                {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Image(systemName: "suit.heart")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                                        .padding(25)
                                }
                            }
                            else
                            {
                                ZStack
                                {
                                    Image(systemName: "suit.heart")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                                        .padding(25)
                                }
                            }
                        }
                        
                        Button {
                            changeCircles("cart")
                            conditionsOfItemBar["cart"] = true
                        } label : {
                            if conditionsOfItemBar["cart"] == true
                            {
                                ZStack
                                {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Image(systemName: "cart")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                                        .padding(25)
                                }
                            }
                            else
                            {
                                ZStack
                                {
                                    Image(systemName: "cart")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                                        .padding(25)
                                }
                            }
                        }
                        
                        Button {
                            changeCircles("messages")
                            conditionsOfItemBar["messages"] = true
                        } label : {
                            if conditionsOfItemBar["messages"] == true
                            {
                                ZStack
                                {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Image(systemName: "message")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                                        .padding(25)
                                }
                            }
                            else
                            {
                                ZStack
                                {
                                    Image(systemName: "message")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                                        .padding(25)
                                }
                            }
                        }
                        
                        Button {
                            changeCircles("profile")
                            conditionsOfItemBar["profile"] = true
                        } label : {
                            if conditionsOfItemBar["profile"] == true
                            {
                                ZStack
                                {
                                    Circle()
                                        .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                                        .padding(25)
                                }
                            }
                            else
                            {
                                ZStack
                                {
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                                        .padding(25)
                                }
                            }
                        }
                    }.padding()
                }
                Spacer()
            }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }.navigationBarBackButtonHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

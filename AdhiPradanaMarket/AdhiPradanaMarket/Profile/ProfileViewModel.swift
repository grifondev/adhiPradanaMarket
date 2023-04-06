//
//  ProfileViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

func logOutUser() -> Bool{
    return false
}

func drawBottomTabBarProfile() -> some View {
   return  ZStack
    {
        Rectangle()
            .fill(Color(red: 1, green: 1, blue: 1))
            .frame(width: UIScreen.main.bounds.width, height: 100)
            .cornerRadius(30)
        HStack {
            NavigationLink(destination: page1View(), label: {
                Image(systemName: "homekit")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
            }).navigationBarBackButtonHidden(true)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
            CreateMenuButton(buttonName: "heart")
            CreateMenuButton(buttonName: "cart")
            CreateMenuButton(buttonName: "message")
            CreateSelectedInMenuButton(buttonName: "person")
        }
    }
}

func createOptions() -> some View {
    return VStack {
        createOneOption(image: "card_profile", text: "Trade store", isRightText: false, isArrow: true)
        createOneOption(image: "card_profile", text: "Payment method", isRightText: false, isArrow: true)
        createOneOption(image: "card_profile", text: "Balance", isRightText: true, isArrow: true)
        createOneOption(image: "card_profile", text: "Trade history", isRightText: false, isArrow: true)
        createOneOption(image: "restore_arrows_profile", text: "Restore Purchase", isRightText: false, isArrow: true)
        createOneOption(image: "questionmark_circle", text: "Help", isRightText: false, isArrow: true)
        
        NavigationLink(destination: SignInView(), label: {
            if logOutUser() == true {
                // to be continued...
            }
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
                
                Text("Log out")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 240, height: 14, alignment: .leading)

            }
        })
        .padding(.top, 14)
        .padding(.trailing, 45)
    }
}

func createOneOption(image: String, text: String, isRightText: Bool, isArrow: Bool) -> some View {
    return Button {
        
    } label: {
        HStack
        {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                Image(image)
                    .resizable()
                    .frame(width: 28, height: 22)
            }
            
            if !isRightText {
                Text(text)
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 15))
                    .frame(width: 240, height: 14, alignment: .leading)
                if isArrow {
                    Image("right_arrow_profile")
                        .resizable()
                        .frame(width: 5.5, height: 10)
                        .padding(.leading, 15)
                }
            } else {
                Text("Balance")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 200, height: 14, alignment: .leading)
                Text("$" + " 1593")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 45, height: 14)
                    .padding(.leading, 15)
            }
            
        }
    }
    .padding(.top, 17)
    .padding(.trailing, 15)
}

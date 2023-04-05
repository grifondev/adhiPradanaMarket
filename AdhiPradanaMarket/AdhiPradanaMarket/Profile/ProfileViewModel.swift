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

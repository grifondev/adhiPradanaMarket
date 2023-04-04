//
//  page1ViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 04.04.2023.
//

import SwiftUI

func drawBottomTabBar() -> some View {
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

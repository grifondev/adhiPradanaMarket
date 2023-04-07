//
//  AdhiPradanaView.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 06.04.2023.
//

import SwiftUI

func CreateMenuButton(buttonName: String) -> some View {
    return Button {

    } label : {
        Image(systemName: buttonName)
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
            .padding(.horizontal, 25)
            .padding(.bottom, 30)
    }
}       // creates one bottom tab bar button

func CreateSelectedInMenuButton(buttonName: String) -> some View {
    return Button {
        changeLabelOfSelectedButton(buttonName)
        conditionsOfBottomTabBarItems[buttonName] = true
    } label : {
        ZStack
        {
            Circle()
                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.bottom, 30)
            Image(systemName: buttonName)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
        }
    }
}       //creates one button, that have circle

func drawBottomBar(selectedPage: String) -> some View {
    return ZStack {
        Rectangle()
            .fill(Color(red: 1, green: 1, blue: 1))
            .frame(width: UIScreen.main.bounds.width, height: 100)
            .cornerRadius(30)
        HStack {
            if selectedPage == "homekit" {
                CreateSelectedInMenuButton(buttonName: "homekit")
            } else {
                NavigationLink(destination: page1View(), label: {
                    Image(systemName: "homekit")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                }).navigationBarBackButtonHidden(true)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 30)
            }
            CreateMenuButton(buttonName: "heart")
            CreateMenuButton(buttonName: "cart")
            CreateMenuButton(buttonName: "message")
            if selectedPage == "homekit" {
                NavigationLink(destination: ProfileView(), label: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
                }).navigationBarBackButtonHidden(true)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 30)
            } else {
                CreateSelectedInMenuButton(buttonName: "person")
            }
            
        }
    }
}

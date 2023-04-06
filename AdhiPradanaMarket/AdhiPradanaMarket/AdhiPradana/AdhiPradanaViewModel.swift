//
//  AdhiPradanaViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 04.04.2023.
//

import SwiftUI

public var conditionsOfItemBar: [String: Bool] = ["home": false,"heart": false,"cart": false,"messages": false,"profile": false]

extension UIScreen {
    public static let screenWidth = UIScreen.main.bounds.size.width
    public static let screenHeight = UIScreen.main.bounds.size.height
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

func endEditing() {
    UIApplication.shared.endEditing()
}

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
}

func CreateSelectedInMenuButton(buttonName: String) -> some View {
    return Button {
        changeLabelOfSelectedButton(buttonName)
        conditionsOfItemBar[buttonName] = true
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
}

func changeLabelOfSelectedButton(_ triggeredItem: String) {
    for mykey in conditionsOfItemBar.keys
    {
        if mykey != triggeredItem
        {
            conditionsOfItemBar[mykey] = false
        }
    }
}
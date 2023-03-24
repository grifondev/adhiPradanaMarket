//
//  LoginViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

public var conditionsOfItemBar: [String: Bool] = ["home": false,"heart": false,"cart": false,"messages": false,"profile": false]

func CreateMenuButton(buttonName: String) -> some View {
    return Button {

    } label : {
        Image(systemName: buttonName)
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundColor(Color(red: 144/255, green: 144/255, blue: 144/255))
            .padding(25)
    }
}

func CreateSelectedInMenuButton(buttonName: String) -> some View {
    return Button {
        changeCircles(buttonName)
        conditionsOfItemBar[buttonName] = true
    } label : {
        ZStack
        {
            Circle()
                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                .frame(width: 40, height: 40, alignment: .center)
            Image(systemName: buttonName)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(Color(red: 115/255, green: 114/255, blue: 151/255))
                .padding(25)
        }
    }
}

func getCurrentPage() -> String {
    for (namePage, pageCondition) in conditionsOfItemBar {
        if pageCondition == true {
            return namePage
        }
    }
    return ""
}

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
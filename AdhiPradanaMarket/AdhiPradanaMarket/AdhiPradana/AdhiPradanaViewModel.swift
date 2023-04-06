//
//  AdhiPradanaViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 04.04.2023.
//

import SwiftUI

public var conditionsOfBottomTabBarItems: [String: Bool] = ["home": false,"heart": false,"cart": false,"messages": false,"profile": false]        // condition of bottomBar

extension UIScreen {
    public static let screenWidth = UIScreen.main.bounds.size.width
    public static let screenHeight = UIScreen.main.bounds.size.height
}       // need for more accuracy in layout

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}       //  closing the keyboard

func endEditing() {
    UIApplication.shared.endEditing()
}       // calls function of closing the keyboard

func changeLabelOfSelectedButton(_ triggeredItem: String) {
    for mykey in conditionsOfBottomTabBarItems.keys
    {
        if mykey != triggeredItem
        {
            conditionsOfBottomTabBarItems[mykey] = false
        }
    }
}       //changes condition of previous selected button in bottom tab bar

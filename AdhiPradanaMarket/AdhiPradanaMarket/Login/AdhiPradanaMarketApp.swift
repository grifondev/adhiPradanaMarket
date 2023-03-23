//
//  AdhiPradanaMarketApp.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 14.03.2023.
//

import SwiftUI

public var conditionsOfItemBar: [String: Bool] = ["home": false,"heart": false,"cart": false,"messages": false,"profile": false]

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

@main
struct AdhiPradanaMarketApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}

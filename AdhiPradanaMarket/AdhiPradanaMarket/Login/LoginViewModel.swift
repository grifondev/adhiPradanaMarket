//
//  LoginViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

func checkDataForValid(firstName: String, password: String) -> String {
    if firstName == newUser.firstName && password == newUser.password {
        return "OK"
    }
    return "NOT"
}       //checks is similar newUser firstname and password with inputed data. If yes it is show SignInPage()

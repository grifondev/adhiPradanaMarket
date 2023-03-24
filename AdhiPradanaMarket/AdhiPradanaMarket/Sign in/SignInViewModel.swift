//
//  SignInViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 24.03.2023.
//

import SwiftUI

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func registerUser(fName: String, lName: String, email: String) {
    //Needs CoreData
}

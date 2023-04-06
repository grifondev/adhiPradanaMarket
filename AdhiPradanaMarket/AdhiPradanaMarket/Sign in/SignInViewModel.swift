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
}       //validates inputed email

func isFieldsHaveValidData(first: String, last: String) -> Bool {
    if first.isEmpty { return false }
    if last.isEmpty { return false }
    return true
}       //checks that fields are not empty

func saveInsertedData(email: String, firstName: String, lastName: String) -> String {
    if !isValidEmail(email) { return "Invalid email" }
    if !isFieldsHaveValidData(first: firstName, last: lastName) { return "Invalid data"}
    newUser.firstName = firstName
    newUser.lastName = lastName
    newUser.email = email
    return "OK"
}       //saves data if its valid

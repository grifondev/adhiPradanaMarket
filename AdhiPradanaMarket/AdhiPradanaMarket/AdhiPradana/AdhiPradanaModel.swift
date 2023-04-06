//
//  AdhiPradanaModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 05.04.2023.
//

import SwiftUI

class User {
    
    private var password: String
    private var email: String
    private var firstName: String
    private var lastName: String
    
    init(password: String, email: String, firstName: String, lastName: String) {
        self.password = password
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setPassword(newPassword: String) {
        password = newPassword
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setEmail(newEmail: String) {
        email = newEmail
    }
    
    func getEmail() -> String {
        return email
    }
    
    func setFirstName(newFirstName: String) {
        firstName = newFirstName
    }
    
    func getFirstName() -> String {
        return firstName
    }
    
    func setLastMame(newLastName: String) {
        lastName = newLastName
    }
    
    func getLastMame() -> String {
        return lastName
    }
}

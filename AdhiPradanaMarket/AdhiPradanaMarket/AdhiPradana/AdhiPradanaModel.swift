//
//  AdhiPradanaModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 05.04.2023.
//

import SwiftUI

public class User {
    
    private var _password: String
    private var _email: String
    private var _firstName: String
    private var _lastName: String
    
    init(password: String, email: String, firstName: String, lastName: String) {
        self._password = password
        self._email = email
        self._firstName = firstName
        self._lastName = lastName
    }
    
    public var password: String {
        get {
            return self._password
        }
        set {
            self._password = newValue
        }
    }
    
    public var email: String {
        get {
            return self._email
        }
        set {
            self._email = newValue
        }
    }
    
    public var firstName: String {
        get {
            return self._firstName
        }
        set {
            self._firstName = newValue
        }
    }
    
    public var lastName: String {
        get {
            return self._lastName
        }
        set {
            self._lastName = newValue
        }
    }
    
}

var newUser: User = User(password: "1", email: "1@1.ru", firstName: "1", lastName: "1")

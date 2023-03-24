//
//  LoginView.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var firstName: String = ""
    
    @State private var password: String = ""
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    
    var body: some View {
        NavigationView
        {
            VStack (){
                
                Text("Welcome back")
                    .font(.custom("Montserrat-SemiBold", size: 27))
                    .foregroundColor(Color(red: 22/255, green: 24/255, blue: 38/255))
                    .padding(.horizontal, 90)
                    .padding(.top, 159)
                
                ZStack {
                    Rectangle()
                        .frame(width: 290,height: 30)
                        .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .cornerRadius(60)
                    TextField("First name", text: $firstName)
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .textContentType(.givenName)
                        .multilineTextAlignment(.center)
                        .frame(width: 290, height: 30)
                        .cornerRadius(60)
                    
                }
                .padding(.horizontal, 43)
                .padding(.top, 80)
                
                ZStack {
                    Rectangle()
                        .frame(width: 290,height: 30)
                        .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .cornerRadius(60)
                    
                    if showPassword {
                        TextField("Password", text: $password)
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .textContentType(.password)
                            .multilineTextAlignment(.center)
                            .focused($focus1)
                            .frame(width: 290, height: 30)
                            .cornerRadius(60)
                            .opacity(showPassword ? 1 : 0)
                    } else {
                        SecureField("Password", text: $password)
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                            .textContentType(.password)
                            .focused($focus2)
                            .multilineTextAlignment(.center)
                            .frame(width: 290, height: 30)
                            .cornerRadius(60)
                            .opacity(showPassword ? 0 : 1)
                            .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                        if showPassword { focus1 = true } else { focus2 = true }
                    }, label: {
                        Image(systemName: self.showPassword ? "eye" : "eye.slash")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color(red: 92/255, green: 92/255, blue: 92/255))
                            .frame(width: 30,height: 30)
                            .opacity(0.7)
                    }).padding(.leading, 240)
                    
                }
                .padding(.horizontal, 43)
                .padding(.top, 35)
                
                NavigationLink(destination: ProfileView(), label:
                {
                    Text("Login").font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                        .frame(width: 290, height: 45)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .padding(.top,100)
                })
                Spacer()
                
            }
        }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

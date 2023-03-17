//
//  SignInView.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 16.03.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    
    var body: some View {
        VStack (){
            
            Text("Sign in")
                .font(.custom("Montserrat-SemiBold", size: 27))
                .foregroundColor(Color(red: 22/255, green: 24/255, blue: 38/255))
                .padding(.horizontal, 143)
                .padding(.top, 125)     //caption
            
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
            .padding(.top, 78)          //first name
            
            ZStack {
                Rectangle()
                    .frame(width: 290,height: 30)
                    .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .cornerRadius(60)
                TextField("Last name", text: $lastName)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .textContentType(.givenName)
                    .multilineTextAlignment(.center)
                    .frame(width: 290, height: 30)
                    .cornerRadius(60)
                
            }
            .padding(.horizontal, 43)
            .padding(.top, 35)          //Last name
            
            ZStack {
                Rectangle()
                    .frame(width: 290,height: 30)
                    .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .cornerRadius(60)
                TextField("Email", text: $email)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                    .textContentType(.givenName)
                    .multilineTextAlignment(.center)
                    .frame(width: 290, height: 30)
                    .cornerRadius(60)
                
            }
            .padding(.horizontal, 43)
            .padding(.top, 35)          //email
            
            
            Button
            { } label: {
                Text("Sign in").font(.custom("Montserrat-Bold", size: 16))
                    .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                    .frame(width: 290, height: 45)
                    .background(Color(red: 78/255, green: 85/255, blue: 215/255, opacity: 1))
                    .cornerRadius(15)
                    .padding(.top,35)
            }.buttonStyle(PlainButtonStyle())       //sign in button
            
            HStack {
                Text("Already have an account?")
                    .font(.custom("Montserrat-Regular", size: 10))
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    
                Button{
                    
                } label: {
                    Text("Log in")
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 115)    //"Already have an account" + Log in button
            
            HStack {
                Image("Google_picture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text("Sign in with Google")
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.top, 74)
            .padding(.trailing, 128)
            .padding(.leading, 100)         //Sign in with google
            
            HStack {
                Image("Apple_picture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text("Sign in with Apple")
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
            }
            .padding(.top, 38)
            .padding(.trailing, 128)
            .padding(.leading, 100)     //Sign in with Apple
            
            Spacer()
            
        }
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

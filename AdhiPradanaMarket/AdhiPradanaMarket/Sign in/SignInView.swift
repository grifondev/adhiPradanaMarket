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
    
    @State private var showInvalidEmailMessage: Bool = false
    
    @State private var showInvalidDataMessage: Bool = false
    
    @State private var showYouHaveRegistered: Bool = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationStack
        {
            VStack (){
                Text("Sign in")
                    .font(.custom("Montserrat-SemiBold", size: 27))
                    .foregroundColor(Color(red: 22/255, green: 24/255, blue: 38/255))
                    .padding(.horizontal, 143)
                    .padding(.top, 100)         //caption "Sign in"
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                    TextField("First name", text: $firstName)
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .textContentType(.givenName)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 290,height: 30)
                .cornerRadius(60)
                .padding(.horizontal, 43)
                .padding(.top, 60)          //first name
                
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
                .padding(.top, 30)          //Last name
                
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
                .padding(.top, 30)          //email
                
                Button{
                    switch saveInsertedData(email: email, firstName: firstName, lastName: lastName) {
                    case "Invalid email":
                        showInvalidEmailMessage = true
                        showInvalidDataMessage = false
                        showYouHaveRegistered = false
                    case "Invalid data":
                        showInvalidEmailMessage = false
                        showInvalidDataMessage = true
                        showYouHaveRegistered = false
                    case "OK":
                        showInvalidEmailMessage = false
                        showInvalidDataMessage = false
                        showYouHaveRegistered = true
                    default:
                        fatalError("Something went wrong when we are tried to store your data")
                    }
                } label: {
                    Text("Sign in").font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                        .frame(width: 290, height: 45)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255, opacity: 1))
                        .cornerRadius(15)
                        .padding(.top,30)
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Email is not valid", isPresented: $showInvalidEmailMessage, actions: {
                    Button("OK", role: .cancel) { }
                })
                .alert("Data is not valid. Please insert info in all fields", isPresented: $showInvalidDataMessage, actions: {
                    Button("OK", role: .cancel) { }
                })
                .navigationDestination(isPresented: $showYouHaveRegistered, destination: {
                    page1View()
                })

                HStack {
                    Text("Already have an account?")
                        .font(.custom("Montserrat-Regular", size: 10))
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    NavigationLink(destination: LoginView()){
                        Text("Log in")
                            .font(.custom("Montserrat-Regular", size: 10))
                            .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                    }
                    
                }
                .padding(.top, 10)
                .padding(.trailing, 115)    //"Already have an account" + Log in button
                
                
                Button {
                    
                } label: {
                    Image("Google_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Sign in with Google")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                }
                .padding(.top, 70)
                .padding(.trailing, 128)
                .padding(.leading, 100)         //Sign in with google
                
                Button {
                    
                } label: {
                    Image("Apple_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("Sign in with Apple")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                }
                .padding(.top, 30)
                .padding(.trailing, 128)
                .padding(.leading, 100)     //Sign in with Apple
                
                Spacer()
                
            }
            .background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(perform: {
            endEditing()
        })
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

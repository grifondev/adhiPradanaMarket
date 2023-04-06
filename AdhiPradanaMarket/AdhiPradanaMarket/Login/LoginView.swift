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
    
    @FocusState var passwordLooksLikeString: Bool
    @FocusState var passwordLooksLikeDots: Bool
    
    @State var showPassword: Bool = false
    
    @State var isDataValid: Bool = false
    @State var showDataError: Bool = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView
        {
            VStack (){
                
                Text("Welcome back")
                    .font(.custom("Montserrat-SemiBold", size: 27))
                    .foregroundColor(Color(red: 22/255, green: 24/255, blue: 38/255))
                    .padding(.horizontal, 90)
                    .padding(.top, 120)
                
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
                .frame(width: UIScreen.screenWidth*0.77, height: UIScreen.screenHeight*0.036)
                .cornerRadius(60)
                .padding(.horizontal, 43)
                .padding(.top, 60)
                
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.screenWidth*0.77,height: UIScreen.screenHeight*0.036)
                        .foregroundColor(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .cornerRadius(60)
                    
                    Group {
                        if showPassword {
                            TextField("Password", text: $password)
                                .focused($passwordLooksLikeString)
                                .opacity(showPassword ? 1 : 0)
                        } else {
                            SecureField("Password", text: $password)
                                .background(Color(red: 232/255, green: 232/255, blue: 232/255))
                                .focused($passwordLooksLikeDots)
                                .opacity(showPassword ? 0 : 1)
                                .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .textContentType(.password)
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.screenWidth*0.77, height: UIScreen.screenHeight*0.036)
                    .cornerRadius(60)
                    
                    Button(action: {
                        showPassword.toggle()
                        if showPassword { passwordLooksLikeString = true } else { passwordLooksLikeDots = true }
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
                
                Button {
                    switch checkDataForValid(firstName: firstName, password: password) {
                    case "OK":
                        isDataValid = true
                        showDataError = false
                        break
                    case "NOT":
                        isDataValid = false
                        showDataError = true
                        break
                    default:
                        fatalError("Something went wrong when we are trying to log you in")
                    }
                } label: {
                    Text("Login").font(.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                        .frame(width: UIScreen.screenWidth*0.77, height: UIScreen.screenHeight*0.056)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .padding(.top, 90)
                }
                .alert("Inserted data is not valid", isPresented: $showDataError, actions: {
                    Button("OK", role: .cancel) { }
                })
                .navigationDestination(isPresented: $isDataValid, destination: {
                    page1View()
                })
                
                Spacer()
                
            }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture(perform: {
            endEditing()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

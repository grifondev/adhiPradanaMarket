//
//  ProfileView.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 22.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var accountImage: [PhotosPickerItem] = []
    @State private var photoData: Data?
    
    @State private var accountName: String = "Satria Adhi Pradana"
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView
        {
            VStack{
                Group {
                    
                    Text("Profile")
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        .font(.custom("Montserrat-Bold", size: 15))
                        .padding(.top, 23)
                        .padding(.horizontal, 160)      //"Profile" caption
                    
                    Group {
                        if let data = photoData, let uiimage = UIImage(data: data) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                        } else {
                            Image("Avatar_profile")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                        }
                    }
                    .padding(.horizontal, 157)
                    .padding(.top, 5)           //avatar image
                    
                    
                    Button {
                        
                    } label: {
                        PhotosPicker(
                            selection: $accountImage,
                            maxSelectionCount: 1,
                            matching: .images
                        )   {
                            Text("Change photo")
                                .font(.custom("Montserrat-Regular", size: 8))
                                .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        }
                    }
                    .padding(.horizontal, 160)
                    .onChange(of: accountImage) { newValue in
                        guard let item = accountImage.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.photoData = data
                                }
                            case .failure(let failure):
                                fatalError("\(failure)")
                            }
                        }
                    }       // change photo button
                    
                    Text(newUser.firstName + " " + newUser.lastName)
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                        .padding(.top, 7)
                        .padding(.horizontal, 113)      //name of the user
                }
                
                Button {
                    
                }   label: {
                    
                    ZStack {
                        Text("Upload item")
                            .font(.custom("Montserrat-Bold", size: 16))
                            .frame(width: UIScreen.screenWidth*0.775, height: UIScreen.screenHeight*0.049)
                            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                            .cornerRadius(15)
                        Image(systemName: "square.and.arrow.up")
                            .padding(.leading, 50)
                            .padding(.trailing, 240)
                    }
                }
                .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                .padding(.top, 25)      //Upload item button
                
                createOptions()     //creates options
                
                Spacer()
                
                drawBottomBar(selectedPage: "person")   //draw bottom tab bar
                    .padding(.bottom, -50)
                
            }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }.navigationBarBackButtonHidden(true)
        
    }
}

func createOptions() -> some View {
    return VStack {
        createOneOption(image: "card_profile", text: "Trade store", isRightText: false, isArrow: true)
        createOneOption(image: "card_profile", text: "Payment method", isRightText: false, isArrow: true)
        createOneOption(image: "card_profile", text: "Balance", isRightText: true, isArrow: true)
        createOneOption(image: "card_profile", text: "Trade history", isRightText: false, isArrow: true)
        createOneOption(image: "restore_arrows_profile", text: "Restore Purchase", isRightText: false, isArrow: true)
        createOneOption(image: "questionmark_circle", text: "Help", isRightText: false, isArrow: true)
        
        NavigationLink(destination: SignInView(), label: {
            if logOutUser() == true {
                // to be continued...
            }
            HStack
            {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                    Image("log_out_profile")
                        .resizable()
                        .frame(width: 20, height: 18)
                }
                
                Text("Log out")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 240, height: 14, alignment: .leading)

            }
        })
        .padding(.top, 14)
        .padding(.trailing, 45)
    }
}       //create options

func createOneOption(image: String, text: String, isRightText: Bool, isArrow: Bool) -> some View {
    return Button {
        
    } label: {
        HStack
        {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(red: 238/255, green: 239/255, blue: 244/255))
                Image(image)
                    .resizable()
                    .frame(width: 28, height: 22)
            }
            
            if !isRightText {
                Text(text)
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 15))
                    .frame(width: 240, height: 14, alignment: .leading)
                if isArrow {
                    Image("right_arrow_profile")
                        .resizable()
                        .frame(width: 5.5, height: 10)
                        .padding(.leading, 15)
                }
            } else {
                Text("Balance")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 200, height: 14, alignment: .leading)
                Text("$" + " 1593")
                    .foregroundColor(Color(red: 4/255, green: 4/255, blue: 2/255))
                    .font(.custom("Montserrat-Regular", size: 14))
                    .frame(width: 45, height: 14)
                    .padding(.leading, 15)
            }
            
        }
    }
    .padding(.top, 17)
    .padding(.trailing, 15)
}       //create only one option

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

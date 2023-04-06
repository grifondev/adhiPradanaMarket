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
    @State private var data: Data?
    
    @State private var accountName: String = "Satria Adhi Pradana"
    @State private var balance: String = "1593"
    
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
                        .padding(.horizontal, 160)
                    
                    Group {
                        if let data = data, let uiimage = UIImage(data: data) {
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
                    .padding(.top, 5)
                    
                    
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
                    //.padding(.top, 3)
                    .padding(.horizontal, 160)
                    .onChange(of: accountImage) { newValue in
                        guard let item = accountImage.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                }
                            case .failure(let failure):
                                fatalError("\(failure)")
                            }
                        }
                    }
                    
                    Text(accountName)
                        .font(.custom("Montserrat-Bold", size: 15))
                        .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                        .padding(.top, 7)
                        .padding(.horizontal, 113)
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
                .padding(.top, 25)
                
                createOptions()
                
                Spacer()
                
                drawBottomTabBarProfile()
                    .padding(.bottom, -50)
                
            }.background(Color(red: 250/255, green: 249/255, blue: 255/255))
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

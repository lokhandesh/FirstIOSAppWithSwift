//
//  ContentView.swift
//  FirstIOSApp
//
//  Created by santosh lokhande on 30/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("username",text: $username)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("password",text: $password)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        //Authenticate the user
                        authenticateUserName(username: username, passowrd:password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    
                    NavigationLink(
                        destination: Text("you are logged In @\(username)"),isActive: $showLoginScreen) {
                            EmptyView()
                        }
                    
                }
                
            }
            .navigationBarHidden(false)
        }
        
        
    }
    
    func authenticateUserName(username:String,passowrd:String) {
        if(username.lowercased() == "santosh2024") {
            wrongUsername = 0
            if (passowrd.lowercased() == "abc123") {
                wrongPassword = 0
                showLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
    
}

#Preview {
    ContentView()
}

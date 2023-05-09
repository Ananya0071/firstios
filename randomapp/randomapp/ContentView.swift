//
//  ContentView.swift
//  randomapp
//
//  Created by Ananya Parashar on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var  username = ""
    @State private var password = ""
    @State private var WrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingSignupUI = false
    var body: some View {
            NavigationView{
                ZStack{
                    Image("BB")
                    VStack{
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        TextField("UserName",text:$username)
                            .padding()
                            .frame(width:300,height:50)
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(WrongUsername))
                        SecureField("Password",text:$password)
                            .padding()
                            .frame(width:300,height:50)
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(wrongPassword))
                        Button("Login"){
                            authenticateUser(username: username, password: password)
                        }.foregroundColor(.white)
                            .frame(width: 300,height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(5)
                        NavigationLink(destination: Text("You are Logged in as \(username)").background(Color.yellow), isActive:$showingLoginScreen){
                            EmptyView()
                        }
                       
                    }
                    
                }.navigationBarHidden(true)
                
                
            }
        }
    func authenticateUser(username : String,password:String){
        if username.lowercased() == "ananya"{
            WrongUsername=0
            if password.lowercased() == "hello123" {
                wrongPassword=0
                showingLoginScreen=true
            }else{
                wrongPassword=2
            }
        }else{
            WrongUsername=2
        }
    }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

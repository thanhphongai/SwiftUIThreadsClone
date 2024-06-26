//
//  LoginView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 03/05/2024.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // setup icon , textfiel
                Image("threads_app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    SecureField("Enter your password", text: $viewModel.password )
                        .modifier(ThreadsTextFieldModifier())
                }
                
                // forgot password
                NavigationLink{
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // login
                Button {
                    Task { try  await viewModel.login() }
                } label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}

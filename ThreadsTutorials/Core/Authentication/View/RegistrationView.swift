//
//  RegistrationView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var viewModel = RegistrasionViewModel()

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                TextField("Enter your full name", text: $viewModel.fullname)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                Task { try await viewModel.createUser()}
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}

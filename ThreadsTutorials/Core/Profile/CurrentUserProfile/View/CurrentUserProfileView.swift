//
//  CurrentUserProfileView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 05/05/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    private var currentUser: UserModel? {
        return viewModel.currenrUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileHeaderView(user: currentUser)
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text(" Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color( .systemGray3), lineWidth: 1)
                            }
                    }
                    
                    // user content list view
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileIView()
                    .environmentObject(viewModel)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(Color(.black))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
}

#Preview {
    CurrentUserProfileView()
}

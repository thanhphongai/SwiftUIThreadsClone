//
//  ProfileView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: UserModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                // user content list view
                UserContentListView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}

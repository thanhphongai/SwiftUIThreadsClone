//
//  EditProfileIView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import SwiftUI

struct EditProfileIView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    
                    // name and  profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Phongcubu")
                        }
                        .font(.footnote)
                        Spacer()
                        CircularProfileImageView()
                    }
                    
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio..", text: $bio, axis: .vertical)
                    }
                    .font(.footnote)
                    Divider()
                    
                    // link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link..", text: $link, axis: .vertical)
                    }
                    .font(.footnote)
                    Divider()
                    
                    // private profile
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4) , lineWidth: 1)
                    
                }
                .padding()
            }
            .navigationTitle("EditProfile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileIView()
}

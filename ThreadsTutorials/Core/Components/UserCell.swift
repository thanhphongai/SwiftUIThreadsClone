//
//  UserCell.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            VStack(alignment: .leading) {
                Text("Phong cubu")
                    .fontWeight(.semibold)
                Text("Subtitle")
                
            }
            .font(.footnote)
            
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color( .systemGray3), lineWidth: 1)
                }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}

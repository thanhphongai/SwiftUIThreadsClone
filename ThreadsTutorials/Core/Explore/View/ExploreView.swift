//
//  ExploreView.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                       
                    }
                }
            }
            .navigationDestination(for: UserModel.self, destination: { user in
                ProfileView(user: user)
            })
            .searchable(text:$searchText, prompt: "Search")
            .navigationTitle("Search")
        }
    }
}

#Preview {
    ExploreView()
}

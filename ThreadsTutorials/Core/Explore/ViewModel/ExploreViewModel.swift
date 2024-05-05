//
//  ExploreViewModel.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 05/05/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [UserModel]()
    
    init() {
        Task { try await fetchUsers()}
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fecthUsers()
    }
    
}

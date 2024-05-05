//
//  RegistrasionViewModel.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import Foundation

class RegistrasionViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}

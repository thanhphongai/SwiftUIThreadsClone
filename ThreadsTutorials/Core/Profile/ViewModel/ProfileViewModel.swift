//
//  ProfileViewModel.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currenrUser: UserModel?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribes()
    }
    
    private func setupSubscribes() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currenrUser = user
        }.store(in: &cancellables)
    }
}

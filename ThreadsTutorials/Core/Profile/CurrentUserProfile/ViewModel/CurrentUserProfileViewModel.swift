//
//  CurrentUserProfileViewModel.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 05/05/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currenrUser: UserModel?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() }}
    }
    @Published var profileImage: Image?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribes()
    }
    
    private func setupSubscribes() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currenrUser = user
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else {  return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}

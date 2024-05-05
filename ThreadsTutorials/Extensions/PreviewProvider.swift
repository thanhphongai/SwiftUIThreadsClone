//
//  PreviewProvider.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 05/05/2024.
//

import SwiftUI

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = UserModel(id: NSUUID().uuidString, fullname: "Phong cubu", email: "phong@gmail.com", username: "phongcubu")
}

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

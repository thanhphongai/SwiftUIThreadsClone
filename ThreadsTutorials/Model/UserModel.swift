//
//  UserModel.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import Foundation

struct UserModel: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}

//
//  AuthService.swift
//  ThreadsTutorials
//
//  Created by macbookpro on 04/05/2024.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String , password: String) async throws {
        do {
            let result  = try await Auth.auth().signIn(withEmail: email, password: password)
            print(result.user)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch  {
            print("DEBUG:  Failed to create user error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String , password: String, fullname:String, username:String) async throws {
        do {
            let result  = try await Auth.auth().createUser(withEmail: email, password: password)
            
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch  {
            print("DEBUG:  Failed to create user error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
       let user = UserModel(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}

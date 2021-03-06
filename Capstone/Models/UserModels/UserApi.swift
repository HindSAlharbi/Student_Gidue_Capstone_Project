//
//  UserApi.swift
//  Capstone
//
//  Created by Hind Alharbi on 12/13/21.
//

import Foundation
import FirebaseFirestore
import Firebase
import UIKit

class UserApi {
    
    static func addUser(uid:String,email:String,firstName:String,lastName: String ,dataCreated: Data, completion: @escaping (Bool) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.CreateUser(email: email, firstName: firstName, lastName: lastName, dataCreated: dataCreated))
        
        completion(true)
    }

    static func updateUserInfo(currentUser:User,uid:String,firstName:String,lastName: String) {
            
        var first = ""
        var last = ""
        
        if firstName == currentUser.firstName {
            first = currentUser.firstName ?? ""
        } else {
            first = firstName
        }
        if lastName == currentUser.lastName {
            last = currentUser.lastName ?? ""
        } else {
            last = lastName
        }
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.update( firstName: first, lastName: last), merge: true)
    
        }
    static func getUser(uid:String,completion: @escaping (User) -> Void) {

        let refUsers = Firestore.firestore().collection("Users")

        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }

    }

}


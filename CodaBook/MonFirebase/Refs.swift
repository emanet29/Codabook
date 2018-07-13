//
//  Refs.swift
//  CodaBook
//
//  Created by Snoopy on 11/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class Refs {
    static let obtenir = Refs()
    
    let baseBDD = Database.database().reference()
    let baseStockage = Storage.storage().reference()
    
    var baseUtilisateurs: DatabaseReference {
        return baseBDD.child(UTILISATEUR)
    }
    
    var basePhotosDeProfil: StorageReference {
        return baseStockage.child(UTILISATEUR)
    }
    
}

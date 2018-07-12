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
    
    var baseUtilisateurs: DatabaseReference {
        return baseBDD.child(UTILISATEUR)
    }
    
}

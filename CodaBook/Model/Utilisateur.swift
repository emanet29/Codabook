//
//  Utilisateur.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class Utilisateur {
    
    private var _prenom: String
    private var _nom: String
    private var _imageUrl: String?
    
    var prenom: String {
        return _prenom
    }
    
    var nom: String {
        return _nom
    }
    
    var imageUrl: String? {
        return _imageUrl
    }
    
    init(prenom: String, nom: String, imageUrl: String?) {
        self._prenom = prenom
        self._nom = nom
        self._imageUrl = imageUrl
    }
    
    
    
    
    
}

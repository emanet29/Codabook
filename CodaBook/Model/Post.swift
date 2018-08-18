//
//  Post.swift
//  CodaBook
//
//  Created by Snoopy on 17/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class Post {
    private var _id : String
    private var _date: Double
    private var _utilisateur : Utilisateur
    private var _texte : String
    private var _imageUrl : String?
    private var _likes: [String]
    
    var id: String {
        return _id
    }
    
    var date: Double {
        return _date
    }
    
    var likes: [String] {
        return _likes
    }
    
    var utilisateur: Utilisateur {
        return _utilisateur
    }
    
    var texte: String {
        return _texte
    }
    
    var imageUrl: String? {
        return _imageUrl
    }
    
    init(id: String, date: Double,utilisateur: Utilisateur, texte: String, imageUrl: String?) {
        self._id = id
        self._date = date
        self._utilisateur = utilisateur
        self._texte = texte
        self._imageUrl = imageUrl
        self._likes = []
    }
    
    func maj(likes: [String]) {
        self._likes = likes
    }
    
    
}

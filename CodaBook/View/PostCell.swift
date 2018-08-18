//
//  PostCell.swift
//  CodaBook
//
//  Created by Snoopy on 18/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var photoDeProfil: ImageRonde!
    @IBOutlet weak var nomEtPrenom: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageDuPost: UIImageView!
    @IBOutlet weak var nombreDeLike: UILabel!
    
    @IBOutlet weak var boutonLike: UIButton!
    @IBOutlet weak var texteDuPost: UILabel!
    
    
    
    var post: Post!
    
    func miseEnPlace(post: Post) {
        self.post = post
        photoDeProfil.telecharger(self.post.utilisateur.imageUrl)
        nomEtPrenom.text = self.post.utilisateur.prenom + "  " + self.post.utilisateur.nom
        imageDuPost.telecharger(self.post.imageUrl)
        texteDuPost.text = self.post.texte
        
    }
    
    
    
    @IBAction func likeAppuye(_ sender: Any) {
    }
    
}

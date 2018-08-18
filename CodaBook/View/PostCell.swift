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
        if self.post.imageUrl == nil {
            imageDuPost.isHidden = true
        } else {
            imageDuPost.isHidden = false
        }
        
        let date = Date(timeIntervalSince1970: self.post.date)
        let formatteur = DateFormatter()
        let calendrier = Calendar.current
        if calendrier.isDateInToday(date) {
            formatteur.dateStyle = .none
            formatteur.timeStyle = .short
        } else {
            formatteur.dateStyle = .short
            formatteur.timeStyle = .none
        }
        let dateString = formatteur.string(from: date)
        dateLabel.text = dateString
        
        
    }
    
    
    
    @IBAction func likeAppuye(_ sender: Any) {
    }
    
}

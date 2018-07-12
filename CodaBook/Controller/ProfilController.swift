//
//  ProfilController.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfilController: UIViewController {
    
    @IBOutlet weak var photoDeProfil: UIImageView!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    
    
    var profil: Utilisateur?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenirProfil()
    }
    
    
    func obtenirProfil() {
        guard let id =  Auth.auth().currentUser?.uid else { return }
        let ref = Refs.obtenir.baseUtilisateurs.child(id)
        ref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String: String], let prenom = dict[PRENOM], let nom = dict[NOM] {
                let nouvelUtilisateur = Utilisateur(prenom: prenom, nom: nom, imageUrl: dict[IMAGEURL])
                self.profil = nouvelUtilisateur
                self.miseAJourDonnees()
            }
        }
        
        
    }
    

    func miseAJourDonnees(){
        guard profil != nil else { return }
        prenomLabel.text = "Prénom:  " + self.profil!.prenom
        nomLabel.text = "Nom :  " + self.profil!.nom
    }
    
    @IBAction func decoAction(_ sender: Any) {
        Alerte.montrer.deco(controller: self)
    }
    
    @IBAction func modifierProfilAction(_ sender: Any) {
        
    }
    

}

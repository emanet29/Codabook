//
//  ConnectionController.swift
//  CodaBook
//
//  Created by Snoopy on 04/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnectionController: UIViewController {

    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var mdpTF: UITextField!
    @IBOutlet weak var connectionBouton: BoutonCodabook!
    
    @IBOutlet weak var pasDeCompteLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cacherClavier)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cacher(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let id = Auth.auth().currentUser?.uid {
            // Vérifier si utilisateur dans BDD
            // Passer à l'app
            
            
            
        } else {
            cacher(false)
            
        }
    }
    
    func cacher(_ bool: Bool) {
        titreLabel.isHidden = bool
        mailTF.isHidden = bool
        mdpTF.isHidden = bool
        connectionBouton.isHidden = bool
        pasDeCompteLabel.isHidden = bool
    }
    
    @objc func cacherClavier() {
        view.endEditing(true)
    }
    
    @IBAction func SeConnecterAction(_ sender: Any) {
        self.view.endEditing(true)
        if let adresse = mailTF.text, adresse != "" {
            if let mdp = mdpTF.text, mdp != "" {
                
                
            } else {
                Alerte.montrer.erreur(message: MDP_VIDE, controller: self)
            }
        } else {
            Alerte.montrer.erreur(message: ADRESSE_VIDE, controller: self)
            
        }
        
    }
    
}

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
            verifierUtilisateur(id: id)
        } else {
            // on montre les champs pour se connecter
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
    
    func completion(_ user: AuthDataResult?, _ error: Error?) {
        if let erreur = error {
            let nsErreur = erreur as NSError
            
            if nsErreur.code == 17011 {// l'utilisateur n'existe pas
                // creer utilisateur
                Auth.auth().createUser(withEmail: mailTF.text!, password: mdpTF.text!, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: nsErreur.convertirErreurFirebaseEnString(), controller: self)
            }
        }
        
        // l'utilisateur existe...
        if let utilisateur = user?.user {
            verifierUtilisateur(id: utilisateur.uid)
        }
    }
    
    
    
    
    func verifierUtilisateur(id: String) {
        let referenceFirebase = Refs.obtenir.baseUtilisateurs.child(id)
        referenceFirebase.observe(.value) { (snapshot) in
            if snapshot.exists() {
                // Passer a l'app
                self.performSegue(withIdentifier: SEGUE_ID, sender: nil)
                
            } else {
                // manque nom/prenom
                self.finalisation()
            }
        }
    }
    
    func finalisation() {
        Alerte.montrer.alerteTF(titre: FINALISER, message: DERNIER_PAS, array: [PRENOM, NOM], controller: self, completion: { (success) -> (Void) in
            if let bool = success, bool == true {
                // Passer à l'app
                self.performSegue(withIdentifier: SEGUE_ID, sender: nil)
            } else {
                self.finalisation()
            }
        })
    }
    
    @IBAction func SeConnecterAction(_ sender: Any) {
        self.view.endEditing(true)
        if let adresse = mailTF.text, adresse != "" {
            if let mdp = mdpTF.text, mdp != "" {
                Auth.auth().signIn(withEmail: adresse, password: mdp, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: MDP_VIDE, controller: self)
            }
        } else {
            Alerte.montrer.erreur(message: ADRESSE_VIDE, controller: self)
            
        }
        
    }
    
}

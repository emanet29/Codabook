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

class ProfilController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoDeProfil: ImageRonde!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    
    
    var profil: Utilisateur?
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenirProfil()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        photoDeProfil.isUserInteractionEnabled = true
        photoDeProfil.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(prendrePhoto)))
    }
    
    @objc func prendrePhoto() {
        Alerte.montrer.photo(imagePicker: imagePicker, controller: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editee
        } else if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = original
        }
        picker.dismiss(animated: true, completion: nil)
        guard image != nil, let data = UIImageJPEGRepresentation(image!, 0.2) else { return }
        guard let id = Auth.auth().currentUser?.uid else { return }
        let ref = Refs.obtenir.basePhotosDeProfil.child(id)
        ref.putData(data, metadata: nil) { (metadata, error) in
            ref.downloadURL(completion: { (url, error) in
                if let urlString = url?.absoluteString {
                    let userRef = Refs.obtenir.baseUtilisateurs.child(id)
                    userRef.updateChildValues([IMAGEURL: urlString])
                }
            })
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func obtenirProfil() {
        guard let id =  Auth.auth().currentUser?.uid else { return }
        let ref = Refs.obtenir.baseUtilisateurs.child(id)
        ref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String: String], let prenom = dict[PRENOM], let nom = dict[NOM] {
                let nouvelUtilisateur = Utilisateur(id: snapshot.key, prenom: prenom, nom: nom, imageUrl: dict[IMAGEURL])
                self.profil = nouvelUtilisateur
                self.miseAJourDonnees()
            }
        }
        
        
    }
    

    func miseAJourDonnees(){
        guard profil != nil else { return }
        prenomLabel.text = "Prénom:  " + self.profil!.prenom
        nomLabel.text = "Nom :  " + self.profil!.nom
        photoDeProfil.telecharger(self.profil!.imageUrl)
    }
    
    @IBAction func decoAction(_ sender: Any) {
        Alerte.montrer.deco(controller: self)
    }
    
    @IBAction func modifierProfilAction(_ sender: Any) {
        if let bouton = sender as? UIButton {
            var array = [String]()
            switch bouton.tag {
            case 0: array.append(PRENOM)
            case 1: array.append(NOM)
            default: break
            }
            guard array.count == 1 else { return }
            Alerte.montrer.alerteTF(titre: MODIFIER, message: array[0], array: array, controller: self, completion: nil)
        }
    }
    

}

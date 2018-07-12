//
//  ProfilController.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ProfilController: UIViewController {
    
    @IBOutlet weak var photoDeProfil: UIImageView!
    
    
    @IBOutlet weak var prenomLabel: UILabel!
    
    @IBOutlet weak var nomLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func decoAction(_ sender: Any) {
        Alerte.montrer.deco(controller: self)
    }
    
    @IBAction func modifierProfilAction(_ sender: Any) {
        
    }
    

}

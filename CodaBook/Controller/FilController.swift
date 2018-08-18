//
//  FilController.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class FilController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        observerPosts()
    }
    
    func observerPosts() {
        let ref = Refs.obtenir.basePost
        ref.observe(.childAdded) { (snapshot) in
            if let postDict = snapshot.value as? [String: AnyObject] {
                if let userId = postDict[USER_ID] as? String {
                    Refs.obtenir.baseUtilisateurs.child(userId).observe(.value, with: { (userSnap) in
                        if let userDict = userSnap.value as? [String: String], let prenom = userDict[PRENOM], let nom = userDict[NOM] {
                            let utilisateur = Utilisateur(id: userSnap.key, prenom: prenom, nom: nom, imageUrl: userDict[IMAGEURL])
                            
                            if let date = postDict[DATE_POST] as? Double, let texte = postDict[TEXTE] as? String {
                                let nouveauPost = Post(id: snapshot.key, date: date, utilisateur: utilisateur, texte: texte, imageUrl: postDict[IMAGEURL] as? String)
                                self.posts.append(nouveauPost)
                                self.tableView.reloadData()
                            }
                            
                            
                            
                        }
                    })
                }
                
            }
            
            
        }
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID) as? PostCell {
            cell.miseEnPlace(post: posts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

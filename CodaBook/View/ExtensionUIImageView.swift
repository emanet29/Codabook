//
//  ExtensionUIImageView.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    
    func telecharger(_ urlString: String?) {
        image = #imageLiteral(resourceName: "Superman-facebook.svg")
        guard urlString != nil, let url = URL(string: urlString!) else { return }
        sd_setImage(with: url, completed: nil)
        
    }
    
    
}

//
//  BoutonCodabook.swift
//  CodaBook
//
//  Created by Snoopy on 04/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class BoutonCodabook: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace();
    }
    
    func miseEnPlace() {
        backgroundColor = UIColor.white
        tintColor = BLEU_CODABOOK
        layer.mep(10)
    }
    
}

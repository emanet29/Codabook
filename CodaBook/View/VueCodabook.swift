//
//  VueCodabook.swift
//  CodaBook
//
//  Created by Snoopy on 13/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class VueCodabook: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace() {
        backgroundColor = .white
        layer.mep(10)
    }

}

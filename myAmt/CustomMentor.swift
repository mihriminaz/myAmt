//
//  CustomMentor.swift
//  AddressMap
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import UIKit

class CustomMentor: UIView {

    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var lblMotto: UILabel!
    @IBOutlet weak var lblPoints: UILabel!
    @IBOutlet weak var lblHastags: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }


}

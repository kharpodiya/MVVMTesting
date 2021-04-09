//
//  ContactTableViewCell.swift
//  CodingExercise
//
//  Created by Bigstep Technologies on 6/8/20.
//  Copyright © 2020 Bigstep Technologies. All rights reserved.
//

import UIKit

class ContactTableViewcell: UITableViewCell {
    
    @IBOutlet weak var contactAvatarImage: CircleImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactTagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

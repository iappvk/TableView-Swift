//
//  CustomTableViewCell.swift
//  sample2
//
//  Created by Vijayakumar on 20/08/14.
//  Copyright (c) 2014 Vijayakumar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var cellImg : UIImageView = nil
    @IBOutlet var cellTitle : UILabel
    @IBOutlet var cellDescription : UILabel = nil
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

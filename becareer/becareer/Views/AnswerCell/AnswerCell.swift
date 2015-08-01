//
//  AnswerCell.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.accessoryType = UITableViewCellAccessoryType.None
        self.layer.addBottomLine(UIColor(rgba: "#e2e2e2"), width: 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

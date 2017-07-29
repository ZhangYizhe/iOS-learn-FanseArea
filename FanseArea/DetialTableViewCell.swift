 //
//  DetialTableViewCell.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/7/18.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit

class DetialTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fieldLable: UILabel!
    @IBOutlet weak var valueLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

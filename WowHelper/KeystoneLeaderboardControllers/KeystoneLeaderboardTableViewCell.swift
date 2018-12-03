//
//  TableViewCell.swift
//  WowTest
//
//  Created by Tom Hays on 12/11/2018.
//  Copyright © 2018 Msk. All rights reserved.
//

import UIKit

class KeystoneLeaderboardTableViewCell: UITableViewCell {

    @IBOutlet weak var mythicRankingLabelCell: UILabel!
    @IBOutlet weak var mythicKeystoneLabelCell: UILabel!
    @IBOutlet weak var mythicName1LabelCell: UILabel!
    @IBOutlet weak var mythicName2LabelCell: UILabel!
    @IBOutlet weak var mythicName3LabelCell: UILabel!
    @IBOutlet weak var mythicName4LabelCell: UILabel!
    @IBOutlet weak var mythicName5LabelCell: UILabel!
    @IBOutlet weak var mythicDateCompletedLabelCell: UILabel!
    @IBOutlet weak var mythicTimeCompletedLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

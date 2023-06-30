//
//  FilterTableViewCell.swift
//  CarGo
//
//  Created by user on 11/25/22.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowSimbol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurePage()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurePage() {
        //self.contentView.backgroundColor = Utils.appColor
        self.arrowSimbol?.text = "➤"
        self.arrowSimbol?.textColor = Utils.appColor
        
    }
    
}

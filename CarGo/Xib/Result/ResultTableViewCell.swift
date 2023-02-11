//
//  ResultTableViewCell.swift
//  CarGo
//
//  Created by user on 2/4/23.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var descriptinLabel: UILabel!
    @IBOutlet weak var dateAndSortLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        print(favoriteButton.imageView?.image)
        if favoriteButton.imageView?.image == UIImage(systemName: "bookmark") {
            let a = UIImage(systemName: "bookmark.fill")
            sender.setImage(a, for: .normal)
            favoriteButton.shake()
        }else if favoriteButton.imageView?.image == UIImage(systemName: "bookmark.fill"){
            let a = UIImage(systemName: "bookmark")
            sender.setImage(a, for: .normal)
            favoriteButton.shake()
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurePage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurePage() {
        //favoriteButton.imageView?.image = UIImage(systemName: "person")
    }
    
}

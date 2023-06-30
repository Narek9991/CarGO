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
    @IBOutlet weak var emptyResultLabel: UILabel!
    
    var isFavorite: ((Bool) -> ())?
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        if favoriteButton.imageView?.image == UIImage(systemName: "star") {
            let a = UIImage(systemName: "star.fill")
            sender.setImage(a, for: .normal)
            favoriteButton.shake()
            isFavorite?(true)
        }else if favoriteButton.imageView?.image == UIImage(systemName: "star.fill"){
            let a = UIImage(systemName: "star")
            sender.setImage(a, for: .normal)
            favoriteButton.shake()
            isFavorite?(false)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = ""
        distanceLabel.text = ""
        descriptinLabel.text = ""
        dateAndSortLabel.text = ""
        infoLabel.text = ""
        priceLabel.text = ""
        dateLabel.text = ""
        emptyResultLabel.text = ""
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    
    func emptyResult(_ isEmpty : Bool) {
        if isEmpty == true {
        cityLabel.isHidden = true
        distanceLabel.isHidden = true
        distanceLabel.isHidden = true
        descriptinLabel.isHidden = true
        dateAndSortLabel.isHidden = true
        infoLabel.isHidden = true
        priceLabel.isHidden = true
        dateLabel.isHidden = true
        favoriteButton.isHidden = true
        emptyResultLabel.isHidden = false
        } else {
            cityLabel.isHidden = false
            distanceLabel.isHidden = false
            distanceLabel.isHidden = false
            descriptinLabel.isHidden = false
            dateAndSortLabel.isHidden = false
            infoLabel.isHidden = false
            priceLabel.isHidden = false
            dateLabel.isHidden = false
            favoriteButton.isHidden = false
            emptyResultLabel.isHidden = true
        }
    }
    
    func setupData(item: CarGOData) {
        print(" cell \(item.id) => \(item.isBookmarksSelected)")
        let image = item.isBookmarksSelected ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        favoriteButton.setImage(image, for: .normal)
        cityLabel.text = "\(item.initialCity) - \(item.finalCity)"
        distanceLabel.text = String(item.distance)
        descriptinLabel.text = item.description
        dateAndSortLabel.text = item.info
        infoLabel.text = item.info
        priceLabel.text = "\(String(item.price))$"
        let date = item.date
        if date.month! <= 9 {
            if date.day! <= 9 {
                dateLabel.text = "\(date.year!).0\(date.month!).0\(date.day!)"
            } else {
                dateLabel.text = "\(date.year!).0\(date.month!).\(date.day!)"
            }
        } else if date.month! >= 10 {
            if date.day! <= 9 {
                dateLabel.text = "\(date.year!).\(date.month!).0\(date.day!)"
            } else {
                dateLabel.text = "\(date.year!).\(date.month!).\(date.day!)"
            }
        }
    }
}

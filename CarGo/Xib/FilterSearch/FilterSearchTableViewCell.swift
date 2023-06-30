//
//  FilterSearchTableViewCell.swift
//  CarGo
//
//  Created by user on 3/27/23.
//

import UIKit

class FilterSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedImages: UIButton!
   
    
    @IBAction func selectedImage(_ sender: UIButton) {
        if selectedImages.imageView?.image == UIImage(systemName: "circle") {
            isChoosed?(true)
            let a = UIImage(systemName: "circle.fill")
            selectedImages.setImage(a, for: .normal)
            
        }else if selectedImages.imageView?.image == UIImage(systemName: "circle.fill"){
            isChoosed?(false)
            let a = UIImage(systemName: "circle")
            selectedImages.setImage(a, for: .normal)
            
        }
        
    }
    
    var isChoosed: ((Bool) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        selectedImages.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        isChoosed?(false)
    }
    
    func setupData(item: [FilterData] , index: Int) {
        nameLabel.text = item[index].name
        let image = item[index].isChoosed ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        selectedImages.setImage(image, for: .normal)
    }
    
}


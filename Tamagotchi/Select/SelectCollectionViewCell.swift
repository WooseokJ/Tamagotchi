

import UIKit
import Kingfisher


class SelectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectLabelback: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
  
    func DesignTama(data:Tama){
        nameLabel.font = .systemFont(ofSize: 13)
        nameLabel.text = data.name
        nameLabel.textColor = ColorName.fontcolor
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
   
        selectLabelback.backgroundColor = ColorName.backgroundcolor
        selectLabelback.layer.borderWidth = 1
        selectLabelback.layer.cornerRadius = 4
        
        selectImage.image = UIImage(named: data.imageName)
        selectImage.backgroundColor = ColorName.backgroundcolor
        selectImage.layer.cornerRadius = selectImage.frame.height / 2
        selectImage.layer.borderWidth = 2
        selectImage.clipsToBounds = true
    }
}



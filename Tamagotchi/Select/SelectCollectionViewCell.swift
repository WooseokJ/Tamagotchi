

import UIKit
import Kingfisher


class SelectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255,alpha: 1)
    
    func DesignTama(data:Tama){
        nameLabel.font = .systemFont(ofSize: 13)
        nameLabel.text = data.name
        nameLabel.textColor = fontcolor
        nameLabel.textColor = fontcolor
        nameLabel.textColor = fontcolor
        nameLabel.textAlignment = .center
        
        nameLabel.numberOfLines = 1
        selectImage.image = UIImage(named: data.imageName)
        selectImage.backgroundColor = backgroundcolor
        selectImage.layer.cornerRadius = selectImage.frame.height / 2
        selectImage.layer.borderWidth = 2
        selectImage.clipsToBounds = true
    }
}


//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
 
    @IBOutlet weak var SettingButton: UIButton!
    @IBOutlet weak var SettingLabel: UILabel!
    @IBOutlet weak var SettingImage: UIImageView!
    func design(_ data: [String]){
        SettingLabel.text = data[1]
        SettingLabel.textColor = ColorName.fontcolor
        
        SettingButton.setTitle(data[2], for: .normal)
        SettingButton.tintColor = ColorName.fontcolor
        
        SettingImage.tintColor = ColorName.fontcolor
        SettingImage.image = UIImage(systemName: data[0])
        detailTextLabel?.textColor = .systemGray
        backgroundColor = ColorName.backgroundcolor
        imageView?.tintColor = ColorName.fontcolor
        accessoryType = .disclosureIndicator
        focusStyle = .custom

    }
}

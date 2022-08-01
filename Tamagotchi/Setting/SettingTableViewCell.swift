//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
 
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingImageView: UIImageView!
    
    func design(_ data: [String]) {
        settingLabel.text = data[1]
        settingLabel.textColor = ColorName.fontcolor
        settingButton.setTitle(data[2], for: .normal)
        settingButton.tintColor = ColorName.fontcolor
        settingImageView.tintColor = ColorName.fontcolor
        settingImageView.image = UIImage(systemName: data[0])
        detailTextLabel?.textColor = .systemGray
        backgroundColor = ColorName.backgroundcolor
        imageView?.tintColor = ColorName.fontcolor
        accessoryType = .disclosureIndicator
        focusStyle = .custom

    }

}

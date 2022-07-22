//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailConfirmButton: UIButton!
    @IBOutlet weak var detailCancelButton: UIButton!
    
    @IBOutlet weak var detailCenterView: UIView!
    @IBOutlet weak var bottomView: UIView!

    @IBOutlet weak var detailContentLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
    
    var detailTamaData = TamaInfo().TamaAttribute
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomView.backgroundColor = .systemGray3
        detailCenterView.backgroundColor = .systemGray3
        
        detailView.backgroundColor = backgroundcolor
        detailView.layer.borderWidth = 1
        detailView.layer.cornerRadius = 4
        
        detailNameLabel.textAlignment = .center
        detailNameLabel.textColor = fontcolor
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        
        
        detailCancelButton.backgroundColor = .systemGray5
    }
    
    func DataInsert(data : Tama){
//        self.detailImageView = imageName
        
        
        
    }
    
    
    
    


}



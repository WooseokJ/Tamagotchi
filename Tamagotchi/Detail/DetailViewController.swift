//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    static var identifier = "DetailViewController"

    
    var takename : String?
    var takeImage : String?
    var takecontent : String?
    var imageNum : Int?
    
    
    
    @IBOutlet weak var detailConfirmButton: UIButton!
    @IBOutlet weak var detailCancelButton: UIButton!
    
  
    @IBOutlet weak var detailCenterView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var backgroundView: UIView!
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

        detailCancelButton.setTitle("취소", for: .normal)
        detailCancelButton.setTitleColor(fontcolor, for: .normal)

        detailConfirmButton.setTitle(NameClass.firstButton, for: .normal)
        detailConfirmButton.setTitleColor(fontcolor, for: .normal)

        detailCancelButton.backgroundColor = .systemGray5
        backgroundView.backgroundColor = backgroundcolor

        detailNameLabel.text = takename
        detailImageView.image = UIImage(named: takeImage ?? "noImage")
        
        guard takeImage != "noImage" else{
            return detailContentLabel.text = "준비중입니다."
        }
        
        detailContentLabel.text = takecontent
        detailContentLabel.textAlignment = .center
        detailContentLabel.numberOfLines = 0
    }
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func ConfirmButton(_ sender: UIButton) {
        let next = UIStoryboard(name: "Grow", bundle: nil)
        let vc = next.instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        vc.mainCenterLabel = takename
        
        vc.selectNumber = imageNum
        
        self.present(nav,animated: false)

        
        
        
    }
    
    


}



//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit
import Toast

class DetailViewController: UIViewController {

    static var identifier = "DetailViewController"

    
    var takename : String?
    var takeImage : String?
    var takecontent : String?
    var imageNum : Int?
    
    var level : Double?
    var eatcnt : Double?
    var drinkcnt : Double?
    var backimagenum : Int?

    
    @IBOutlet weak var detailConfirmButton: UIButton!
    @IBOutlet weak var detailCancelButton: UIButton!
    
    @IBOutlet weak var detailCenterView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var detailContentLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
  
    @IBOutlet weak var detailImageView: UIImageView!
    

    let buttonname = UserDefaults.standard.value(forKey: "startbutton") as! String
    
    var detailTamaData = TamaInfo().TamaAttribute
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.DetailCenterDesignView()
        detailCenterView.DetailCenterDesignView()
        detailView.DetailbackDesignView()
        
        detailNameLabel.DetailNameDesign()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

        detailCancelButton.setTitle("취소", for: .normal)
        detailCancelButton.DetailCencelDesign("취소")
        detailConfirmButton.DetailCencelDesign(buttonname)
       
        backgroundView.backgroundColor = ColorName.backgroundcolor

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
        
        UserDefaults.standard.set(eatcnt, forKey: "eatcnt")
        UserDefaults.standard.set(drinkcnt, forKey: "drinkcnt")
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(backimagenum, forKey: "backimagenum")
        
      
        
        
        self.present(nav,animated: false)

        
        
        
    }
    
    


}



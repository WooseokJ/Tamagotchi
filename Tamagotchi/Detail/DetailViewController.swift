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
    var takename : String? // 타마고치이름
    var takeimage : String? // 타마고치 이미지
    @IBOutlet weak var detailConfirmButton: UIButton! //시작하기
    @IBOutlet weak var detailCancelButton: UIButton! // 취소
    @IBOutlet weak var detailCenterView: UIView! //중간 검은선
    @IBOutlet weak var bottomView: UIView! // 하단 검은선
    @IBOutlet weak var backgroundView: UIView! // 전체 백그라운드
    @IBOutlet weak var detailView: UIView! // 타마고치 이름 백그라운드
    @IBOutlet weak var detailContentLabel: UILabel! // 타마고치 설명
    @IBOutlet weak var detailNameLabel: UILabel! // 타마고치이름
    @IBOutlet weak var detailImageView: UIImageView! // 타마고치 이미지
    
    
    
    
    var detailTamaData = TamaInfo().TamaAttribute
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonname = UserDefaults.standard.value(forKey: "startbutton") as! String
        //디자인
        bottomView.DetailCenterDesignView()
        detailCenterView.DetailCenterDesignView()
        detailView.DetailbackDesignView()
        detailNameLabel.DetailNameDesign()
        detailCancelButton.DetailCencelDesign("취소")
        detailConfirmButton.DetailCorfirmDesign(buttonname)
        detailContentLabel.detailContentLabelDesign(takename ?? " ")
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        backgroundView.backgroundColor = ColorName.backgroundcolor
        detailNameLabel.text = takename
        
        detailImageView.image = UIImage(named: takeimage ?? "noImage")
        guard takeimage != "noImage" else{
            return detailContentLabel.text = "준비중입니다."
        }
    }
    
    
    //취소버튼
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // 확인버튼
    @IBAction func ConfirmButton(_ sender: UIButton) {
        let next = UIStoryboard(name: "Grow", bundle: nil)
        let vc = next.instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        vc.mainCenterLabel = takename
   
        
     
    
        UserDefaults.standard.set(true,forKey: "First")
        UserDefaults.standard.set(true,forKey: "changed")
        UserDefaults.standard.set(true,forKey: "startbutton")
        
//        UserDefaults.standard.set(true,forKey: "level")
//        UserDefaults.standard.set(true,forKey: "drinkcnt")
//        UserDefaults.standard.set(true,forKey: "eatcnt")
//        UserDefaults.standard.set(true,forKey: "backimage")
//        UserDefaults.standard.set(true,forKey: "tamaname")


        self.present(nav,animated: false)
        
        
        
    }
    
    


}



//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit
import Toast

class DetailViewController: UIViewController {
    
    var takeimage : String? // 타마고치 이미지
    @IBOutlet weak var confirmButton: UIButton! //시작하기
    @IBOutlet weak var cancelButton: UIButton! // 취소
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
        let takename = UserDefaults.standard.string(forKey:"tamaSelectName")
        let buttonname = UserDefaults.standard.value(forKey: "startbutton") as! String
        //디자인
        bottomView.DetailCenterDesignView()
        detailCenterView.DetailCenterDesignView()
        detailView.DetailbackDesignView()
        detailNameLabel.DetailNameDesign()
        cancelButton.DetailCencelDesign("취소")
        confirmButton.DetailCorfirmDesign(buttonname)
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
        guard let vc = next.instantiateViewController(withIdentifier: MainViewController.reuseIdentifier) as? MainViewController else{
            return
        }
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        UserDefaults.standard.set(true,forKey: "First")
        UserDefaults.standard.set(true,forKey: "changed")
        UserDefaults.standard.set(true,forKey: "startbutton")
        self.present(nav,animated: false)
    }
}



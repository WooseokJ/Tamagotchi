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
        
        detailConfirmButton.setTitle("시작하기", for: .normal)
        detailConfirmButton.setTitleColor(fontcolor, for: .normal)
        
        detailCancelButton.backgroundColor = .systemGray5
        
        backgroundView.backgroundColor = backgroundcolor
        
        
        
        
    }
    
    func DataInsert(data : Tama){
//        self.detailImageView = imageName
        
        
        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func ConfirmButton(_ sender: UIButton) {
        let next = UIStoryboard(name: "Grow", bundle: nil) //nil을하면 기본위치, 라이브버리같은거 가져올떈 nil아님,  name:은 스토리보드 이름쓰기
        // step 2
        let vc = next.instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        // 네비게이션 뷰컨트롤 띄우기
        let nav = UINavigationController(rootViewController: vc)
        // step 2.5 어떤 방식으로 띄울지 결정(옵션)
        nav.modalPresentationStyle = .fullScreen
        // step 3
        self.present(nav,animated: false) //self는 클래스 자기자신의 인스턴스(TrendTableViewController)
    }
    
    


}



//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class MainViewController: UIViewController {

    static var identifier = "MainViewController"
    
    @IBOutlet weak var MainContentLabel: UILabel!
    @IBOutlet weak var MainTopimage: UIImageView!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainEatingTextField: UITextField!
    @IBOutlet weak var MainDrinkingTextField: UITextField!
    @IBOutlet weak var MainLevelLabel: UILabel!
    @IBOutlet weak var MainNameImage: UIView!
    @IBOutlet weak var MainTamaName: UILabel!
    @IBOutlet weak var MainDrinking: UIButton!
    @IBOutlet weak var MainEating: UIButton!
    
    //1. 값설정
    var mainCenterLabel : String?
    var mainCenterImage : String?
    var textEatingContent : Int = 0
    var TamaData = TamaInfo().TamaAttribute
    var ls : [Int] = [1, 0, 0]
        
    
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        let image = UIImage(systemName: "person")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SettingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = fontcolor
        navigationItem.title = "\(NameClass.tamaName)님의 다마고치"
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  backgroundcolor
        navigationItem.backButtonTitle = " "
        
        
        MainTopimage.image = UIImage(named: "bubble")
        MainImageView.image = UIImage(named: "1-1")

        MainTamaName.text = mainCenterLabel
        
        let Randomcontent = ["\(NameClass.tamaName)님 오늘 날씨가 좋네요.","\(NameClass.tamaName)님 구조체 클래스차이알아?","\(NameClass.tamaName) 님 나죽어...ㅠㅠ","\(NameClass.tamaName)님 저 날밤샛어요ㅠㅠ"]
        let selectContent = Int.random(in: 0...Randomcontent.count-1)
        MainContentLabel.text = Randomcontent[selectContent]
        MainContentLabel.textAlignment = .center
        MainLevelLabel.text = "LV \(ls[0]) 밥알 \(ls[1])개 물방울 \(ls[2])"
        MainLevelLabel.textAlignment = .center
        MainNameImage.backgroundColor = backgroundcolor
  
        MainTamaName.layer.cornerRadius = 2
        
        
        MainEatingTextField.keyboardType = .numberPad
        MainDrinkingTextField.keyboardType = .numberPad
    }
    
    
    // 사람 버튼누르면
    @objc
    func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // 밥주기 버튼
    @IBAction func EatingButton(_ sender: UIButton) {
        // 레벨계산
        let levelChagned : Double = Double((ls[1]/5)) + Double((ls[2] / 2))
        
        //이거하면 레벨계산은 잘됨.
        switch Int(levelChagned) {
            case 0..<20  :
                ls[0] = 1
                imageShow(1)
            case 20..<30 :
                ls[0] = 2
                imageShow(2)
            case 30..<40 :
                ls[0] = 3
                imageShow(3)
            case 40..<50 :
                ls[0] = 4
                 imageShow(4)
            case 50..<60 :
                ls[0] = 5
                imageShow(5)
            case 60..<70 :
                ls[0] = 6
                imageShow(6)
            case 70..<80 :
                ls[0] = 7
                imageShow(7)
            case 80..<90 :
                ls[0] = 8
                imageShow(8)
            case 90..<100 :
                ls[0] = 9
                imageShow(9)
            case 100..<Int.max :
                ls[0] = 10
                imageShow(9)
            default :break
        }

        
        
        
        
        ls[1]+=1
        MainLevelLabel.text = "LV \(ls[0]) 밥알 \(ls[1])개 물방울 \(ls[2])"
        MainEatingTextField.text = ""
    }
    func imageShow(_ num : Int){
        MainImageView.image = UIImage(named: "1-\(num)")
    }
    
    //밥주기 텍스트필드
    @IBAction func InputEating(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        ls[1] += Int(count-1)
    }
    
    //물주기 버튼
    @IBAction func DrinkningButton(_ sender: UIButton) {
        ls[2] += 1
        MainLevelLabel.text = "LV \(ls[0]) 밥알 \(ls[1])개 물방울 \(ls[2])"
        MainDrinkingTextField.text = ""
    
    }
    
    // 문주기 텍스트필드
    @IBAction func InputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        ls[2] += Int(count-1)
    }
    
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

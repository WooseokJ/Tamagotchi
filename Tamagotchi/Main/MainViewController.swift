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
    
    @IBOutlet weak var topImageView: UIView!
    
    
    //1. 값설정
    var mainCenterLabel : String?
    var mainCenterImage : String?
    var selectNumber : Int?
    
    var textEatingContent : Int = 0
    var TamaData = TamaInfo().TamaAttribute
        
    
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
    
    var tamaName = "대장"
    
    var level = 1.0
    var eatcnt = 0.0
    var drinkcnt = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        let image = UIImage(systemName: "person")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SettingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = fontcolor
        navigationItem.title = "\(tamaName)님의 다마고치"
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  backgroundcolor
        navigationItem.backButtonTitle = " "
        
        MainTopimage.image = UIImage(named: "bubble")
        print(selectNumber!)
        print(NameClass.growImageNumber)
        MainImageView.image = UIImage(named: "\(selectNumber!)-\(NameClass.growImageNumber)") //지워도됨

        MainTamaName.text = mainCenterLabel
        
        MainContentLabel.text = "\(tamaName)님 오늘 날씨가 좋네요."
        MainContentLabel.textAlignment = .center
        MainLevelLabel.text = "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainLevelLabel.textAlignment = .center
        MainNameImage.backgroundColor = backgroundcolor
        MainEating.tintColor = fontcolor
        MainDrinking.tintColor = fontcolor
        
        MainTamaName.layer.cornerRadius = 2
        MainTamaName.backgroundColor = backgroundcolor
        MainDrinking.setTitle("물주기", for: .normal)
        MainDrinking.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        MainEating.setTitle("밥먹기", for: .normal)
        MainEating.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        
        MainEatingTextField.backgroundColor = backgroundcolor
        MainDrinkingTextField.backgroundColor = backgroundcolor
        MainDrinkingTextField.placeholder = "물주세용"
        MainDrinkingTextField.textAlignment = .center
        MainEatingTextField.placeholder = "밥주세용"
        MainEatingTextField.textAlignment = .center
        topImageView.backgroundColor = backgroundcolor
        
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
        selectLavel()
        eatcnt+=1
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainEatingTextField.text = ""
        RandomText()
    }

    
    //밥주기 텍스트필드
    @IBAction func InputEating(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        eatcnt += Double(count-1.0)
    }
    
    //물주기 버튼
    @IBAction func DrinkningButton(_ sender: UIButton) {
        selectLavel()
        drinkcnt += 1
        print(level)
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainDrinkingTextField.text = ""
        RandomText()
    
    }
    
    // 물주기 텍스트필드
    @IBAction func InputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        drinkcnt += Double(count-1.0)
    }
    func imageShow(){
        MainImageView.image = UIImage(named: "\(selectNumber!)-\(NameClass.growImageNumber)")
    }
    func selectLavel(){
        let levelChagned : Double = Double((eatcnt/5)) + Double((drinkcnt / 2))

        //이거하면 레벨계산은 잘됨.
        switch Int(levelChagned) {
            case 0..<20  :
            level = 1
            NameClass.growImageNumber=1
            imageShow()
            case 20..<30 :
            level = 2
            NameClass.growImageNumber=2
                imageShow()
            case 30..<40 :
            level = 3
            NameClass.growImageNumber=3
                imageShow()
            case 40..<50 :
            level = 4
            NameClass.growImageNumber=4
                 imageShow()
            case 50..<60 :
            level = 5
            NameClass.growImageNumber=5
                imageShow()
            case 60..<70 :
            level = 6
            NameClass.growImageNumber=6
                imageShow()
            case 70..<80 :
            level = 7
            NameClass.growImageNumber=7
                imageShow()
            case 80..<90 :
            level = 8
            NameClass.growImageNumber=8
                imageShow()
            case 90..<100 :
            level = 9
            NameClass.growImageNumber=9
                imageShow()
            case 100..<Int.max :
            level = 10
            NameClass.growImageNumber=9
                imageShow()
            default :break
        }
    }
    
    func RandomText(){
        let Randomcontent = ["\(tamaName)님 오늘 날씨가 좋네요.","\(tamaName)님 구조체 클래스차이알아?","\(tamaName) 님 나죽어...ㅠㅠ","\(tamaName)님 저 날밤샛어요ㅠㅠ"]
        let selectContent = Int.random(in: 0...Randomcontent.count-1)
        MainContentLabel.text = Randomcontent[selectContent]
    }
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

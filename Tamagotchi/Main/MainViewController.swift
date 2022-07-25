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

    @IBOutlet weak var MainDrinkLine: UIView!
    @IBOutlet weak var topImageView: UIView!
    
    @IBOutlet weak var MainEatLine: UIView!
    
    @IBOutlet weak var TextButtonback2: UIView!
    
    @IBOutlet weak var TextButtonback1: UIView!
    
    var mainCenterLabel : String?
    var selectNumber : Int?
        
    var tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
    var level = UserDefaults.standard.value(forKey: "level") as! Double
    var eatcnt = UserDefaults.standard.value(forKey: "eatcnt") as! Double
    var drinkcnt = UserDefaults.standard.value(forKey: "drinkcnt") as! Double
    var backimagenum = UserDefaults.standard.value(forKey: "backimagenum") as! Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorName.backgroundcolor
        let image = UIImage(systemName: "person")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SettingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = ColorName.fontcolor
        navigationItem.title = "\(tamaname)님의 다마고치"
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  ColorName.backgroundcolor
        navigationItem.backButtonTitle = " "
        
        MainTopimage.image = UIImage(named: "bubble")
        MainImageView.image = UIImage(named: "\(selectNumber!)-\(backimagenum)")
        
        MainContentLabel.MainContentLabelDesign(tamaname)
        
        MainLevelLabel.text = "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainLevelLabel.textAlignment = .center
        MainNameImage.backgroundColor = ColorName.backgroundcolor
        
        MainEating.tintColor = ColorName.fontcolor
        MainDrinking.tintColor = ColorName.fontcolor
        
        MainTamaName.text = mainCenterLabel
        MainTamaName.layer.cornerRadius = 2
        MainTamaName.backgroundColor = ColorName.backgroundcolor
        
        MainDrinking.setTitle("물주기", for: .normal)
        MainDrinking.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        
        MainEating.setTitle("밥먹기", for: .normal)
        MainEating.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        
        MainDrinkingTextField.backgroundColor = ColorName.backgroundcolor
        MainDrinkingTextField.placeholder = "물주세용"
        MainDrinkingTextField.textAlignment = .center
        MainDrinkingTextField.keyboardType = .numberPad

        MainEatingTextField.placeholder = "밥주세용"
        MainEatingTextField.textAlignment = .center
        MainEatingTextField.backgroundColor = ColorName.backgroundcolor
        MainEatingTextField.keyboardType = .numberPad
        
        MainEatingTextField.borderStyle = .none
        MainDrinkingTextField.borderStyle = .none
        
        topImageView.backgroundColor = ColorName.backgroundcolor

        TextButtonback1.backgroundColor = ColorName.backgroundcolor
        TextButtonback2.backgroundColor = ColorName.backgroundcolor
    MainDrinkLine.backgroundColor = .black
        MainEatLine.backgroundColor = .black
        
    }
    override func viewWillAppear(_ animated: Bool) {
        RandomText()
    }
    
    
    // 사람 버튼누르면
    @objc func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        UserDefaults.standard.set(eatcnt, forKey: "eatcnt")
        UserDefaults.standard.set(drinkcnt, forKey: "drinkcnt")
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(backimagenum, forKey: "backimagenum")
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
        MainImageView.image = UIImage(named: "\(selectNumber!)-\(Int(backimagenum))")
    }
    func selectLavel(){
        let levelChagned : Double = Double((eatcnt/5)) + Double((drinkcnt / 2))
        //이거하면 레벨계산은 잘됨.
        for i in stride(from: 2, through: 9, by: 1){
            switch Int(levelChagned) {
                    case 0..<19  :
                        level = 1
                        backimagenum=1
                        imageShow()
                    case i*10..<((i+1)*10) - 1 :
                        level = Double(i)
                        backimagenum=Int(i)
                        imageShow()
                    case 100..<Int.max :
                        level = 10
                        backimagenum=9
                        imageShow()
                    default :break
                    }
            }
    }
    //MARK: 랜덤텍스트추출
    /// - Parameters:
    /// - tamaname : 타마이름
    ///
    func RandomText(){
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        navigationItem.title = "\(tamaname)님의 다마고치"
        let Randomcontent = ["\(tamaname)님 오늘 날씨가 좋네요.","\(tamaname)님 구조체 클래스차이알아요?","\(tamaname)님 나죽어...ㅠㅠ","\(tamaname)님 저 날밤샛어요ㅠㅠ","\(tamaname)님 오전10시까지인줄알았어요"]
        let selectContent = Int.random(in: 0...Randomcontent.count-1)
        MainContentLabel.text = Randomcontent[selectContent]
//        MainContentLabel.text = Randomcontent.randomElement()
        
    }
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

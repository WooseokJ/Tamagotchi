//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class MainViewController: UIViewController {

    static var identifier = "MainViewController"
    
    @IBOutlet weak var MainContentLabel: UILabel! // 말풍선안에 라벨
    @IBOutlet weak var MainTopimage: UIImageView! // 말풍선 이미지
    @IBOutlet weak var MainImageView: UIImageView! // 타마고치 이미지
    @IBOutlet weak var MainEatingTextField: UITextField! //타마고치 먹기 텍스트필드
    @IBOutlet weak var MainDrinkingTextField: UITextField! //타마고치 물마시기 텍스트필드
    @IBOutlet weak var MainLevelLabel: UILabel! //타마고치 레벨,먹기,물주기 개수
    @IBOutlet weak var MainNameImage: UIView! //타마고치 이름 백그라운드
    @IBOutlet weak var MainTamaName: UILabel!
    @IBOutlet weak var MainDrinking: UIButton! // 물주기버튼
    @IBOutlet weak var MainEating: UIButton! //밥먹기 버튼

    @IBOutlet weak var MainDrinkLine: UIView!// 물주기 버튼아래 검은선
    @IBOutlet weak var topImageView: UIView!// 말풍선 이미지 백그라운드
    
    @IBOutlet weak var MainEatLine: UIView!//밥먹기 텍스트필드 검은선
    
    @IBOutlet weak var TextButtonback2: UIView! // 물주기 텍스트필드 백그라운드
    
    @IBOutlet weak var TextButtonback1: UIView!// 밥먹기 텍스트필드 백그라운드
    
    var mainCenterLabel : String? // 타마 이름
    var selectNumber : String?
    
    var level = UserDefaults.standard.bool(forKey: "level") ? UserDefaults.standard.double(forKey: "level") : 1.0
    var eatcnt = UserDefaults.standard.bool(forKey: "eatcnt") ? UserDefaults.standard.double(forKey: "eatcnt") : 0.0
    var drinkcnt = UserDefaults.standard.bool(forKey: "drinkcnt") ? UserDefaults.standard.double(forKey: "drinkcnt") : 0.0
    
                     
    var foreimage = UserDefaults.standard.value(forKey: "foreimage") as! Int
    var backimage = UserDefaults.standard.bool(forKey: "backimage") ? UserDefaults.standard.double(forKey: "backimage") : 1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(systemName: "person")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SettingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = ColorName.fontcolor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  ColorName.backgroundcolor
        navigationItem.backButtonTitle = " "
        view.backgroundColor = ColorName.backgroundcolor
        
        //디자인
        MainTopimage.image = UIImage(named: "bubble")
        MainImageView.image = UIImage(named: "\(foreimage)-\(backimage)")
        
        MainLevelLabel.text = "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainLevelLabel.textAlignment = .center
        MainNameImage.backgroundColor = ColorName.backgroundcolor
        MainEating.tintColor = ColorName.fontcolor
        MainDrinking.tintColor = ColorName.fontcolor
        
        MainDrinking.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        MainEating.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)



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
//        saveData()
        guard UserDefaults.standard.string(forKey: "tamaname") != nil else{ //  false
            UserDefaults.standard.set("대장",forKey: "tamaname")
            let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
            navigationItem.title = "\(tamaname)님의 다마고치"
            RandomText()
            return
        }
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        print(tamaname)
        navigationItem.title = "\(tamaname)님의 다마고치"
        RandomText()
    }
    
    
    //MARK: 사람 버튼누르면
    @objc func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        saveData()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: 밥주기 버튼
    @IBAction func EatingButton(_ sender: UIButton) {
        // 레벨계산
        selectLavel()
        eatcnt+=1
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainEatingTextField.text = ""
        RandomText()
        saveData()
    }

    
    //MARK: 밥주기 텍스트필드
    @IBAction func InputEating(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        eatcnt += Double(count-1.0)
    }
    
    //MARK: 물주기 버튼
    @IBAction func DrinkningButton(_ sender: UIButton) {
        selectLavel()
        drinkcnt += 1
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainDrinkingTextField.text = ""
        RandomText()
        saveData()
        
    }
    
    //MARK: 물주기 텍스트필드
    @IBAction func InputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        drinkcnt += Double(count-1.0)
    }
    func imageShow(){
        MainImageView.image = UIImage(named: "\(foreimage)-\(Int(backimage))")
    }
    //MARK: 레벨계산
    func selectLavel(){
        let levelChagned : Double = Double((eatcnt/5)) + Double((drinkcnt / 2))
        for i in stride(from: 2, through: 9, by: 1){
            switch Int(levelChagned) {
                    case 0..<19  :
                        level = 1
                        backimage=1
                        imageShow()
            case i*10..<((i+1)*10) - 1 :
                        level = Double(i)
                        backimage=Double(i)
                        imageShow()
                        break
                    case 100..<Int.max :
                        level = 10
                        backimage=9
                        imageShow()
                    default :break
                    }
            }
    }
    //MARK: 랜덤텍스트추출
    /// - Parameters:
    /// - tamaname : 타마이름
//    var ls : [Int] = []
    func RandomText(){
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        while true{
            let Randomcontent = ["\(tamaname)님 오늘 날씨가 좋네요.","\(tamaname)님 구조체 클래스차이알아요?","\(tamaname)님 나죽어...ㅠㅠ","\(tamaname)님 저 날밤샛어요ㅠㅠ","\(tamaname)님 오전10시까지인줄알았어요"]

            let randomchoich = Randomcontent.randomElement()
            guard MainContentLabel.text != randomchoich else{
                continue
            }
            MainContentLabel.text = randomchoich
            MainContentLabel.textAlignment = .center
            break
        }
    }
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func saveData(){
        UserDefaults.standard.set(eatcnt, forKey: "eatcnt")
        UserDefaults.standard.set(drinkcnt, forKey: "drinkcnt")
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(backimage, forKey: "backimage")
        UserDefaults.standard.set(foreimage,forKey: "foreimage")
    }
}

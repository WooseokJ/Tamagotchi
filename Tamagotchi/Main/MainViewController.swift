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
    var selectNumber : Int?
    
    var tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
    var level = UserDefaults.standard.value(forKey: "level") as! Double
    var eatcnt = UserDefaults.standard.value(forKey: "eatcnt") as! Double
    var drinkcnt = UserDefaults.standard.value(forKey: "drinkcnt") as! Double
    var backimagenum = UserDefaults.standard.value(forKey: "backimagenum") as! Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        view.backgroundColor = ColorName.backgroundcolor
        
        //디자인
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
    
    
    //MARK: 사람 버튼누르면
    @objc func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        UserDefaults.standard.set(eatcnt, forKey: "eatcnt")
        UserDefaults.standard.set(drinkcnt, forKey: "drinkcnt")
        UserDefaults.standard.set(level, forKey: "level")
        UserDefaults.standard.set(backimagenum, forKey: "backimagenum")
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
    }
    
    //MARK: 물주기 텍스트필드
    @IBAction func InputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        drinkcnt += Double(count-1.0)
    }
    func imageShow(){
        MainImageView.image = UIImage(named: "\(selectNumber!)-\(Int(backimagenum))")
    }
    //MARK: 레벨계산
    func selectLavel(){
        let levelChagned : Double = Double((eatcnt/5)) + Double((drinkcnt / 2))
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

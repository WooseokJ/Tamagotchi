//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var talkContentLabel: UILabel! // 말풍선안에 라벨
    @IBOutlet weak var talkImageView: UIImageView! // 말풍선 이미지
    @IBOutlet weak var tamaImageView: UIImageView! // 타마고치 이미지
    @IBOutlet weak var eatingTextfield: UITextField! //타마고치 먹기 텍스트필드
    @IBOutlet weak var drinkTextField: UITextField! //타마고치 물마시기 텍스트필드
    @IBOutlet weak var levelLabel: UILabel! //타마고치 레벨,먹기,물주기 개수
    @IBOutlet weak var nameBackView: UIView! //타마고치 이름 백그라운드
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var drinkingButton: UIButton! // 물주기버튼
    @IBOutlet weak var eatingButton: UIButton! //밥먹기 버튼
    @IBOutlet weak var drinkingLineView: UIView!// 물주기 버튼아래 검은선
    @IBOutlet weak var talkBackView: UIView!// 말풍선 이미지 백그라운드
    @IBOutlet weak var eatLineView: UIView!//밥먹기 텍스트필드 검은선
    @IBOutlet weak var textDrinkingBackButtonView: UIView! // 물주기 텍스트필드 백그라운드
    @IBOutlet weak var textEatButtonView: UIView!// 밥먹기 텍스트필드 백그라운드
    
    var mainCenterLabel = UserDefaults.standard.string(forKey:"tamaSelectName") 
    var selectNumber : String?
    
    //    var level = UserDefaults.standard.bool(forKey: "level") ? UserDefaults.standard.double(forKey: "level") : 1.0
    
    var eatcnt = UserDefaults.standard.bool(forKey: "eatcnt") ? UserDefaults.standard.double(forKey: "eatcnt") : 0.0
    var drinkcnt = UserDefaults.standard.bool(forKey: "drinkcnt") ? UserDefaults.standard.double(forKey: "drinkcnt") : 0.0
    var backimage = UserDefaults.standard.bool(forKey: "backimage") ? UserDefaults.standard.double(forKey: "backimage") : 1
    var foreimage = UserDefaults.standard.value(forKey: "foreimage") as! Int
    
    var tamaNameDefalut : String = "대장"
    var tamaNameTitle : String?
    var count : Int = 0
    var newlevel : Int = 0
    var level : Int{
        get{
            count = Int(((eatcnt/5) + (drinkcnt / 2)))
            
            guard count > 20 else{
                return 1
            }
            guard newlevel == 0 else {
                return newlevel
            }
            guard count < 100 else{
                return 10
            }
            
            return count/10
        }
        set{
            newlevel = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(systemName: "person")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SettingButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = ColorName.fontcolor
        navigationItem.backButtonTitle = " "
        view.backgroundColor = ColorName.backgroundcolor
        navigationItem.navItemDesign()
        
        // 이미지
        talkImageView.image = UIImage(named: "bubble")
        tamaImageView.image = UIImage(named: "\(foreimage)-\(backimage)")
        
        //버튼
        eatingButton.MainDesingButton(tintcolor: ColorName.fontcolor, title: "밥먹기", imagename: "leaf.circle")
        drinkingButton.MainDesingButton(tintcolor: ColorName.fontcolor, title: "물주기", imagename: "drop.circle")
        
        //뷰
        nameBackView.backgroundColor = ColorName.backgroundcolor
        talkBackView.backgroundColor = ColorName.backgroundcolor
        textEatButtonView.backgroundColor = ColorName.backgroundcolor
        textDrinkingBackButtonView.backgroundColor = ColorName.backgroundcolor
        drinkingLineView.backgroundColor = .black
        eatLineView.backgroundColor = .black
        
        //라벨
        tamaNameLabel.MainDesignLabel(text : mainCenterLabel!)
        levelLabel.MainDesignLabel(text: "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))")
        drinkTextField.DesignTextField(title: "물주세요")
        eatingTextfield.DesignTextField(title: "밥주세요")
    }
    override func viewWillAppear(_ animated: Bool) {
        guard UserDefaults.standard.string(forKey: "tamaname") != nil else{
            UserDefaults.standard.set(tamaNameDefalut,forKey: "tamaname")
            let tamaname = UserDefaults.standard.string(forKey: "tamaname")
            navigationItem.title = "\(tamaname!)님의 다마고치"
            tamaNameTitle = tamaname
            randomText()
            return
        }
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        navigationItem.title = "\(tamaname)님의 다마고치"
        tamaNameTitle = tamaname
        randomText()
    }
    
    
    //MARK: 사람 버튼누르면
    @objc func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as? SettingTableViewController else{
            return
        }
        saveData()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: 밥주기 버튼
    @IBAction func EatingButton(_ sender: UIButton) {
        selectLavel() // 레벨 계산
        eatcnt+=1
        print("밥주기"+String(level))
        guard level < 10 else {
            level = 10
            levelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
            eatingTextfield.text = ""
            randomText() //컨텐츠 내용 랜덤출력
            saveData() // 데이터 저장하기
            return
        }
        levelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        eatingTextfield.text = ""
        randomText() //컨텐츠 내용 랜덤출력
        saveData() // 데이터 저장하기
    }
    
    
    //MARK: 밥주기 텍스트필드
    @IBAction func InputEating(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        eatcnt += Double(count-1.0)
    }
    
    //MARK: 물주기 버튼
    @IBAction func DrinkningButton(_ sender: UIButton) {
        selectLavel() //계산하기
        drinkcnt += 1
        guard level < 10 else {
            levelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
            eatingTextfield.text = ""
            //            RandomText() //컨텐츠 내용 랜덤출력
            saveData() // 데이터 저장하기
            return
        }
        levelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        drinkTextField.text = ""
        randomText() //컨텐츠 내용 랜덤출력
        saveData()  // 데이터 저장하기
    }
    
    
    //MARK: 물주기 텍스트필드
    @IBAction func inputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        drinkcnt += Double(count-1.0)
    }
    
    //MARK: 레벨계산
    func selectLavel() {
        guard level < 10 else {
            tamaImageView.image = UIImage(named: "\(foreimage)-9")
            print(level)
            return
        }
        tamaImageView.image = UIImage(named: "\(foreimage)-\(Int(level))")
    }
    //MARK: 랜덤텍스트추출
    /// - Parameters:
    /// - tamaname : 타마이름
    //    var ls : [Int] = []
    func randomText(){
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        while true {
            let Randomcontent = ["\(tamaname)님 오늘 날씨가 좋네요.","\(tamaname)님 구조체 클래스차이알아요?","\(tamaname)님 나죽어...ㅠㅠ","\(tamaname)님 저 날밤샛어요ㅠㅠ","\(tamaname)님 오전10시까지인줄알았어요"]
            let randomchoich = Randomcontent.randomElement()
            guard talkContentLabel.text != randomchoich else {
                continue
            }
            talkContentLabel.text = randomchoich
            talkContentLabel.textAlignment = .center
            break
        }
    }
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func saveData() {
        UserDefaults.standard.set(eatcnt, forKey: "eatcnt")
        UserDefaults.standard.set(drinkcnt, forKey: "drinkcnt")
        UserDefaults.standard.set(backimage, forKey: "backimage")
        UserDefaults.standard.set(foreimage,forKey: "foreimage")
    }
}

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
    
    var mainCenterLabel = UserDefaults.standard.string(forKey:"tamaSelectName") 
    var selectNumber : String?
    
    //    var level = UserDefaults.standard.bool(forKey: "level") ? UserDefaults.standard.double(forKey: "level") : 1.0
    
    
    var eatcnt = UserDefaults.standard.bool(forKey: "eatcnt") ? UserDefaults.standard.double(forKey: "eatcnt") : 0.0
    var drinkcnt = UserDefaults.standard.bool(forKey: "drinkcnt") ? UserDefaults.standard.double(forKey: "drinkcnt") : 0.0
    var backimage = UserDefaults.standard.bool(forKey: "backimage") ? UserDefaults.standard.double(forKey: "backimage") : 1
    var foreimage = UserDefaults.standard.value(forKey: "foreimage") as! Int
    
    var tamaNameTitle : String?
    var count : Int = 0
    var level : Int{
        get{
            count = Int(((eatcnt/5) + (drinkcnt / 2)))

            guard count > 20 else{
                return 1
            }
            
            guard count < 100 else{
                return 9
            }
            
            
            return count/10
        }
        set{
            count = newValue

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
        MainTopimage.image = UIImage(named: "bubble")
        MainImageView.image = UIImage(named: "\(foreimage)-\(backimage)")
        
        //버튼
        MainEating.MainDesingButton(tintcolor: ColorName.fontcolor, title: "밥먹기", imagename: "leaf.circle")
        MainDrinking.MainDesingButton(tintcolor: ColorName.fontcolor, title: "물주기", imagename: "drop.circle")
        
        //뷰
        MainNameImage.backgroundColor = ColorName.backgroundcolor
        topImageView.backgroundColor = ColorName.backgroundcolor
        TextButtonback1.backgroundColor = ColorName.backgroundcolor
        TextButtonback2.backgroundColor = ColorName.backgroundcolor
        MainDrinkLine.backgroundColor = .black
        MainEatLine.backgroundColor = .black
        
        //라벨
        MainTamaName.MainDesignLabel(text : mainCenterLabel!)
        MainLevelLabel.MainDesignLabel(text: "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))")
        MainDrinkingTextField.DesignTextField(title: "물주세요")
        MainEatingTextField.DesignTextField(title: "밥주세요")
        
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        guard UserDefaults.standard.string(forKey: "tamaname") != nil else{
            UserDefaults.standard.set("대장",forKey: "tamaname")
            let tamaname = UserDefaults.standard.string(forKey: "tamaname")
            navigationItem.title = "\(tamaname!)님의 다마고치"
            tamaNameTitle = tamaname
            RandomText()
            return
        }
        let tamaname = UserDefaults.standard.value(forKey: "tamaname") as! String
        navigationItem.title = "\(tamaname)님의 다마고치"
        tamaNameTitle = tamaname
        RandomText()
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
        selectLavel() // 레벨계산
        eatcnt+=1
        guard level > 10 else{
            MainLevelLabel.text =  "LV \(Int(level+1)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
            MainEatingTextField.text = ""
            RandomText() //컨텐츠 내용 랜덤출력
            saveData() // 데이터 저장하기
            return
        }
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainEatingTextField.text = ""
        RandomText() //컨텐츠 내용 랜덤출력
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
        guard level > 10 else{
            MainLevelLabel.text =  "LV \(Int(level+1)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
            MainEatingTextField.text = ""
            RandomText() //컨텐츠 내용 랜덤출력
            saveData() // 데이터 저장하기
            return
        }
        MainLevelLabel.text =  "LV \(Int(level)) 밥알 \(Int(eatcnt))개 물방울 \(Int(drinkcnt))"
        MainDrinkingTextField.text = ""
        RandomText() //컨텐츠 내용 랜덤출력
        saveData()  // 데이터 저장하기
        
    }
 
    
    //MARK: 물주기 텍스트필드
    @IBAction func InputDrinking(_ sender: UITextField) {
        guard let count = Double(sender.text ?? "0") else { return  }
        drinkcnt += Double(count-1.0)
    }

    //MARK: 레벨계산
    func selectLavel(){
        guard level < 9 else {
            level = 9
            MainImageView.image = UIImage(named: "\(foreimage)-\(Int(level))")
            return
        }
        MainImageView.image = UIImage(named: "\(foreimage)-\(Int(level))")
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
        UserDefaults.standard.set(backimage, forKey: "backimage")
        UserDefaults.standard.set(foreimage,forKey: "foreimage")
    }
}

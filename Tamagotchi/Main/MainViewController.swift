//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit
@available (iOS 15.0,*)
class MainViewController: UIViewController {

    static var identifier = "MainViewController"
    
    @IBOutlet weak var MainContentLabel: UILabel!
    @IBOutlet weak var MainImageView: UIImageView!
    
    @IBOutlet weak var MainTamaName: UILabel!
    
    
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
    var tamaName : String = "대장"
    
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
    
    }
    @objc
    func SettingButtonClicked(){
        let sb = UIStoryboard(name:"Grow",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
}

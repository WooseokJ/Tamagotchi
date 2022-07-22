//
//  RenameViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class RenameViewController: UIViewController {
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        navigationItem.title = "대장님 이름 정하기"
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.titleView?.tintColor = fontcolor
    }
    
    @objc
    func saveButtonClicked(){
        // 다마고치 바뀌는부분
        
        
        self.navigationController?.popViewController(animated: true)
    }
        
    



}

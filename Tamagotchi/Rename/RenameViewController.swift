//
//  RenameViewController.swift
//  Tamagotchi
//
//  Created by useok on 2022/07/22.
//

import UIKit

class RenameViewController: UIViewController {
    var backgroundcolor = UIColor(red:245/255, green: 252/255, blue:252/255,alpha: 1)
    @IBOutlet weak var renameTextField: UITextField!
    var fontcolor = UIColor(red:77/255, green: 106/255, blue:120/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        navigationItem.title = "\(NameClass.tamaName)님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.titleView?.tintColor = fontcolor
        
        renameTextField.backgroundColor = backgroundcolor
        
    }
    
    @objc func saveButtonClicked(){
        // 다마고치 바뀌는부분
        guard !renameTextField.text!.isEmpty else{
            let alert = UIAlertController(title: "알림", message: "변경할 이름을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let alertCheck = UIAlertAction(title: "확인", style: .default)
            alert.addAction(alertCheck)
            present(alert, animated: true)
            return
        }
        NameClass.tamaName = renameTextField.text!
        self.navigationController?.popViewController(animated: true)
    }
        
    
    @IBAction func ChangedTextField(_ sender: UITextField) {
        renameTextField.text = sender.text

    }
    


}

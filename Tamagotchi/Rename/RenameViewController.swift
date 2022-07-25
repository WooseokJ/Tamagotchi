import UIKit

class RenameViewController: UIViewController {
    
    @IBOutlet weak var Textback: UIView!
    @IBOutlet weak var renameTextField: UITextField!
    let tamaName = UserDefaults.standard.value(forKey: "tamaname") as! String
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorName.backgroundcolor
        navigationItem.title = "\(tamaName)님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        renameTextField.backgroundColor = ColorName.backgroundcolor
        navigationItem.titleView?.tintColor = ColorName.fontcolor
        renameTextField.placeholder = "\(tamaName)님 수정할 이름을 입력해주세요"
        navigationController?.navigationBar.tintColor = ColorName.fontcolor
        renameTextField.borderStyle = .none
        Textback.backgroundColor = .black
        
    }
    
    @objc func saveButtonClicked() {
        // 다마고치 바뀌는부분
        guard !renameTextField.text!.isEmpty else{
            let alert = UIAlertController(title: "알림", message: "변경할 이름을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let alertCheck = UIAlertAction(title: "확인", style: .default)
            alert.addAction(alertCheck)
            present(alert, animated: true)
            return
        }
        
        UserDefaults.standard.set(renameTextField.text!, forKey: "tamaname")
        NameClass.rename = renameTextField.text!
        let right : [String] = [NameClass.rename!,"",""]
        UserDefaults.standard.set(right,forKey: "right")
        
        self.navigationController?.popViewController(animated: true)
    }
        
    
    @IBAction func ChangedTextField(_ sender: UITextField) {
        renameTextField.text = sender.text
        
    }
    


}

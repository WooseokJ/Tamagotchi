import UIKit

class RenameViewController: UIViewController {
    
    @IBOutlet weak var textLineView: UIView! // 텍스트필드 아래 검은색 선
    @IBOutlet weak var renameTextField: UITextField! // 이름바꾸는 텍스트필드
    let tamaName = UserDefaults.standard.value(forKey: "tamaname") as! String //타마 이름
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorName.backgroundcolor
        navigationItem.title = "\(tamaName)님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationController?.navigationBar.tintColor = ColorName.fontcolor
        navigationItem.titleView?.tintColor = ColorName.fontcolor
        renameTextField.renameTextFieldDesign(title: tamaName)
        textLineView.backgroundColor = .black
    }
    // 네비게이션 뷰 저장하기
    @objc func saveButtonClicked() {
        // 다마고치 바뀌는부분
        guard let renameText = renameTextField.text else {
            return
        }
        guard !(renameText.isEmpty) else{
            let alert = UIAlertController(title: "알림", message: "변경할 이름을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let alertCheck = UIAlertAction(title: "확인", style: .default)
            alert.addAction(alertCheck)
            present(alert, animated: true)
            return
        }
        UserDefaults.standard.set(renameTextField.text!, forKey: "tamaname")
        self.navigationController?.popViewController(animated: true)
    }
    
    // 이름 바꿔주는부분
    @IBAction func ChangedTextField(_ sender: UITextField) {
        renameTextField.text = sender.text
        
    }
    
    
    
}

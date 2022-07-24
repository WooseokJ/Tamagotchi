import UIKit

//enum Setting : Int,CaseIterable{
//    case mynameSetting, tamaChanged, dataFormat
//    var rowTitle : [String]{
//        switch self {
//        case .mynameSetting:
//            return ["pencil","내이름 설정하기","고래밥"]
//        case .tamaChanged:
//            return ["moon.fill","다마고치 변경하기",""]
//        case .dataFormat:
//            return ["arrow.clockwise","데이터 초기화",""]
//        }
//    }
//}

class SettingTableViewController: UITableViewController {
    
    let left = ["pencil","moon.fill","arrow.clockwise"]
    let center = ["내이름 설정하기","다마고치 변경하기","데이터 초기화"]
    let right = ["고래밥","",""]
    
    override func viewWillAppear(_ animated: Bool) {
     
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorName.backgroundcolor
        tableView.rowHeight = 60
        navigationItem.title = "설정"
        navigationItem.backButtonTitle = " "
        navigationItem.titleView?.tintColor = ColorName.fontcolor

    }
  

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell")!
        cell.accessoryType = .disclosureIndicator
        cell.focusStyle = .custom

        cell.textLabel?.text = center[indexPath.row]
        cell.imageView?.image = UIImage(systemName: left[indexPath.row])
        cell.imageView?.tintColor = ColorName.fontcolor
        cell.detailTextLabel?.text = right[indexPath.row]
        cell.detailTextLabel?.textColor = .systemGray
        cell.backgroundColor = ColorName.backgroundcolor
        
        return cell
   
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        switch indexPath.row{
        case 0 :
            let sb = UIStoryboard(name:"Grow",bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "RenameViewController") as! RenameViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            navigationItem.backButtonTitle = "설정"
            navigationItem.titleView?.tintColor = ColorName.fontcolor
        case 1:
            let sb = UIStoryboard(name:"Main",bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            UserDefaults.standard.set("변경하기", forKey: "startbutton")
            UserDefaults.standard.set("타마고치 변경하기", forKey: "tamachange")
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: UIAlertController.Style.alert)
            let alertCancel = UIAlertAction(title: "아냐", style: .cancel, handler: nil)
            let alertConfirm = UIAlertAction(title: "웅", style: .default){ (action) in
                refreshClicked()
            }
            
            alert.addAction(alertCancel)
            alert.addAction(alertConfirm)
            
            present(alert, animated: true, completion: nil)
        default:break
            
        }
        func refreshClicked(){
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
            }
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        }
    }



  
}

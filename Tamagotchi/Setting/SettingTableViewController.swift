import UIKit

enum cellContent : CaseIterable{
    case left,center,right
    var sectionTitle : [String]{
        switch self {
        case .left : return ["pencil","내이름 설정하기",UserDefaults.standard.string(forKey: "tamaname")!+"님"]
        case .center : return ["moon.fill","다마고치 변경하기",""]
        case .right : return["arrow.clockwise","데이터 초기화",""]
        }
    }
    
}


class SettingTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        let s = UserDefaults.standard.string(forKey: "tamaname")
        UserDefaults.standard.set(s!,forKey: "tamaname")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorName.backgroundcolor
        tableView.rowHeight = 60
        navigationItem.title = "설정"
        navigationItem.backButtonTitle = " "
        navigationController?.navigationBar.tintColor = ColorName.fontcolor
        
    }
    
    
    // 섹션개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.allCases.count
    }
    //셀 값넣기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        let rowTitle = cellContent.allCases[indexPath.row].sectionTitle
        cell.design(rowTitle)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
        case 0 : // 이름바꾸기
            let sb = UIStoryboard(name:"Grow",bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: RenameViewController.identifier) as! RenameViewController
            self.navigationController?.pushViewController(vc, animated: true)
            navigationItem.backButtonTitle = "설정"
            navigationItem.titleView?.tintColor = ColorName.fontcolor
        case 1: // 타마고치 변경하기
            let sb = UIStoryboard(name:"Main",bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as! SelectCollectionViewController
            UserDefaults.standard.set(true, forKey: "startbutton")
            UserDefaults.standard.set(true, forKey: "tamachange")
            
            self.navigationController?.pushViewController(vc, animated: true)
        case 2: // 데이터 초기화
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: UIAlertController.Style.alert)
            let alertCancel = UIAlertAction(title: "아냐", style: .cancel, handler: nil)
            let alertConfirm = UIAlertAction(title: "웅", style: .default){ (action) in refreshClicked()}
            alert.addAction(alertCancel)
            alert.addAction(alertConfirm)
            present(alert, animated: true, completion: nil)
        default:break
        }
        // 초기화
        func refreshClicked(){
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as! SelectCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
            }
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        }
    }
    
    
    
    
}

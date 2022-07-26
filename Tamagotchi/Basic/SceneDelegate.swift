
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //UserDefault 초기화
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey: key.description)
//        }
        if UserDefaults.standard.bool(forKey: "First"){

            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "Grow", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            let nav = UINavigationController(rootViewController: vc2)
            window?.rootViewController = nav
        }
        else{
          

            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            window?.rootViewController = UINavigationController(rootViewController: vc2) //네비게이션 없이는 vc2만 입력
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}


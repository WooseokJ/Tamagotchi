
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        /* 이해안되서 공부좀하고 해보겟음.
         
        if UserDefaults.standard.bool(forKey: "First"){
            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            window?.rootViewController = vc2
        }
        else{
            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "TrendMedia", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "TrendMediaTableViewController") as! TrendMediaTableViewController
            window?.rootViewController = UINavigationController(rootViewController: vc2) //네비게이션 없이는 vc2만 입력
            
        }*/
        

        window?.makeKeyAndVisible()
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


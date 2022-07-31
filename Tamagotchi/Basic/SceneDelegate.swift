
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

// 앱이 시작하려고할떄
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //UserDefault 초기화
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey: key.description)
//        }
//        
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

    
    // 종료 되는시점
    func sceneDidDisconnect(_ scene: UIScene) {
       
    }
    //  app switcher(멀티테스킹)이거나 전화가 오거나 다시 활성화되는거
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive")
    }
// 사용자가 scene과의 상호작용을 중지할 때 호출됩니다. (다른 화면으로의 전환이 예입니다.) 즉, 비활성화
    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")
    }
    
//  포그라운드 상태로 앱이 들어가려고 하는 순간(scene이 포그라운드로 진입할 때 호출됩니다.)
    func sceneWillEnterForeground(_ scene: UIScene) {
      
        print("sceneWillEnterForeground")
    }
// 앱이 사라지는상태 (씰행은 하고있는데) (scene이 백그라운드로 진입할때 호출됩니다)
    func sceneDidEnterBackground(_ scene: UIScene) {
       print("sceneDidEnterBackground")
    }

    
    // viewdidload : 처음 앱이 시작될때만 실행
    // viewwillappear : (네비바 push,pop,show) 에서도적용, 넘어가는 순간
    // viewdidappear :완전히 넘어갈떄
    
    // viewWillDisappear : 사라지는 순간
    // viewDidDisappear: 완전히 사라질떄
    

}


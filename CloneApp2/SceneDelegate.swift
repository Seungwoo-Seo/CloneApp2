//
//  SceneDelegate.swift
//  CloneApp2
//
//  Created by 서승우 on 2021/12/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var blurView: UIVisualEffectView?
    

    //iOS 12의 application (_ : didFinishLaunchingWithOptions) 와 같은 기능
    //scene이 앱에 추가될 때 호출
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in //알림을 띄울 때 alert, sound, badge를 띄울 권한을 사용자에게 요청하는 것
            //만약 사용자가 권한을 허용했다면 granted는 true 로 , 그렇지 않으면 false 로 출력된다.
            print("Permission granted : \(granted)")
        }
        
        UIApplication.shared.registerForRemoteNotifications()
        
    }

    //scene의 연결이 해제될 때 호출
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    //app switcher에서 선택되면 inActive에서 active 상태로 전환
    func sceneDidBecomeActive(_ scene: UIScene) {
        // 앱이 다시 활성화 상태가 되면 blurView를 superView(window)에서 제거한다
        if let blurView = blurView {
            blurView.removeFromSuperview()
        }
    }

    //active 상태에서 inactive로 전환 시
    func sceneWillResignActive(_ scene: UIScene) {
        // will resign active 상태가 호출되면 blurView를 window 크기로 잡아주고 window 에 추가한다
        guard let window = window else {
            return
        }
        let effect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: effect)
        blurView?.frame = window.frame
        window.addSubview(blurView!)
    }

    //background에서 foreground로 전환 시
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    //foreground에서 bacground로 전환 시
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


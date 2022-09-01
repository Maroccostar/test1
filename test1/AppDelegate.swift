
import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate { 

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        var currentVC: UIViewController
        currentVC = ViewControllerTest()
        let navigationController = UINavigationController(rootViewController: currentVC)
        navigationController.navigationBar.shadowImage = UIImage()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        navigationController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}


//
//  AppDelegate.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        utilRegisterDependencies()
        serviceRegisterDependencies()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate { //DI Regist
    
    //Util 관련 객체 Dependency등록
    private func utilRegisterDependencies() {
        DIContainer.shared.register(ReadPList())
        let readPList: ReadPList = DIContainer.shared.resolve()
        DIContainer.shared.register(readPList)
    }

    //Service 관련 객체 Dependency등록
    private func serviceRegisterDependencies() {
        DIContainer.shared.register(HeaderCommon())
        DIContainer.shared.register(APIRequestService())
        DIContainer.shared.register(APIUrlService())
        let headerCommon: HeaderCommon = DIContainer.shared.resolve()
        let apiRequestService: APIRequestService = DIContainer.shared.resolve()
        let apiUrlService: APIUrlService = DIContainer.shared.resolve()
        DIContainer.shared.register(headerCommon)
        DIContainer.shared.register(apiRequestService)
        DIContainer.shared.register(apiUrlService)
    }
}

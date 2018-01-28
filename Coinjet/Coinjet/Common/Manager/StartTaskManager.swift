//
//  StartTaskManager.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import RxSwift


class StartTaskManager {
    
    static let sharedInstance = StartTaskManager()
    let splashViewController: SplashViewController = SplashViewController.makeInstance()
    let disposeBag = DisposeBag()
    let publishSubject = ReplaySubject<Bool>.create(bufferSize: 1)
    
    func startTask() -> Observable<Bool> {
        UIApplication.findKeyWindowsViewController().present(splashViewController, animated: false, completion: nil)
        return self.autoLogin().debug()
            .catchErrorJustReturn(false)
            .flatMap{ x -> Observable<Bool> in
                if !x {
                    self.presentSignInViewController()
                } else {
                    self.complete()
                }
                return self.publishSubject
        }
        
    }
    
    func autoLogin() -> Observable<Bool> {
        let loginService = LoginService()
        return loginService.authLogin().catchErrorJustReturn(false)
    }
    
    func presentSignInViewController() {
        let storyboard = UIStoryboard(name: "StartTask", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        vc.delegate = self
        let navigationVc = UINavigationController(rootViewController: vc)
        UIApplication.findKeyWindowsViewController().present(navigationVc, animated: true, completion: nil)
    }
    
    
}

extension StartTaskManager: SignInDelegate {
    func complete() {
        self.splashViewController.dismiss(animated: true, completion: {
            self.publishSubject.onNext(true)
        })
    }
}

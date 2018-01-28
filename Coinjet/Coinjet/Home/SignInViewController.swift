//
//  SignInViewController.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import UIKit
import RxSwift

protocol SignInDelegate {
    func complete()
}

class SignInViewController: UIViewController {
    
    @IBOutlet weak var kakaoBtn: UIButton!
    let loginService = LoginService()
    var delegate: SignInDelegate?
    let disposeBag = DisposeBag()
    
    @IBAction func respondKakaoTalkLogin(_ sender: Any) {
        let kakaoManager = KakaoManager()
        kakaoManager.kakaoLogin()
            .flatMap{ auth in self.loginService.signIn(auth: auth) }
            .subscribe(
                onNext: { event in self.presentMainViewController()
// todo SignUp Flow
//                onError: { _ in
//                    kakaoManager.getKakaoUser().debug()
//                        .subscribe(
//                            onNext: { auth in self.presentSignUpViewcontroller(auth: auth) }
//                        ).addDisposableTo(self.disposeBag)
            }).addDisposableTo(self.disposeBag)
        
        
    }
    
// todo SignUp Flow
//    func presentSignUpViewcontroller(auth: Auth) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EmailViewController") as! EmailViewController
//        nextViewController.auth = auth
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
    
    func presentMainViewController() {
        self.delegate?.complete()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


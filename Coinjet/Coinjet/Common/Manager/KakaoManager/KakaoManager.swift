//
//  KakaoManager.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 27/11/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import RxSwift

class KakaoManager {
    let disposeBag = DisposeBag()
    init() {}
    
    func kakaoLogin() -> Observable<Auth> {
        return Observable.create({ (observer) -> Disposable in
            let session: KOSession = KOSession.shared()
            
            if session.isOpen() {
                session.close()
            }
            
            session.open(completionHandler: { (err) in
                if session.isOpen() {
                    print("success")
                    
                    let auth = Auth(accessToken: session.accessToken)
                    observer.onNext(auth)
                    observer.onCompleted()
                    
                } else {
                    observer.onError(RxError.unknown)
                }
            }, authTypes: [ NSNumber.init(value: KOAuthType.talk.rawValue )])
            return Disposables.create()
        })
    }
    
    func getKakaoUser() -> Observable<Auth> {
        return Observable.create { (observer) -> Disposable in
            self.requestMe()
                .subscribe(onNext: {  (user) in
                    let auth = Auth(accessToken: KOSession.shared().accessToken)
                    if let email = user.email {
                        auth.email = email
                    }
                    observer.onNext(auth)
                    observer.onCompleted()
                }, onError : { err in
                    observer.onError(err)
                })
                .addDisposableTo(self.disposeBag)
            return Disposables.create()
        }
    }
    
    func requestMe() -> Observable<KOUser> {
        return Observable.create({ (observer) -> Disposable in
            KOSessionTask.meTask { (result, error) -> Void in
                
                guard let result = result as? KOUser else {
                    observer.onError(RxError.unknown)
                    return
                }
                
                if let error = error as NSError? {
                    observer.onError(error)
                    return
                } else {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        })
    }
}

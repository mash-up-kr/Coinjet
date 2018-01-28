//
//  LoginService.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import RxSwift

class LoginService {
    typealias LoginSuccessHandler = () -> ()
    typealias ErrorHandler = (Error) -> ()
    let disposeBag = DisposeBag()
    
    enum LoginError: Error {
        case unknown
        case unauthorized
    }
    
    func authLogin() -> Observable<Bool> {
        if CommonData.shared.userData?.auth?.accessToken != "" {
            guard let auth = CommonData.shared.userData?.auth else {
                return Observable.error(LoginError.unknown)
            }
            return self.signIn(auth: auth)
        }
        return Observable.just(false)
    }
    
    
    func signIn(auth: Auth) -> Observable<Bool> {
        return Observable.create({ (observer) -> Disposable in
            let accessToken = auth.accessToken
            
            // todo Server 통신 부분
            observer.onNext(true)
            observer.onCompleted()
//            observer.onError(LoginError.unauthorized)

            
            return Disposables.create()
        })
    }
}

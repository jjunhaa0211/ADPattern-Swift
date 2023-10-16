//
//  LoginViewModel.swift
//  RxSwift+MVVM
//
//  Created by 박준하 on 10/16/23.
//

import Foundation
import RxSwift
import RxCocoa

struct LoginViewModel: ViewModelType {
    struct Input {
        let email: Observable<String>
        let password: Observable<String>
    }

    struct Output {
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> Output {
        let isValid = Observable.combineLatest(input.email, input.password)
            .map { email, password in
                return email.count > 3 && password.count > 3
            }
            .startWith(false)

        return Output(isValid: isValid)
    }
}

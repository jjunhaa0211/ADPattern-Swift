//
//  ViewModelType.swift
//  RxSwift+MVVM
//
//  Created by 박준하 on 10/16/23.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
 }

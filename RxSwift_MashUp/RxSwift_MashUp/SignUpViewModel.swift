//
//  SignUpViewModel.swift
//  RxSwift_MashUp
//
//  Created by rookie.w on 2020/05/03.
//  Copyright © 2020 rookie.w. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType{
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

class SignUpViewModel: ViewModelType{
    var disposeBag = DisposeBag()
    
    
    struct Input{
    }
    struct Output{
    }
    func transform(input: Input) -> Output{
        
        return Output()
    }
    
    enum PartType: Int {
        case Dev = 0
        case Design = 1
    }
}

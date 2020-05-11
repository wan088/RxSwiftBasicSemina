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
}
class SignUpViewModel: ViewModelType{
    var disposeBag = DisposeBag()
    
    var confirmedId = PublishSubject<Bool>()
    var memberDepart = PublishSubject<MemberType>()
    
    struct Input{
        let idText: Observable<String>
        let depart: Observable<Int>
    }
    struct Output{
        let confirmedId: PublishSubject<Bool>
        let memberDepart: PublishSubject<MemberType>
    }
    func transform(_ input: Input) -> Output{
        
        input.idText
            .map{$0.isValidId()}
            .bind(to: confirmedId)
            .disposed(by: disposeBag)
        
        input.depart
            .map{MemberType.init(rawValue: $0)}
            .compactMap{$0}
            .bind(to: memberDepart)
            .disposed(by: disposeBag)
            
        return Output(confirmedId: confirmedId, memberDepart: memberDepart)
    }
    
    enum MemberType: Int{
        case Dev = 0
        case Design = 1
        
        func isDev() -> Bool {
            return self == .Dev
        }
        func toString() -> String {
            switch self {
            case .Dev :
                return "Developer"
            case .Design :
                return "Designer"
            }
        }
    }
}


private extension String{
    func isValidId() -> Bool{
        return 5...10 ~= self.count
    }
}

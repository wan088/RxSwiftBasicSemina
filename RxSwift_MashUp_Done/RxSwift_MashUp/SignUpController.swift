//
//  ViewController.swift
//  RxSwift_MashUp
//
//  Created by rookie.w on 2020/04/29.
//  Copyright © 2020 rookie.w. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SignUpController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel = SignUpViewModel()
    
    @IBOutlet weak var MemberTypeLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var invalidId: UILabel!
    @IBOutlet weak var checkedId: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var devOrDesign: UISegmentedControl!
    @IBOutlet weak var devType: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        bind()
    }
    func setViews(){
        self.title = "회원가입"
        self.checkedId.isHidden = true
    }
    func bind(){
        let idText = idTextField.rx.text
            .orEmpty
            .asObservable()
        
        let departIdx = devOrDesign.rx.value
            .asObservable()
        
        let output = viewModel.transform(SignUpViewModel.Input(idText: idText, depart: departIdx))
        
        output.confirmedId
            .bind(to: self.invalidId.rx.isHidden)
            .disposed(by: disposeBag)
        
        output.confirmedId
            .map{!$0}
            .bind(to: self.checkedId.rx.isHidden)
            .disposed(by: disposeBag)
        
        output.memberDepart
            .map{$0.toString()}
            .bind(to: self.MemberTypeLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.memberDepart
            .map{$0.isDev()}
            .bind(to: devType.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
}


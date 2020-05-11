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
    
    @IBOutlet weak var devOrDesign: UISegmentedControl!
    @IBOutlet weak var devType: UISegmentedControl!
    
    @IBOutlet weak var signUpButton: UIButton!
    
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
            
    }
}


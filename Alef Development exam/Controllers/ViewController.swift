//
//  ViewController.swift
//  Alef Development exam
//
//  Created by MacBook on 21.02.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.hideKeyBoard()   // позволяет прятать клавиатуру независимо от количества сабвью 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let addDataView = AddDataView ()
        view.addSubview(addDataView)
        addDataView.snp.makeConstraints
        { make in make.edges.equalTo(self.view) }
        
    }

}


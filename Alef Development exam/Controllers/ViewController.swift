//
//  ViewController.swift
//  Alef Development exam
//
//  Created by MacBook on 21.02.2022.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.hideKeyBoard()   // позволяет прятать клавиатуру независимо от количества сабвью 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Childs> = Childs.fetchRequest()
        do {
            ChildData.sharedChild.child = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        let addDataView = AddDataView ()
        view.addSubview(addDataView)
        addDataView.snp.makeConstraints
        { make in make.edges.equalTo(self.view) }
        
    }

}


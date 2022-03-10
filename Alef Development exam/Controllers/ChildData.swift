//
//  ChildData.swift
//  Alef Development exam
//
//  Created by MacBook on 22.02.2022.
//

import UIKit


class ChildData {
    static let sharedChild = ChildData()
    var child: [SingleChild] = []
    
    private init () {}
}

struct SingleChild {
    var name: String
    var age: String
}

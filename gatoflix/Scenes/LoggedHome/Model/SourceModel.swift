//
//  SourceModel.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 04/06/23.
//

import UIKit

class SourceModel {

    var type: String?
    var title: String?
    var resources: [String]?
    
    init(type: String?,
         title: String?,
         resources: [String]?
    ) {
        self.type = type
        self.title = title
        self.resources = resources
    }
}

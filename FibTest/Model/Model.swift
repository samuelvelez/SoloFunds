//
//  Model.swift
//  FibTest
//
//  Created by Samuel on 25/3/22.
//  Copyright © 2022 James Nguyen (JTN). All rights reserved.
//

import Foundation


struct DataSaved: Encodable, Decodable{
    
    let number: Int
    let time: Int
}

struct DatasSaved :  Encodable, Decodable{
    let datas : [DataSaved]
}

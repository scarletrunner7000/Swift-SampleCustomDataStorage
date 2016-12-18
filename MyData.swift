//
//  MyData.swift
//  SmapleCustomDataStorage
//
//  Created by inagaki on 2016/08/12.
//  Copyright © 2016年 inagaki. All rights reserved.
//

import Foundation


class MyData :NSObject, NSCoding {
    var valueString :String?

    override init() {
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(valueString, forKey: "valueString")
    }

    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObjectForKey("valueString") as? String
    }
}

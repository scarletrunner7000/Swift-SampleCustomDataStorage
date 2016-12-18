//
//  ViewController.swift
//  SmapleCustomDataStorage
//
//  Created by inagaki on 2016/08/12.
//  Copyright © 2016年 inagaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 画面表示時にデータを格納
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let data = MyData()
        data.valueString = "test"

        // シリアライズ処理
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(data)
        userDefaults.setObject(archiveData, forKey: "data")
        userDefaults.synchronize()

        // デシリアライズ処理
        if let storedData = userDefaults.objectForKey("data") as? NSData {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as? MyData {
                if let valueString = unarchivedData.valueString {
                    print("デシリアライズデータ: " + valueString)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


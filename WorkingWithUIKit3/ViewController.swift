//
//  ViewController.swift
//  WorkingWithUIKit3
//
//  Created by Ника Перепелкина on 08/08/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
        label.textAlignment = .center
        dataPicker.locale = Locale(identifier: "ru_RU")
    }

    @IBAction func changeData(_ sender: UIDatePicker) {
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .full
        // вывод даты на русском языке
        // dataFormatter.locale = Locale(identifier: "ru_RU")
        
        
        let dataValue = dataFormatter.string(from: sender.date)
        // let capitalixedData = dataValue.capitalized
        
        label.text = dataValue
        //label.text = capitalixedData
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        dataPicker.isHidden = !dataPicker.isHidden
        done.isHidden = !done.isHidden
        
        if sender.isOn {
            switchLabel.text = "Отобразить все элементы"
        } else {
            switchLabel.text = "Скрыть все элементы"
        }
        
    }
    
}


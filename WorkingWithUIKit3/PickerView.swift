//
//  PickerView.swift
//  WorkingWithUIKit3
//
//  Created by Ника Перепелкина on 10/08/2019.
//  Copyright © 2019 Nika Perepelkina. All rights reserved.
//

import UIKit

class PickerView: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var countries = ["Canada",
                     "United States",
                     "China",
                     "Russia",
                     "Brazil",
                     "Australia",
                     "India"]
    
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        choiceCountry()
        createToolBar()
    }
    
    func choiceCountry() {
        
        let countryPicker = UIPickerView()
        countryPicker.delegate = self
        textField.inputView = countryPicker
        
        countryPicker.backgroundColor = .white
    }
    
    func createToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Выбрать", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
        
        toolBar.tintColor = .blue
        toolBar.barTintColor = .white
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    // количество барабанов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // количество элементов
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    // отображать в каждой строке PickerView отпеределенные значения
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    // работа с выбранные элементом
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countries[row]
        textField.text = selectedCountry
    }
    
    // работа со свойствами label внутри PickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
    
        pickerViewLabel.textColor = .gray
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleCDGothicNeo-Regular", size: 25)
        pickerViewLabel.text = countries[row]
        
        return pickerViewLabel
    }
}

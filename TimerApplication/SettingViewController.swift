//
//  SettingViewController.swift
//  TimerApplication
//
//  Created by 笹野駿人 on 2019/09/10.
//  Copyright © 2019 hayatosann. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let valueArray : [Int] = [10,30,60,120,180]
    let settingKey = "timerValue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.delegate = self
        timerPicker.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<valueArray.count {
            if valueArray[row] == timerValue {
                timerPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerPicker: UIPickerView!
    
    @IBAction func chooseAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return valueArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(valueArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(valueArray[row], forKey: settingKey)
        settings.synchronize()
    }
}

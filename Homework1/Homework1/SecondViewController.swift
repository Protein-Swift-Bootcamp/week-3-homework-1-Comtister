//
//  SecondViewController.swift
//  Homework1
//
//  Created by Oguzhan Ozturk on 25.12.2022.
//

import Foundation
import UIKit

protocol SecondViewControllerCompletion: AnyObject {
    func completionLifeTime(text: String?)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var data1Field: UITextField!
    @IBOutlet weak var data2Field: UITextField!
    @IBOutlet weak var data3Field: UITextField!
    
    weak var delegate: SecondViewControllerCompletion?
    
    var fieldSetCompleteCompletion: ((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    private func loadUI(){
        data1Field.delegate = self
        data2Field.delegate = self
        data3Field.delegate = self
    }
    
    @IBAction func btnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        delegate?.completionLifeTime(text: data1Field.text)
    }
    
}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField === data2Field {
            fieldSetCompleteCompletion?(textField.text)
        } else {
            NotificationCenter.default.post(name: Notification.Name.textEditCompletion, object: textField.text)
        }
        
    }
    
}

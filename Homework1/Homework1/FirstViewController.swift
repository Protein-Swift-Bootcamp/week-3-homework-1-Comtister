//
//  FirstViewController.swift
//  Homework1
//
//  Created by Oguzhan Ozturk on 25.12.2022.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var data1Field: UILabel!
    @IBOutlet weak var data2Field: UILabel!
    @IBOutlet weak var data3Field: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    private func loadUI() {
        setNotificationOberserver()
    }
    
    private func setNotificationOberserver() {
        
        NotificationCenter.default.addObserver(forName: Notification.Name.textEditCompletion, object: nil, queue: nil, using: { [weak self] notification in
            let text = notification.object as! String
            self?.data3Field.text = text
        })
    }
    
    private func data3FieldCompletion(text: String?){
        data2Field.text = text
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Second") as? SecondViewController else { return }
        vc.delegate = self
        vc.fieldSetCompleteCompletion = data3FieldCompletion
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
        
    }
    
}

extension FirstViewController: SecondViewControllerCompletion {
    
    func completionLifeTime(text: String?) {
        data1Field.text = text
    }
    
}

//
//  AddEvent.swift
//  My Granny
//
// created by Manoj Challagunda
//

import UIKit

class AddEvent: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        bodyField.delegate = self
       
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }else{
            //earlier versions
        }
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func taponSave(_ sender: Any) {
    
    if let titleText = titleField.text, !titleText.isEmpty,
            let bodyText = bodyField.text, !bodyText.isEmpty {
            
            let targetDate = datePicker.date
             
            completion?(titleText, bodyText, targetDate)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

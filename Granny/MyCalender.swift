//
//  MyCalender.swift
//  My Granny
//
// created by Manoj Challagunda
//

import UIKit
import FSCalendar
import UserNotifications

class MyCalender: UIViewController, FSCalendarDelegate {

     @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var table: UITableView!
    
    var models = [MyRemainder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
     performSegue(withIdentifier: "createEvent", sender: true)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? AddEvent else {
            return
        }
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
            
        
        
        self.navigationController?.pushViewController(vc, animated: true)
                
        let new = MyRemainder(title: title, date: date, identifier: "id_\(title)")
        self.models.append(new)
        self.table.reloadData()
    }
            
        }
  
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

extension MyCalender: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MyCalender: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
}

struct MyRemainder {
    let title: String
    let date: Date
    let identifier: String
}


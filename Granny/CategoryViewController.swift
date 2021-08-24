//
//  CategoryViewController.swift
//  My Granny
//
// created by Manoj Challagunda
//

import UIKit
import RealmSwift
import ChameleonFramework


class CategoryViewController: SwipeViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        //tableView.separatorStyle = .none

       
    }
    

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if (categories?[indexPath.row]) != nil{
            
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added"
      
       
                   cell.backgroundColor = FlatSkyBlue()
                   cell.textLabel?.textColor = ContrastColorOf(FlatSkyBlue(), returnFlat: true)
               }
      
    
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    
    func save(category: Category) {
        
        do{
            try realm.write {
                realm.add(category)
            }
        } catch{
            print("Error saving category \(error)")
        }
         
        tableView.reloadData()
        
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
              do {
                  try self.realm.write {
                      self.realm.delete(categoryForDeletion)
                 }
             
                 } catch {
                     print("Error in deleting category, \(error)")
                 }
        }
    }

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
         
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
           
            
           
            self.save(category: newCategory)
            
        
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
    
      
}



//
//  CategoryTableViewController.swift
//  NotifApp2
//
//  Created by Maral on 16.02.22.
//

import UIKit
import RealmSwift



class CategoryTableViewController: SwipeTableViewController {
    
    
    //MARK: - Properties
    
    let k = K()
    let realm  = try! Realm()
    var time: Date?
    var categories: Results<Category>?
    
    
    
    //MARK: - Standard Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    

    
    
    
    
    //MARK: - TableView Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].category ?? "No Categories added yet"
        
        return cell
    }
    
    
    
    
    //MARK: - Buttons Method

    @IBAction func addCategoryPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a New Cateogry", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in

            
            if textField.text != "" {
                
                let newCategory      = Category()
                newCategory.category = textField.text!
                newCategory.freqs    = Int.random(in: 1...10)
                self.save(category: newCategory)
                
            } else {
                
                let alert2     = UIAlertController()
                alert2.title   = "Warning"
                alert2.message = "You should write something"
                let action3    = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                alert2.addAction(action3)
                self.present(alert2, animated: true, completion: nil)
            }
            
        }
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alert.addAction(action)
        alert.addAction(action2)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.segueName, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ItemTableViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    
    
    
    //MARK: - Extra Methods
    
    private func updateTime() {
        time = Date()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    
    
    private func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    private func loadCategories() {
        
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
}

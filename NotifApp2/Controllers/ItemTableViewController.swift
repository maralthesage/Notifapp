//
//  ItemTableViewController.swift
//  NotifApp2
//
//  Created by Maral on 16.02.22.
//

import UIKit
import RealmSwift

class ItemTableViewController: SwipeTableViewController {
    
    
    let k     = K()
    let realm = try! Realm()
    var itemsArray: Results<Item>?
    var selectedCategory: Category? {
        didSet {
            loadItems()
            
        }
    }

    
    //MARK: - Standard Methods for VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedCategory!.category
    }
    
    
    
    
    
    // MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray?.count ?? 1
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = itemsArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    // MARK: - Navigationbar Buttons
    @IBAction func intervalPickerPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "IntervalP", sender: self)
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let currentCat = selectedCategory else { fatalError("couldn't set currentCat") }
        if let intervalVC = segue.destination as? IntervalPicker {
            intervalVC.category = currentCat
        }
         
    }
    
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert     = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action    = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        
                        if  textField.text != "" {
                            let newItem    = Item()
                            newItem.title  = textField.text!
                            currentCategory.items.append(newItem)
                        } else {
                            let alert2     = UIAlertController()
                            alert2.title   = "Warning"
                            alert2.message = "You should write something"
                            let action3    = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                            alert2.addAction(action3)
                            self.present(alert2, animated: true, completion: nil)
                        }
                        
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            self.tableView.reloadData()
        }
        
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action2)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func loadItems() {
        itemsArray = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
    
    
    override func updateModel(at indexPath: IndexPath) {
        
        if let item = itemsArray?[indexPath.row] {
            do {
                try realm.write{
                    realm.delete(item)
                }
            } catch {
                print("Error deleting item, \(error)")
            }
        }
    }

}

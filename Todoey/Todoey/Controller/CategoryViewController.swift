//
//  CategoryViewController.swift
//  Todoey
//
//  Created by owner on 13/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    let realm = try! Realm()
    var itemArray: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
//            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category Item", message: "", preferredStyle: .alert)
               
               let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                   //what will happen once the user clicks the add Item button on our UIAlert
                  
                   
                   if textField.text != "" {
                       let item = Category()
                       item.name = textField.text!
                       item.colour = UIColor.randomFlat().hexValue()
                       self.saveItem(category: item)
                   }
                   
                   
               }
               alert.addTextField { (alertTextField) in
                   alertTextField.placeholder = "Create new item"
                   textField = alertTextField
               }
               
               alert.addAction(action)
               present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView DataSourceMethods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let item = itemArray?[indexPath.row]{
            cell.textLabel?.text = item.name
            cell.backgroundColor = UIColor(hexString: item.colour)
        }else{
             cell.textLabel?.text = "No Categories Added"
        }
       
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = itemArray?[indexPath.row]
        }
    }
    
    
    
    //MARK: - Data Manipulation
    func loadItems(){
        itemArray = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    func saveItem(category: Category){
        do{
            try realm.write{
                realm.add(category)
            }
            self.tableView.reloadData()
        }catch{
            print(error)
        }
     
    }
    
    override func updateModel(at indexPath: IndexPath){
       if let item = self.itemArray?[indexPath.row] {
         do {
               try self.realm.write{
                     self.realm.delete(item)
                   }
             } catch {
                        print(error)
                    }
            }
    }
    
}


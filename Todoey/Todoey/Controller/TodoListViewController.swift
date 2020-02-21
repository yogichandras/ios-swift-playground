//
//  ToDoViewController.swift
//  Todoey
//
//  Created by owner on 12/2/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import ChameleonFramework
class TodoListViewController: SwipeTableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var itemArray : Results<Item>?
    let realm = try! Realm()
    var selectedCategory : Category? {
        didSet{
            loadItems()
        }
    }
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
          
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
       
        //Search DB SQLite File
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let colourHex = selectedCategory?.colour {
            title = selectedCategory!.name
            guard let navBar = navigationController?.navigationBar else {
             fatalError("Navigation controller does not exist")
            }
            navBar.backgroundColor = UIColor( hexString: colourHex)
            searchBar.barTintColor = UIColor( hexString: colourHex)
            searchBar.searchTextField.backgroundColor = FlatWhite()
        }
    }
    
    
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = itemArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
            cell.backgroundColor = UIColor(hexString: item.colour)
        }else{
             cell.textLabel?.text = "No Items Added"
        }
      
        return cell
    }
    
    //MARK: - Tableview Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = itemArray?[indexPath.row] {
            do {
                try realm.write{
                item.done = !item.done
                }
            }catch{
                print(error)
            }
        }

        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    //MARK: - Add New Item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add Item button on our UIAlert
           
            
            if textField.text != "" {
                if let currentCategory = self.selectedCategory {
                  
                    do {
                        try self.realm.write{
                        let item = Item()
                        item.title = textField.text!
                        item.done = false
                        item.dateCreated = Date()
                        item.colour = UIColor.randomFlat().hexValue()
                        currentCategory.items.append(item)
                    }
                        } catch {
                            print(error)
                        }
                }
               
            }
            
            self.tableView.reloadData()
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
//MARK: - Model Manipulation Methods

    func loadItems(){
        itemArray = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
    }
    
    override func updateModel(at indexPath: IndexPath) {
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
    
    //MARK: - SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        itemArray = itemArray?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
        DispatchQueue.main.async {
        searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}




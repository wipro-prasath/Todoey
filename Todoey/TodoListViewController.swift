//
//  ViewController.swift
//  Todoey
//
//  Created by Prasath Srithar on 22/03/2018.
//  Copyright © 2018 Prasath Srithar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController { //tableview controller used here instead of UIcontroller
    
    var itemArray = ["Liverpool","Chelsea","Arsenal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //creates the number of cells in tableview
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", //uses the reuse prototype cell created earlier
            for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        // print(itemArray[indexPath.row]) // when a cell is selected it will print the corresponding cell
    }
    
    
    // MARK - ADD New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField =  UITextField()
        
        let alert = UIAlertController(title: "Add New Todey Item", message: "",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style:  .default) { (action) in
            // what will happend once the user clicked the Add Item button on our UIAlert
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData() // reloads the tableView after data has been appended

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField //alertTextField can now be accessed outside the closure
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}


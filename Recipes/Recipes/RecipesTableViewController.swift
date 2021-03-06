//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Victor  on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import Foundation
import UIKit

class RecipesTableViewController: UITableViewController {
    //array to hold data
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //checking for data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    //configures cells accordingly
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        return cell
    }
    
    //navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            //passes data to detail view controller
            if let destinationVC = segue.destination as? RecipesDetailViewController {
                guard let indexPath = tableView.indexPathForSelectedRow?.row else {return}
                destinationVC.recipe = recipes[indexPath]
                destinationVC.navigationItem.title = "Recipe"
            }
        } else {
            print("no segue")
        }
    }
    
}

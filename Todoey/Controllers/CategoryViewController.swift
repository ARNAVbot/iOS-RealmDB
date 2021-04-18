

import UIKit
import CoreData
import RealmSwift

//inheriting from a parent class
class CategoryViewController: SwipeTableViewController {
    
    var categories : Results<Categoryyy>?
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

        tableView.rowHeight = 80.0
        sayHello()
        
    }
    
    override func sayHello() -> Int {
        let valueReturned = super.sayHello()
        print("In category view controller")
        print("\(valueReturned)")
        return 2
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"

        return cell
    }

    
    //MARK: - Data manipulation methods
    
    func saveCategories(category: Categoryyy) {
        do {
            try realm.write() {
                realm.add(category)
            }
        } catch {
            print("Error in writing \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {

        categories = realm.objects(Categoryyy.self)
        tableView.reloadData()
    }

    
    //MARK: - Add new categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // what will happen once the user clicks the add button on the ui alert
            
            let newCategory = Categoryyy()
            newCategory.name = textField.text!

            self.saveCategories(category: newCategory)
//            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: - Table view Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    // this will be called just before the seague is called
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        // this returns the indexpath which is just selected
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    

}

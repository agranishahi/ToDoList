//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Agrani Shahi on 7/19/21.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousToDoTVC = ToDoTableTableViewController()
    
    @IBOutlet weak var descriptionInput: UITextField!
    
    @IBOutlet weak var switchInput: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
       
        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
             return
             }
        
        let dataFromCoreData = accessToCoreData.persistentContainer.viewContext

   //this line creates an empty object that is the same data type as the ToDoCD entry within Core Data.  This means this object will have all the properties of ToDoCD.
        let newToDo = ToDoCD(context : dataFromCoreData)

   //these lines give the object information from the user input
        newToDo.descriptionInCD = descriptionInput.text
        newToDo.importantInCD = switchInput.isOn

   //This is like clicking "save"! Our new object is now safe in Core Data!
        accessToCoreData.saveContext()

   //this send the user back to the Table View Controller
        navigationController?.popViewController(animated: true)

       /* let newToDo = ToDoClass()
        
        if let checkForInput = descriptionInput.text {
            newToDo.description = checkForInput
            newToDo.important = switchInput.isOn
    }
        previousToDoTVC.listOfToDo.append(newToDo)
        previousToDoTVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        }
*/
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}

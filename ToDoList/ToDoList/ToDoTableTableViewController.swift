//
//  ToDoTableTableViewController.swift
//  ToDoList
//
//  Created by Agrani Shahi on 7/19/21.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {
    var listOfToDo : [ToDoClass] = []
    
    func createToDo() -> [ToDoClass] {

         let swiftToDo = ToDoClass()
         swiftToDo.description = "Learn Swift"
         swiftToDo.important = true

         let dogToDo = ToDoClass()
         dogToDo.description = "Walk the Dog"
         // important is set to false by default

         return [swiftToDo, dogToDo]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfToDo = createToDo()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description
        
        if eachToDo.important {
            cell.textLabel?.text = "❗️" + eachToDo.description
          } else {
            cell.textLabel?.text = eachToDo.description
          }

        // Configure the cell...
        return cell
    }



  

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
                  nextAddToDoVC.previousToDoTVC = self
        }
    }
   

}

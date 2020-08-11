//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Roshni Surpur on 8/10/20.
//  Copyright © 2020 Roshni Surpur. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoClass] = []

    func createToDo() -> [ToDoClass] {

         let swiftToDo = ToDoClass()
         swiftToDo.description = "Walk benji <my dawg>"
         swiftToDo.important = true

         let dogToDo = ToDoClass()
         dogToDo.description = "Do my college hw"
         // important is set to false by default

         return [swiftToDo, dogToDo]
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfToDo = createToDo()

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let eachToDo = listOfToDo[indexPath.row]
//        cell.textLabel?.text = eachToDo.description //Change the textLabel of the cell to the value of the eachToDo.description
        if eachToDo.important {
          cell.textLabel?.text = "❗️" + eachToDo.description
        } else {
          cell.textLabel?.text = eachToDo.description
        }
        

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eachToDo = listOfToDo[indexPath.row]

        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//         // this gives us a single ToDo
//         let eachToDo = listOfToDo[indexPath.row]
//
//         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
             nextAddToDoVC.previousToDoTVC = self
        }
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
             if let choosenToDo = sender as? ToDoClass {
                  nextCompletedToDoVC.selectedToDo = choosenToDo
                nextCompletedToDoVC.previousToDoTVC = self
             }
        }

        //Notice we used VC, short for ViewController in the variable and property names
    }
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}

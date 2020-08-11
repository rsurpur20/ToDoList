//
//  CompletedToDoViewController.swift
//  ToDoList
//
//  Created by Roshni Surpur on 8/10/20.
//  Copyright © 2020 Roshni Surpur. All rights reserved.
//

import UIKit

class CompletedToDoViewController: UIViewController {
    var previousToDoTVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?

    @IBOutlet weak var toDoDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDisplay.text = selectedToDo?.descriptionInCD

//        toDoDisplay.text = selectedToDo.description
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func completeTapped(_ sender: Any) {
        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
           return
        }

        let dataFromCoreData = accessToCoreData.persistentContainer.viewContext

        if let toDo2Delete = selectedToDo {
            dataFromCoreData.delete(toDo2Delete)
            navigationController?.popViewController(animated: true)
        }

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

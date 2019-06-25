//
//  TableViewController.swift
//  Agenda
//
//  Created by DAMII on 15/04/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, DelegateProductTableViewController {
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func donePressed(contact: Contact, position: Int?) {
        
        // En el caso de que se agregue un nuevo contacto
        if (position == nil) {
            contacts.append(contact)
        }
        // En el caso de que se tenga que modificar un contact
        else {
            contacts[position!] = contact
        }
        loadItems()
        dismiss(animated: true, completion: nil)
    }
    
    var contacts = [Contact]()
    
    /*
    var items = [String]()
    var courses = [String]()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    func loadItems() {
        self.tableView.reloadData()
        /*
        // Sección 0
        items.append("Luis")
        items.append("Carlos")
        items.append("Marcos")
        items.append("Isela")
        
        // Sección 1
        courses.append("DAMI")
        courses.append("Portugés")
         */
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Cantidad de secciones
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Cantidad de filas por sección
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return contacts.count
        /*
        switch section {
        case 0:
            return items.count
        default:
            return courses.count
        }
        */
    }

    // Contenido de cada fila por sección
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.initCell(contact: contacts[indexPath.row])
        
        //cell.textLabel!.text = contacts[indexPath.row].name + "\n" + contacts[indexPath.row].telephone
        
        // Configure the cell...
        /*
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = items[indexPath.row]
        default:
            cell.textLabel!.text = courses[indexPath.row]
        }
        */
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Contactos"
        /*
        switch section {
        case 0:
            return "Profesores"
        default:
            return "Cursos"
        }
        */
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            // Actualizar el modelo
            self.contacts.remove(at: indexPath.row)
            
            // Actualizar la vista
            self.tableView.reloadData()
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let nvc = segue.destination as! UINavigationController
        
        let ptvc = nvc.topViewController as! ProductTableViewController
        
        ptvc.delegate = self
        
        if (segue.identifier == "update") {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            let position = indexPath?.row
            
            ptvc.position = position
            ptvc.contact = contacts[position!]
        }
        
    }
    

}

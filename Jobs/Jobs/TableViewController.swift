//
//  TableViewController.swift
//  Jobs
//
//  Created by Jorge Mayta Guillermo on 6/24/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    // Indicador para mostrar que se está cargando la información del servicio
    var indicator = UIActivityIndicatorView()
    
    // Variable que contiene los títulos de los trabajos
    var jobs = [Job]()

    // Barra de búsqueda
    var searchJob = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator()

        // Inicializa la barra de búsqueda
        self.searchJob.placeholder = "Buscar"
        self.searchJob.delegate = self
        self.searchJob.sizeToFit()
        self.navigationItem.titleView = searchJob

    }
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    func loadItems() {
        
        // Comienza la animación del indicador
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.white
        
        var urlString = "https://jobs.github.com/positions.json?description=" + searchJob.text!
        urlString = urlString.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)

        let url = URL(string: urlString)

        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            do {
                self.jobs = [Job]()
                let dictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
                
                for item in dictionary {
                    let job = Job()
                    job.title = item["title"] as? String
                    job.company = item["company"] as? String
                    job.companyLogo = item["company_logo"] as? String
                    job.location = item["location"] as? String
                    job.description = item["description"] as? String
                    job.type = item["type"] as? String
                    
                    self.jobs.append(job)
                }
                DispatchQueue.main.async {
                    // Detiene la animación del indicador
                    self.indicator.stopAnimating()
                    self.indicator.hidesWhenStopped = true
                    
                    // Recarga la tabla
                    self.tableView.reloadData()
                }
                
            }
            catch let jsonError {
                print(jsonError)
            }
        }).resume()
    }

    // MARK: - Searchbar
    // Al comenzar a editar se debe mostrar el botón de cancelar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchJob.showsCancelButton = true
    }
    
    // Acción a ejecutarse cuando la persona presiona el botón search o enter
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadItems()
    }
    
    // Acción a ejecutarse cuando la persona presiona el botón cancel
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchJob.showsCancelButton = false
        self.searchJob.text = ""
        self.searchJob.resignFirstResponder()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jobs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.initCell(job: jobs[indexPath.row])
        // Configure the cell...

        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let indexPath = self.tableView.indexPathForSelectedRow!
        let vc = segue.destination as! ViewController
        vc.job = jobs[indexPath.row]
    }
    

}

//
//  citiesTableViewController.swift
//  citiesAPI from geobytes
//
//  Created by Rama Rai on 2019-05-15.
//  Copyright © 2019 Rama Rai. All rights reserved.
//

import UIKit

class citiesTableViewController: UITableViewController,UISearchBarDelegate,downloaderDelegate {
    func downlaoderDidFinishWithCitiesArray(array: NSArray) {
        allCities = array as! [String]
        tableView.reloadData()
    }
    
   
    var allCities = [String]()
    var myDownloader = downloader()
    
    
//
//    func downlaoderDidFinishWithCitiesArray(array : NSArray) {
//        allCities = array
//        tableView.reloadData()
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myDownloader.delegate = self

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return allCities.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allCities[indexPath.row]
       

        return cell
    }
    
    
    //function to use search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Search for city takes atleast 3 characters
        if searchText.count > 2 {
            
            //City names with space is formatted in url form to replace space with %20
            var mytext = searchText
            mytext = mytext.replacingOccurrences(of: " ", with: "%20")
            myDownloader.getCiyies(city: mytext)
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MasterViewController.swift
//  CacheImage
//
//  Created by NgocAnh on 4/24/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//
import UIKit

class MasterViewController: UITableViewController {
    var filtered: [Meal] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        filtered = DataServices.shared.meals
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filtered.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealTableViewCell
        if cell.photo != nil {
            cell.dateLabel.text = filtered[indexPath.row].dateTime
            cell.photo.download(from: filtered[indexPath.row].photo)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.indexPath = indexPath.row
            }
        }
    }
    @IBAction func addMeals(_ sender: Any) {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE, MMMM, dd, yyyy HH:mm a"
        let getDate = formater.string(from: Date())
        
        let getPhoto = "http://blogcoc.com/wp-content/uploads/2016/03/anh-nen-thien-nhien-4k-thang-4-1.jpg"
        
        
        filtered.append(Meal(dateTime: getDate, photo: getPhoto)!)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
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
            filtered.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
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
    
    
   
    

}

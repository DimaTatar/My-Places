//
//  PlacesListTableViewController.swift
//  My Places
//
//  Created by Дмитрий Татаринцев on 28.12.2021.
//

import UIKit

class PlacesListTableViewController: UITableViewController {
    
    let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai",
        "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy","Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 85

       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showPlace", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantNames[indexPath.row]
        cell.typeLabel.text = restaurantNames[indexPath.row]
        
        cell.imageOfPlace.image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
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

//
//  DetailTableViewController.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/7/18.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
        var area : AreaMO!
    

    @IBOutlet weak var BigImageView: UIImageView!
    
    @IBOutlet weak var ratingBtn: UIButton!

    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BigImageView.image = UIImage(data: area.image as! Data)
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = area.name
        
        if area.rating != nil  {
            
            let rating = area.rating
            self.ratingBtn.setImage(UIImage(named: rating!), for: .normal)

            
        }
        


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetialCell", for: indexPath) as! DetialTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.row {
        case 0:
            
            cell.fieldLable.text = "地名"
            cell.valueLable.text = area.name
        case 1:
            
            cell.fieldLable.text = "省"
            cell.valueLable.text = area.province
            
        case 2:
            
            cell.fieldLable.text = "地区"
            cell.valueLable.text = area.part
            
        case 3:
            
            cell.fieldLable.text = "是否去过"
            cell.valueLable.text = area.isVisited ? "去过" : "没去过"
            
        default:
            break
        }

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 3 {
            
            let menu = UIAlertController(title: "提示", message: area.isVisited ? "去过" : "没去过", preferredStyle: .actionSheet)
            
            let option = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            menu.addAction(option)
            
            self.present(menu, animated: true, completion: nil)
            
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMap" {
            let destVC = segue.destination as! MapViewController
            destVC.area = self.area
        }

    }
 
    
    @IBAction func close (segue: UIStoryboardSegue){
        let reviewVC = segue.source as! ReviewViewController
        
        if let rating = reviewVC.rating{
            self.area.rating = rating
            self.ratingBtn.setImage(UIImage(named: rating), for: .normal)
        }
        
        
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
        
    }

}

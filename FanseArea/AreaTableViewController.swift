//
//  AreaTableViewController.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/6/27.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit
import CoreData

class AreaTableViewController: UITableViewController,NSFetchedResultsControllerDelegate,UISearchResultsUpdating{
    
    var sc : UISearchController!
    
    var areas : [AreaMO] = []
    
    //搜索用数组
    
    var searchResult:[AreaMO] = []
    
    func searchFilter(text:String){
        
        searchResult = areas.filter({ (area) -> Bool in
            return area.name!.localizedCaseInsensitiveContains(text)
        })
    }
    
    
    var fc: NSFetchedResultsController<AreaMO>!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if var text = searchController.searchBar.text{
            text = text.trimmingCharacters(in: .whitespaces)
            searchFilter(text:text)
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        tableView.tableHeaderView = sc.searchBar
        sc.dimsBackgroundDuringPresentation = false
        
        sc.searchBar.placeholder = "输入地区名进行搜索…"
        
        sc.searchBar.searchBarStyle = .minimal
        
        
        //searchbar颜色设置
//        sc.searchBar.tintColor = UIColor.white
//        sc.searchBar.barTintColor = UIColor(red: 40/255, green: 106/255, blue: 253, alpha: 1)
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        fetchData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {//只显示一次
        super.viewDidAppear(animated)
        
        
        //fetchALLData()
        // tableView.reloadData()
        
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "GuiderShow"){
            return
        }
        
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "GuideController") as? GuiderViewController{
            present(pageVC, animated: true, completion: nil)
        }
    }
    
    
    
    
    //全部数据刷新方法 效率低
//    func fetchALLData(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        do {
//            areas =  try appDelegate.persistentContainer.viewContext.fetch(AreaMO.fetchRequest())
//        } catch {
//            print(error)
//        }
//    }
    
    //局部数据刷新
    func fetchData(){
        let request : NSFetchRequest<AreaMO> = AreaMO.fetchRequest()
        let sd = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sd]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        fc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fc.delegate = self
        
        do {
            try fc.performFetch()
            if let object = fc.fetchedObjects{
                areas = object
            }
        } catch {
            print(error)
        }
        
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        default:
            tableView.reloadData()
        }
        
        if let object = controller.fetchedObjects{
            areas = object as! [AreaMO]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    /*
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let menu = UIAlertController(title: "提示", message: "您点击了第\(indexPath.row)行", preferredStyle: .actionSheet)
        
        //let option1 = UIAlertAction(title: "确定", style: .default, handler: nil)
        let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        let uititle = self.visited[indexPath.row] ? "我没去过":"我去过"
        
        
        
        let option3 = UIAlertAction(title: uititle, style: .destructive) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
    
            
            if(self.visited[indexPath.row] == false){
                cell?.accessoryType = .checkmark
                self.visited[indexPath.row] = true
            }else{
                cell?.accessoryType = .none
                self.visited[indexPath.row] = false
            }
        

        }


        
        //menu.addAction(option1)
        menu.addAction(option2)
        menu.addAction(option3)

        
        self.present(menu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    */
    
    
    //右滑操作
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title:"分享", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let optionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(optionCancel)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        
        actionShare.backgroundColor = UIColor.orange;
        
        let actionDel = UITableViewRowAction(style: .default, title: "删除") { (_, indexPath) in
            //self.areas.remove(at: indexPath.row)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            context.delete(self.fc.object(at: indexPath))
            
            appDelegate.saveContext()
            
            
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, _) in
            
        }
        actionTop.backgroundColor = UIColor(colorLiteralRed: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        
        return [actionDel,actionShare,actionTop]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sc.isActive ? searchResult.count : areas.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!CustomTableViewCell
        
        let area = sc.isActive ? searchResult[indexPath.row] : areas[indexPath.row]

        cell.nameLable?.text = area.name
        cell.provinceLable?.text = area.province
        cell.partLable?.text = area.part
        
        
        cell.thumbImageView?.image = UIImage(data: area.image as! Data)
        
        cell.thumbImageView.layer.cornerRadius = 5
        //设置图片为圆形
        //cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.width/2
        
        cell.thumbImageView.clipsToBounds = true
        
        
        cell.accessoryType =  area.isVisited ? .checkmark:.none
        

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return !sc.isActive
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.areas.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
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
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showAreaDetail"{
            
            let dest = segue.destination as! DetailTableViewController
            dest.hidesBottomBarWhenPushed = true
            //tableView.indexPathForSelectedRow!.row
            dest.area = sc.isActive ? searchResult[tableView.indexPathForSelectedRow!.row] : areas[tableView.indexPathForSelectedRow!.row]
            
        }
 
    
    }
    
    

}

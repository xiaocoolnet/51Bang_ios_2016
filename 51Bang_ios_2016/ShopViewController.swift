//
//  ShopViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerNib(UINib(nibName: "ShopTableViewCell",bundle: nil), forCellReuseIdentifier: "cell")
        myTableView.rowHeight = WIDTH*80/375

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!ShopTableViewCell
        
        cell.selectionStyle = .None
        cell.title.text = "风景自助"
        cell.context.text = "你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。"
        cell.price.text = "¥49.00"
        cell.oldPrice.text = "60.00"
        cell.distance.text = "1.1km"
        cell.sales.text = "已售1241"
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let next = BusnissViewController()
        self.navigationController?.pushViewController(next, animated: true)
        next.title = "风景自助"
        
    }
    
    @IBAction func goToMenu(sender: AnyObject) {
        print("菜单")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MenuView")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.title = "菜单"
        
    }
    @IBAction func goToAdd(sender: AnyObject) {
        print("增加")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AddView")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.title = "添加"
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

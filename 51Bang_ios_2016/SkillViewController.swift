//
//  SkillViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.backgroundColor = RGREY
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .None
        myTableView.registerNib(UINib(nibName: "OneTableViewCell",bundle: nil), forCellReuseIdentifier: "One")
        myTableView.registerNib(UINib(nibName: "TwoTableViewCell",bundle: nil), forCellReuseIdentifier: "Two")
        myTableView.registerNib(UINib(nibName: "ThreeTableViewCell",bundle: nil), forCellReuseIdentifier: "Three")
        myTableView.registerNib(UINib(nibName: "HousekeepingTableViewCell",bundle: nil), forCellReuseIdentifier: "House")
        myTableView.registerNib(UINib(nibName: "FoveTableViewCell",bundle: nil), forCellReuseIdentifier: "Fove")
        myTableView.registerNib(UINib(nibName: "PetTableViewCell",bundle: nil), forCellReuseIdentifier: "Pet")
        myTableView.registerNib(UINib(nibName: "SevenTableViewCell",bundle: nil), forCellReuseIdentifier: "Seven")
        myTableView.registerNib(UINib(nibName: "MarriageTableViewCell",bundle: nil), forCellReuseIdentifier: "Marriage")
        
        let bottom = UIView(frame: CGRectMake(0, 0, WIDTH, 120))
        let btn = UIButton(frame: CGRectMake(15, 30, WIDTH-30, 50))
        btn.layer.cornerRadius = 8
        btn.setTitle("下一步", forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.backgroundColor = COLOR
        btn.addTarget(self, action: #selector(self.nextToView), forControlEvents: .TouchUpInside)
        bottom.addSubview(btn)
        myTableView.tableFooterView = bottom
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 210
        }else if indexPath.section == 1 {
            return 210
        }else if indexPath.section == 2 {
            return 210
        }else if indexPath.section == 3 {
            return 165
        }else if indexPath.section == 4 {
            return 345
        }else if indexPath.section == 5 {
            return 165
        }else if indexPath.section == 6 {
            return 210
        }else{
            return 120
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("One", forIndexPath: indexPath)as!OneTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Two", forIndexPath: indexPath)as!TwoTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Three", forIndexPath: indexPath)as!ThreeTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("House", forIndexPath: indexPath)as!HousekeepingTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Fove", forIndexPath: indexPath)as!FoveTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Pet", forIndexPath: indexPath)as!PetTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Seven", forIndexPath: indexPath)as!SevenTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("Marriage", forIndexPath: indexPath)as!MarriageTableViewCell
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }
        
    }
    func nextToView() {
        print("立即提交")
        
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

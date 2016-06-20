//
//  MineViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let top = UIView()
    let myTableView = UITableView()
    let foot:[String] = ["我是买家","我是卖家","",""]
    let team:[String] = ["我的发单","我的优惠券","我的订单","我的收藏","我的购物车","分享送红包"]
    let teamImg:[String] = ["ic_wodefadan","ic_youhuiquan","ic_wodedingdan","wodeshoucang","ic_wodegouwuche","ic_fenxiang"]
    
    let busness:[String] = ["我的接单","我的投保"]
    let busnissImg:[String] = ["ic_wodejiedan","ic_woyaotoubao"]
    
    let benApp:[String] = ["客服咨询","更多服务"]
    let benImg:[String] = ["ic_kefuzixun","ic_gengduofuwu"]
    
    let labArr:[String] = ["钱包","签到","消息"]
    let labImg:[String] = ["ic_qianbao","ic_qiandao","ic_xiaoxi"]
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        self.tabBarController?.tabBar.hidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        top.frame = CGRectMake(0, -50, WIDTH, 100)
        top.backgroundColor = COLOR
        self.view.addSubview(top)
        
        myTableView.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake( 0, 0, WIDTH, HEIGHT-49)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.registerNib(UINib(nibName: "MineTableViewCell",bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        self.view.addSubview(myTableView)
        

        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return team.count
        }else if section == 2 {
            return busness.count
        }else{
            return benApp.count
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return WIDTH*172/375
        }else{
            return WIDTH*44/375
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }else if section == 1 {
            return 30
        }else{
            return 10
        }
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        let footTit = UILabel(frame: CGRectMake(10, 5, 80, 20))
        footTit.text = foot[section]
        footTit.font = UIFont.systemFontOfSize(12)
        footTit.textColor = UIColor.grayColor()
        view.addSubview(footTit)
        
        return view
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)as!MineTableViewCell
        cell.selectionStyle = .None
        
        if indexPath.section == 0 {
            let top = UIView(frame: CGRectMake(0, 0, WIDTH, WIDTH*126/375))
            top.backgroundColor = COLOR
            cell.addSubview(top)
            for i in 0...2 {
                let lab = UILabel(frame: CGRectMake(WIDTH*20/375+CGFloat(i)*(WIDTH/3), WIDTH*126/375, WIDTH/3-WIDTH*20/375, WIDTH*46/375))
                lab.text = labArr[i]
                lab.textAlignment = .Center
                lab.font = UIFont.systemFontOfSize(14)
                cell.addSubview(lab)
                let line = UILabel(frame: CGRectMake(CGFloat(i)*WIDTH/3+WIDTH/3, WIDTH*134/375, 1, WIDTH*30/375))
                line.backgroundColor = RGREY
                cell.addSubview(line)
                let img = UIImageView(frame: CGRectMake(WIDTH*33/375+CGFloat(i)*(WIDTH/3), WIDTH*140.5/375, WIDTH*18/375, WIDTH*17/375))
                img.image = UIImage(named: labImg[i])
                cell.addSubview(img)
                let btn = UIButton(frame: CGRectMake(CGFloat(i)*WIDTH/3, WIDTH*126/375, WIDTH/3, WIDTH*46/375))
                btn.addTarget(self, action: #selector(self.labTheButton(_:)), forControlEvents: .TouchUpInside)
                btn.tag = i
                cell.addSubview(btn)
                
            }
            
            
        }else if indexPath.section == 1{
            cell.mineFunction.text = team[indexPath.row]
            cell.mineImg.image = UIImage(named: teamImg[indexPath.row])
        }else if indexPath.section == 2{
            cell.mineFunction.text = busness[indexPath.row]
            cell.mineImg.image = UIImage(named: busnissImg[indexPath.row])
        }else{
            cell.mineFunction.text = benApp[indexPath.row]
            cell.mineImg.image = UIImage(named: benImg[indexPath.row])
        }
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if indexPath.section == 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("\(indexPath.row+1)View")
            self.navigationController?.pushViewController(vc, animated: true)
            vc.title = team[indexPath.row]

        }else if indexPath.section == 2 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Mai\(indexPath.row+1)View")
            self.navigationController?.pushViewController(vc, animated: true)
            vc.title = busness[indexPath.row]
        }else if indexPath.section == 3 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Ben\(indexPath.row+1)View")
            self.navigationController?.pushViewController(vc, animated: true)
            vc.title = benApp[indexPath.row]
        }
        
        
    }
    func labTheButton(btn:UIButton) {
        print(btn.tag)
        
        
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

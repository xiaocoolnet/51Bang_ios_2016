//
//  CertificationViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class CertificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGREY
        
        myTableView.backgroundColor = RGREY
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerNib(UINib(nibName: "IdentityTableViewCell",bundle: nil), forCellReuseIdentifier: "cell")
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Indentity")
        myTableView.registerNib(UINib(nibName: "IdentityPicTableViewCell",bundle: nil), forCellReuseIdentifier: "picture")
        myTableView.registerNib(UINib(nibName: "DrivingLicenseTableViewCell",bundle: nil), forCellReuseIdentifier: "Driving")
        myTableView.separatorStyle = .None
        
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
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 3
        }else{
            return 1
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return WIDTH*40/375
            }else if indexPath.row == 1 {
                return WIDTH*125/375
            }else{
                return WIDTH*135/375
            }
        }else{
            return WIDTH*135/375
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 0
        }else{
            return 10
        }
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!IdentityTableViewCell
            cell.selectionStyle = .None
            return cell
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("Indentity", forIndexPath: indexPath)
                cell.selectionStyle = .None
                cell.textLabel?.font = UIFont.systemFontOfSize(12)
                cell.textLabel?.textColor = UIColor(red: 1, green: 59/255.0, blue: 0, alpha: 1.0)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.text = "＊手持身份证正面照，靠近镜头正面拍摄胸部以上，保证身份证上面文字清晰可见"
                return cell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCellWithIdentifier("picture", forIndexPath: indexPath)as!IdentityPicTableViewCell
                cell.selectionStyle = .None
                cell.Driving.setBackgroundImage(UIImage(named: "手持身份证"), forState: .Normal)
                cell.Camera.addTarget(self, action: #selector(self.goToCamera), forControlEvents: .TouchUpInside)
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("Driving", forIndexPath: indexPath)as!DrivingLicenseTableViewCell
                cell.selectionStyle = .None
                cell.Driving.setBackgroundImage(UIImage(named: "身份证正面"), forState: .Normal)
                cell.Camera.addTarget(self, action: #selector(self.goToCamera), forControlEvents: .TouchUpInside)
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("Driving", forIndexPath: indexPath)as!DrivingLicenseTableViewCell
            cell.selectionStyle = .None
            cell.Camera.addTarget(self, action: #selector(self.goToCamera), forControlEvents: .TouchUpInside)
            return cell
        }
        
        
    }
    func goToCamera() {
        print("打开相机")
        //                调用相机
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            self.presentViewController(picker, animated: true, completion: { () -> Void in
                //如果有前置摄像头则调用前置摄像头
                //                        if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front){
                //                            picker.cameraDevice = UIImagePickerControllerCameraDevice.Front
                //                        }
                //开启闪光灯
                picker.cameraFlashMode = UIImagePickerControllerCameraFlashMode.On
            })
        }else{
            print("找不到相机")
        }
        
    }
    func nextToView() {
        print("下一步")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SkillView")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.title = "技能选择"
        
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

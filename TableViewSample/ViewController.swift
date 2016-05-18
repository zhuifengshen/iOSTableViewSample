//
//  ViewController.swift
//  TableViewSample
//
//  Created by 张楚昭 on 16/5/17.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //球队
    var listTeams:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        print(self.listTeams)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDataSource 协议方法
    //返回某个节中的行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.listTeams.count
    }
    //为表视图单元格提供数据
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "CellIdentifier"
//        纯代码重用单元格
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)  //.Default .Subtitle .Value1 .Value2 单元格四种样式
        }
//        视图中指定重用单元格
//        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        let rowDict = self.listTeams[row] as! NSDictionary
//        print(rowDict)
        cell.textLabel?.text = rowDict["name"] as? String
        let imagePath = NSString(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath as String)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator//.Checkmark//.DetailButton//.DetailDisclosureButton 扩展视图四种类型
        return cell
    }

}


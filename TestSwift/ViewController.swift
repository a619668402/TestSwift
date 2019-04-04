//
//  ViewController.swift
//  TestSwift
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var dataSource : [String] = {
        return ["1", "2"];
    }();
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self));
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: NSStringFromClass(UITableViewCell.self));
        }
        cell?.textLabel?.text = self.dataSource[indexPath.row];
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        var vc : Any?;
        switch indexPath.row {
        case 0:
            vc = TestBasicController();
            break
        default:
            break
        }
        if vc == nil {
            return;
        }
        self.navigationController?.pushViewController(vc! as! UIViewController, animated: true);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: CGRect.init(x: 0, y: self.navigationController?.navigationBar.frame.size.height ?? 44 + UIApplication.shared.statusBarFrame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - (self.navigationController?.navigationBar.frame.size.height ?? 44 + UIApplication.shared.statusBarFrame.size.height)), style: UITableView.Style.plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        if #available(iOS 10.0.0, *) {
            tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.automatic;
        } else {
           self.automaticallyAdjustsScrollViewInsets = false;
        }
        tableView.tableFooterView = UIView.init();
        self.view.addSubview(tableView);
    }

    
}


//
//  NotificationsViewController.swift
//  GeekPark
//
//  Created by ScorpiusZ on 16/3/28.
//  Copyright © 2016年 GeekPark. All rights reserved.
//

import UIKit
class NotificationsViewController: DetailViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var notificationGroup: NotificationGroup?
  var notifications = [Notification]() {
    didSet{
      tableView.reloadData()
      if notifications.isEmpty {
        onDataEmpty()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func setupViews(){
    navigationItem.title = notificationGroup?.title
    setupTable()
  }
  
  func setupTable(){
    tableView.dataSource = self
    tableView.delegate = self
    Notification.list(notificationGroup?.type ?? .System ){ notifications in
      self.notifications = notifications
    }
  }
  
}

extension NotificationsViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return notificationGroup?.type == .System ? 180 : 270
  }
  
}

extension NotificationsViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notifications.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let notification = notifications[indexPath.row]
    let cell = tableView.dequeueReusableCellWithIdentifier(notification.cellType) as! NotificationBaseCell
    cell.notification = notification
    return cell
  }
}

//
//  InfiniteImageLoopCellTableViewCell.swift
//  GeekPark
//
//  Created by 朱坤 on 3/21/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

class ImageLoopTableViewCell: UITableViewCell {

  @IBOutlet weak var pageControl: UIPageControl!
  
  var topics = [Topic]() {
    didSet {
      collectionView.reloadData()
    }
  }
  @IBOutlet weak var collectionView: UICollectionView!
  
  func setData(topics: [Topic]){
    self.topics = topics
    setUpCollectionView()
    //让pageControl显示
    pageControl.layer.zPosition = 1
    pageControl.numberOfPages = topics.count
  }
  
  private func setUpCollectionView(){
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.contentSize = CGSize(width: CGFloat(topics.count) * frame.width, height: frame.height)
    collectionView.pagingEnabled = true
  }
  
}

extension ImageLoopTableViewCell: UICollectionViewDelegate{
  
}

extension ImageLoopTableViewCell: UICollectionViewDataSource{
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return topics.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCollectionViewCell", forIndexPath: indexPath) as! ImageCollectionViewCell
    cell.topic = topics[indexPath.row]
    pageControl.currentPage = indexPath.row
    return cell
  }
}

extension ImageLoopTableViewCell: UICollectionViewDelegateFlowLayout{
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: frame.width, height: frame.height)
  }
  
  func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }
}

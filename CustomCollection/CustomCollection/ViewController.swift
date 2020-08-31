//
//  ViewController.swift
//  CustomCollection
//
//  Created by Hoang Tung Lam on 8/31/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CustomLayoutDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // mảng hình ảnh
    var arrayImages = ["1","2","3","4","5","6"]
                
    // mảng mô tả
    var arrayDes = [("Kevin Murphy, head of 1 WTC’s ironworkers"),("OH MY VENUS"),
    ("Neon là nguyên tố hóa học trong bảng tuần hoàn nguyên tố có ký hiệu Ne và số nguyên tử bằng 10, nguyên tử khối bằng 20."),("Today we’re taking a peek at the latest update to Zoom video conferencing and the ways in which one might make their background as awesome as possible."),("FallenSouls - Dragon Battle"),("Snake Eyes 653TH")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        setupCollectionViewItemSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ItemCell")
    }
    
    private func setupCollectionViewItemSize() {
        let customLayout = CustomCell()
        customLayout.delegate = self
        collectionView.collectionViewLayout = customLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.imgImage.image = UIImage(named: arrayImages[indexPath.row])
        cell.lblDes.text = arrayDes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: arrayImages[indexPath.row])!.size
    }
    
}




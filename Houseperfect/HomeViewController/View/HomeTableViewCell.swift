//
//  HomeTableViewCell.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

protocol HomeCellViewClickedDelegate {
    func onCellClicked();
}

class HomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    let nibNameFeatured = "FeaturedCollectionViewCell"
    let nibNameNormal = "HomeCollectionViewCell"
    
    let featuredIdentifier = "HomeFeaturedCollectionViewCell"
    let normalIdentifier = "HomeCollectionViewCell"
    
    @IBOutlet weak var lblTitleForCellView: UILabel!
    @IBOutlet weak var lblMoreButtonForCellView: UILabel!
    @IBOutlet weak var collectionViewForCell: UICollectionView!
    
    private var featured: Bool!
    private var cellData: [HomeModel]!
    
    private var delegate: HomeCellViewClickedDelegate!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewForCell.register(UINib(nibName: nibNameFeatured, bundle: nil), forCellWithReuseIdentifier: featuredIdentifier)
        collectionViewForCell.register(UINib(nibName: nibNameNormal, bundle: nil), forCellWithReuseIdentifier: normalIdentifier)
//        self.collectionViewForCell.collectionViewLayout.invalidateLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCellView(data: HomePageData, delegate: HomeCellViewClickedDelegate){
        self.lblTitleForCellView.text = data.label
        self.featured = data.featured
        self.cellData = data.data
        self.collectionViewForCell.reloadData()
        
        self.delegate = delegate
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = cellData{
            return data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if featured{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredIdentifier, for: indexPath) as! HomeCollectionViewCell
            
            cell.initCellView(home: cellData[indexPath.row], featured: featured)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalIdentifier, for: indexPath) as! HomeCollectionViewCell
            
            cell.initCellView(home: cellData[indexPath.row], featured: featured)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if featured{
            return CGSize(width: 150, height: 216)
        }
        
        return CGSize(width: 318, height: 300)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("here it is clicked")
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let vc = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as DetailViewController
////        navigationController?.pushViewController(vc, animated: true)
//        delegate.onCellClicked()
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.onCellClicked()
    }
}

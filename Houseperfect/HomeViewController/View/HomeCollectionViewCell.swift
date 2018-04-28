//
//  HomeFeaturedCollectionViewCell.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameOfTheApartment: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblOtherInformation: UILabel!
    
    func initCellView(home: HomeModel, featured: Bool){
        if !featured{
            self.nameOfTheApartment.text = home.name
        }
        //image view to be done
        self.lblRate.text = formatRate(home.rate, featured)
        self.lblAddress.text = home.location
//        self.lblOtherInformation.text = home.bedRoom + "bedRoom " + home.restRoom + "restroom "
        self.lblOtherInformation.attributedText = formatOtherInformation(bed: home.bedRoom, restroom: home.restRoom, area: home.area)
    }
    
    private func formatRate(_ rate: String, _ featured: Bool) -> String {
        if featured{
             return "Rs " + rate + " per month"
        }
        return "Rs " + rate + " /m"
    }
    
    private func formatOtherInformation(bed: String, restroom: String, area: String) -> NSAttributedString {
        
        //Create Attachment
        let imageAttachmentBed =  NSTextAttachment()
        imageAttachmentBed.image = UIImage(named:"bed")
        imageAttachmentBed.bounds = CGRect(x: 0, y: 0, width: 10, height: 10 )
        
        let imageAttachmentRestRoom =  NSTextAttachment()
        imageAttachmentRestRoom.image = UIImage(named:"restroom")
        imageAttachmentRestRoom.bounds = CGRect(x: 0, y: 0, width: 10, height: 10 )
        
        let imageAttachmentArea =  NSTextAttachment()
        imageAttachmentArea.image = UIImage(named:"area")
        imageAttachmentArea.bounds = CGRect(x: 0, y: 0, width: 10, height: 10 )
        
        //Create string with attachment
        let attachmentStringBed = NSAttributedString(attachment: imageAttachmentBed)
        let attachmentStringRestRoom = NSAttributedString(attachment: imageAttachmentRestRoom)
        let attachmentStringArea = NSAttributedString(attachment: imageAttachmentArea)
        
        //Add image to mutable string
        
        let  textAfterBedIcon = NSMutableAttributedString(string: " " + bed)
        let  textAfterRestRoomIcon = NSMutableAttributedString(string: " " + restroom)
        let  textAfterAreaIcon = NSMutableAttributedString(string: " " + area + " sqft")
        let textForSpace = NSMutableAttributedString(string: "   ")
        
        let completeText = NSMutableAttributedString(string: "")
        
        completeText.append(attachmentStringBed)
        completeText.append(textAfterBedIcon)
        completeText.append(textForSpace)
        
        completeText.append(attachmentStringRestRoom)
        completeText.append(textAfterRestRoomIcon)
        completeText.append(textForSpace)
        
        completeText.append(attachmentStringArea)
        completeText.append(textAfterAreaIcon)
        
        return completeText
    }
}

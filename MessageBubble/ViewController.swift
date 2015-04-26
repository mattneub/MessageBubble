

import UIKit

/*

Showing how a UILabel in front of an image view can serve as a message bubble

The key points are:

* The image of the speech balloon is resizable

* In the storyboard, the image view's compression resistance
  is lower than the label's content hugging

*/

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(250,200), false, 0)
        let con = UIGraphicsGetCurrentContext()
        
        let p = UIBezierPath(roundedRect: CGRectMake(0,0,250,180), cornerRadius: 10)
        p.moveToPoint(CGPointMake(20,180))
        p.addLineToPoint(CGPointMake(20,200))
        p.addLineToPoint(CGPointMake(30,180))
        CGContextAddPath(con, p.CGPath)
        UIColor.blueColor().setFill()
        CGContextFillPath(con)
        
        let im = UIGraphicsGetImageFromCurrentImageContext()
        let im2 = im.resizableImageWithCapInsets(UIEdgeInsetsMake(10, 35, 35, 10), resizingMode: .Stretch)
        UIGraphicsEndImageContext()
        self.iv.image = im2
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.lab.text = textField.text
        textField.resignFirstResponder()
        return true
    }



}


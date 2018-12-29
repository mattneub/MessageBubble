

import UIKit

/*

Showing how a UILabel in front of an image view can serve as a message bubble

The key points are:

* The image of the speech balloon is resizable

* In the storyboard, the image view's compression resistance
  is lower than the label's content hugging

*/

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
extension CGSize {
    init(_ width:CGFloat, _ height:CGFloat) {
        self.init(width:width, height:height)
    }
}
extension CGPoint {
    init(_ x:CGFloat, _ y:CGFloat) {
        self.init(x:x, y:y)
    }
}
extension CGVector {
    init (_ dx:CGFloat, _ dy:CGFloat) {
        self.init(dx:dx, dy:dy)
    }
}



class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var lab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(250,200), false, 0)
        let con = UIGraphicsGetCurrentContext()!
        
        let p = UIBezierPath(roundedRect: CGRect(0,0,250,180), cornerRadius: 10)
        p.move(to: CGPoint(20,180))
        p.addLine(to: CGPoint(20,200))
        p.addLine(to: CGPoint(30,180))
        con.addPath(p.cgPath)
        UIColor.blue.setFill()
        con.fillPath()
        
        let im = UIGraphicsGetImageFromCurrentImageContext()!
        let im2 = im.resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 35, bottom: 35, right: 10), resizingMode: .stretch)
        UIGraphicsEndImageContext()
        self.iv.image = im2
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.lab.text = textField.text
        textField.resignFirstResponder()
        return true
    }



}




import UIKit

class ViewController: UIViewController {

    // Interface builder outlet (a way to access/reference this particular UI element)
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change diceImg1 to diceImg6
        diceImageView1.image = UIImage(named: "DiceSix")
        // diceImageView1.alpha = 0.5
        
        // Who        //What        Value
        diceImageView2.image = UIImage(named: "DiceTwo")
        
        
    }


}


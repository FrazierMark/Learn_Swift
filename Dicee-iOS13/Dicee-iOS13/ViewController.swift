

import UIKit

class ViewController: UIViewController {

    // Interface builder outlet (a way to access/reference this particular UI element)
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
   
    
    // Block of code runs when app is loaded
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    // Interface Builder Action/Function
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageView1.image = [
            UIImage(named: "DiceOne"),
            UIImage(named: "DiceTwo"),
            UIImage(named: "DiceThree"),
            UIImage(named: "DiceFour"),
            UIImage(named: "DiceFive"),
            UIImage(named: "DiceSix")
        ][Int.random(in: 0...5)]
        
        diceImageView2.image = [
            UIImage(named: "DiceOne"),
            UIImage(named: "DiceTwo"),
            UIImage(named: "DiceThree"),
            UIImage(named: "DiceFour"),
            UIImage(named: "DiceFive"),
            UIImage(named: "DiceSix")
        ][Int.random(in: 0...5)]
        
    }
}


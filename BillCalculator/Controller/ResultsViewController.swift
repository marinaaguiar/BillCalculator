//
//  ResultsViewController.swift
//  BillCalculator
//
//  Created by Marina Aguiar on 4/27/21.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    @IBOutlet weak var recalculateButton: UIButton!
    
    
    var people: Int = 0
    var tip: Int = 0
    var totalPerPerson: Double = 0

    override func viewWillAppear(_ animated: Bool) {
        let totalString = String(format: "%.2f", totalPerPerson)
        let peopleString = people == 1 ? "person" : "people"
        let tipString = "Split between \(people) \(peopleString), with \(tip)% tip."
        
        totalLabel.text = totalString
        settingLabel.text = tipString
        
        //make rounded button
        super.viewWillAppear(animated)
        makeViewRound(view: recalculateButton)
        
    }
    
    func makeViewRound(view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

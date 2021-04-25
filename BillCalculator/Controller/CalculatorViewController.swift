//
//  ViewController.swift
//  BillCalculator
//
//  Created by Marina Aguiar on 4/25/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var billCalculator = BillCalculator()
    
    /// The bill amount represented as a floating point value
    var amount: Double = 0
    
    /// The percentage of the bill that we'll add as a tip,
    /// represented as the integer value
    /// (e.g. 10 for 10%, 11 for 11% and so on).
    var tip: Double = 10 {
        didSet {
            percentageSliderLabel.text = "\(Int(tip))%"
        }
    }
        
    /// The number of people we'll divide the bill by.
    var people: Int = 1 {
        didSet {
            peopleNumber.text = "\(Int(people))"
        }
    }
    
    var totalPerPerson: Double = 0

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var percentageSliderLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var peopleNumber: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    //make rounded button
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeViewRound(view: calculateButton)
    }
    
    func makeViewRound(view: UIView) {
        
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextField.text = ""
        percentageSlider.value = Float(tip)
        percentageSliderLabel.text = "\(tip)%"
        stepper.value = Double(people)
        peopleNumber.text = "\(people)"
        
        //hide keyboard      
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)
        }

        @objc func dismissKeyboard() {
            view.endEditing(true)
        
    }
  
    @IBAction func percentageSliderValueChanged(_ sender: UISlider) {
        
        let tipValue = Double(percentageSlider.value).rounded(.towardZero)
        tip = tipValue
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {

        people = Int(sender.value.rounded(.towardZero))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // If empty, consider text to be "0.0";
        // if cast to Double fails, consider conversion
        // to be 0.
        
        
        let amount = Double(amountTextField.text ?? "0.0") ?? 0.0
    
        let splitBill = billCalculator
            .calculateBill(amount: amount, tip: Int(tip), people: people)
        
        totalPerPerson = splitBill
        
        print(splitBill)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue", let controller = segue.destination as? ResultsViewController {
            controller.people = self.people
            controller.tip = Int(self.tip)
            controller.totalPerPerson = totalPerPerson
        }
    }
    
}


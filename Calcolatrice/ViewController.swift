//
//  ViewController.swift
//  Calcolatrice
//
//  Created by Fabio Luccon on 12/01/15.
//  Copyright (c) 2015 Fabio Luccon. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var firstOperation = true //flag set true if it is the first button you press
    var operationAlreadySet = false //flag to indicate if you have already set the operator (+ - x /)
    var readyForOperation = false //flag to indicate if all fields are ready to the operation
    var firstOperandReady = false //flag to indicate if the first operand is already set
    var secondOperandReady = false //flag to indicate if the second operand is already set
    var sciuar = false
    
    var firstOp = 0 //variable to save the first operand
    var secondOp = 0 //variable to save the second operand
    var op = "" //variable to save the operator (+ - x /)
    
    
    //Labels
    
    @IBOutlet var firstOperand : UILabel!
    @IBOutlet var secondOperand : UILabel!
    @IBOutlet var operation : UILabel!
    @IBOutlet var result : UILabel!
    
    //numbers
    
    @IBOutlet var zero : UIButton!
    @IBOutlet var one : UIButton!
    @IBOutlet var two : UIButton!
    @IBOutlet var three : UIButton!
    @IBOutlet var four : UIButton!
    @IBOutlet var five : UIButton!
    @IBOutlet var six : UIButton!
    @IBOutlet var seven : UIButton!
    @IBOutlet var eight : UIButton!
    @IBOutlet var nine : UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func InsertNumber(sender : UIButton) //sender is the button you've pushed
    {
        var tag = sender.tag //tags are assigned to numbers in order (for 0 tag is 250, for 1 tag is 251 ...)
        tag -= 250 //with this intruction you can extract the number pressed
        
        //before inserting the operation you have to set the first operand
        
        if !operationAlreadySet
        {
        
            if (tag == 0) && (firstOperation)
            {
                firstOperandReady = true
                sciuar = true
                return
            }
            else if firstOperation
            {
                firstOperand.text = toString(tag)
                firstOperation = false
                firstOperandReady = true
                return
            }
            else if !firstOperation
            {
                var contentOfFirstOp : String = firstOperand.text!
                var toInsert : String = "\(contentOfFirstOp)\(tag)"
                firstOperand.text = toInsert
                firstOperation = false
                firstOperandReady = true
                return
            }
        }
            
        //when you have set the operation you can set the second operand
        
        else
        {
            if (tag == 0) && (firstOperation)
            {
                secondOperandReady = true
                sciuar = false
                readyForOperation = true
                return
            }
            else if firstOperation
            {
                secondOperand.text = toString(tag)
                firstOperation = false
                secondOperandReady = true
                readyForOperation = true
                return
            }
            else if !firstOperation
            {
                var contentOfSecondOp : String = secondOperand.text!
                var toInsert : String = "\(contentOfSecondOp)\(tag)"
                secondOperand.text = toInsert
                firstOperation = false
                secondOperandReady = true
                readyForOperation = true
                sciuar = true
                return
            }
        }
    }
    
    //Set operations on the label
    
    @IBAction func SetOperationPlus()
    {
        if firstOperandReady
        {
            self.operation.text = "+"
            operationAlreadySet = true
            firstOperation = true
        }
        
    }
    
    @IBAction func SetOperationMinun()
    {
        if firstOperandReady
        {
            self.operation.text = "-"
            operationAlreadySet = true
            firstOperation = true
        }
    }
    
    @IBAction func SetOperationDivide()
    {
        if firstOperandReady
        {
            self.operation.text = "÷"
            operationAlreadySet = true
            firstOperation = true
        }
        
    }
    
    @IBAction func SetOperationMultiply()
    {
        if firstOperandReady
        {
            self.operation.text = "x"
            operationAlreadySet = true
            firstOperation = true
        }
    }
    
    
    
    //Implementation of the 4 operations
    
    @IBAction func Add()
    {
        if !readyForOperation
        {
            return
        }
        else
        {
            var first : Int = firstOperand.text!.toInt()!
            var second : Int = secondOperand.text!.toInt()!
            var op : String = operation.text!
            sciuar = false
            if op == "+"
            {
                var res = first + second
                result.text = "\(res)"
            }
        }
    }
    
    @IBAction func Subtract()
    {
        if !readyForOperation
        {
            return
        }
        else
        {
            var first : Int = firstOperand.text!.toInt()!
            var second : Int = secondOperand.text!.toInt()!
            var op : String = operation.text!
            sciuar = true
            if op == "-"
            {
                var res = first - second
                result.text = "\(res)"
            }
        }
    }
    
    @IBAction func Divide()
    {
        if !readyForOperation
        {
            return
        }
        else
        {
            var first : String = firstOperand.text!
            var second : String = secondOperand.text!
            var op : String = operation.text!
            sciuar = false
            
            if op == "÷"
            {
                if (first.toInt() == 0 && second.toInt() == 0)
                {
                    result.text = "Indeterminato"
                }
                else if (second.toInt() == 0)
                {
                    result.text = "Impossibile"
                }
                else
                {
                    var res : Double = atof(first) / atof(second)
                    result.text = "\(res)"
                }
            }
        }
    }
    
    @IBAction func Moltiply()
    {
        if !readyForOperation
        {
            return
        }
        else
        {
            var first : Int = firstOperand.text!.toInt()!
            var second : Int = secondOperand.text!.toInt()!
            var op : String = operation.text!
            if op == "x"
            {
                var res = first * second
                result.text = "\(res)"
            }
        }
    }
    
    //reset fields and flags
    
    @IBAction func Delete()
    {
        self.firstOperand.text = "0"
        self.secondOperand.text = "0"
        self.operation.text = "..."
        self.result.text = "Result"
        firstOperation = true
        operationAlreadySet = false
        readyForOperation = false
        firstOperandReady = false
    }
}


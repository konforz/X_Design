//
//  ProblemSolver.swift
//  TestProject
//
//  Created by MAC on 6/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

class ProblemSolver {
  var input = ["4",
               "12    5",
               "3    6",
               "17    13",
               "8    6"] {
    didSet {
      currentLine = 0
    }
  }
  
  var currentLine = 0
  
  func solveAllProblems() {
    solveFirstProblem()
    input = ["0    China",
             "1    Cuba",
             "2    -1",
             "3    Cuba",
             "4    -1",
             "5    -1",
             "6    Cuba",
             "7    Germany",
             "8    Germany",
             "9    China"]
    solveSecondProblem()
    input = ["3",
             "abc",
             "abd",
             "ab"]
    solveThirdProblem()
  }
  
  func readLine() -> String? {
    if currentLine < input.endIndex {
      let inputLine = input[currentLine]
      currentLine += 1
      return inputLine
    } else {
      return nil
    }
  }
  /*
   General Notes: This coding challenge is a coding challenge from a REAL interview coding challenge. That challenge uses similar techniques that are used in HackerRank challenges. It has been replicated here as best as we can.
   
   Note that you can directly access the input. However, you should use the readLine() function instead. This will read each line of the input, if there is one left. If there is no next line, it will return nil.
   
   All output should be printed onto the console, using the print function.
   
   Any implementation that accesses the inputs directly will be counted incorrect, even if the solution is correct.
   */
  
  /*
   First Problem:
   The first line of the input will tell you how many lines of input there are following the first line.
   
   Each subsequent line of input will consist of a pair of numbers, separated by space.
   
   Your goal is to find the least common multiple(LCM), and what you have to multiply each of the numbers in the pair to get that multiple.
   
   Input:
   4
   12    5
   3    6
   17    13
   8    6
   
   Output:
   12  5  60  5  12
   3  6  6  2  1
   17  13  221  13  17
   8  6  24  3  4
   */
    func solveFirstProblem(){
        var readInput = [String?]()
        let (inputOne,inputTwo,inputThree,inputFour,inputFive) = (readLine(),readLine(),readLine(),readLine(),readLine())
        let getInputs = [inputOne,inputTwo,inputThree,inputFour,inputFive]
        for readLine in getInputs{            readInput.append(readLine)
        }
        if let i = readInput.firstIndex(of: inputTwo) {
            let j = readInput[i ..< readInput.endIndex]
            
            let items = j.split(separator: " ")
            let str1 = String(j.first!!)
            let str2 = String(j.last!!)
            
            //Output
            print(str1)
            print(str2)
          
            
        }
       
        print("incomplete implementation")
    
  }
  
  /*
   Second Problem
   
   The input will consist of a number of lines that will have pairs of numbers and values. The values will either be the name of a country, or -1
   
   Your goal is to count the number of times each country appears in the list.
   
   Input:
   0    China
   1    Cuba
   2    -1
   3    Cuba
   4    -1
   5    -1
   6    Cuba
   7    Germany
   8    Germany
   9    China
   
   Output:
   China,2
   Cuba,3
   Germany,2
   */
  func solveSecondProblem() {
    var appearanceCounter: Int = 0
    let (input0,input1,input2,input3,input4,input5,input6,input7,input8,input9) = (readLine(),readLine(),readLine(),readLine(),readLine(),readLine(),readLine(),readLine(),readLine(),readLine())
    let getInputs = [input0,input1,input2,input3,input4,input5,input6,input7,input8,input9]
    func outputMethod(for name: String?, counter: Int) {
        
    }
        print(getInputs)
    print("incomplete implementation")
    
  }
  
  /*
   Third Problem:
   
   The first line of input will be how many lines of inputs you are to consider. The subsequent lines of inputs consist of a single string per line.
   
   Your goal is to find the number of common characters from the beginning. For example, abc and abcd would print out 3, since they both start with abc, which is 3 characters. acd and abc would print out 1. Even though it has 2 characters in common, there is only one common character starting from the beginning, a.
   
   Input:
   abc
   abd
   ab
   
   Output:
   2
   */
  func solveThirdProblem() {
     var readInput = [String?]()
    let (inputA,inputB,inputC,inputD) = (readLine(),readLine(),readLine(),readLine())
    
    let getInputs = [inputA,inputB,inputC,inputD]
    for readLine in getInputs{
        readInput.append(readLine)
    }
    if let i = readInput.firstIndex(of: inputB) {
        let j = readInput[i ..< readInput.endIndex]
        print(j)
    }
    print("incomplete implementation")
    
  }
}

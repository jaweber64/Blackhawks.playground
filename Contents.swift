// Playground - noun: a place where people can play

// Janet Weber  DUE: 9/28/15  Turned in late: 9/29/15
// Lab Assignment Wek 6: Blackhawks playground

// Create a dictionary of team members using their number as the key value
// Create as many other arrays as needed to store the rest of the info
// Using control flow statements do the following;
// 1 - Create a list of players sorted by age
// 2 - Create a list of players sorted by country
// 3 - Calculate the average age of the players
// 4 - Calculate the average height of the players
// 5 - Determine the month in which most of the players birthday falls

import UIKit

// set up MONTHS - array of constants
let MONTHS = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

// Load up dictionary with data
var players: Dictionary<Int, String> = [15: "Artem Anisimov", 39: "Kyle Baun",
    29: "Bryan Bickell", 56: "Marko Dano", 11: "Andrew Desjardins",
    28: "Ryan Garbutt", 38: "Ryan Hartman", 48: "Vincent Hinostroza",
    81: "Marian Hossa", 88: "Patrick Kane", 16: "Marcus Kruger",
    72: "Artemi Panarin", 70: "Dennis Rasmussen", 61: "Garret Ross",
    65: "Andrew Shaw", 86: "Teuvo Teravainen",14: "Viktor Tikhonov",
    19: "Jonathan Toews", 26: "Kyle cumiskey", 6: "Trevor Daley",
    52: "Erik Gustafsson", 4: "Niklas Hjalmarsson", 2: "Duncan Keith",
    32: "Michal Rozsival", 5: "David Rundblad", 7: "Brent Seabrook",
    43: "Viktor Svedberg", 57: "Trevor Van Riemsdyk", 50: "Corey Crawford",
    33: "Scott Darling", 49: "Michael Leighton"];

// Load up arrays with data
var birthmonth: [String] = ["May", "May", "Mar", "Nov", "Jul", "Aug", "Sep", "Apr",
                "Jan", "Nov", "May", "Oct", "Jul", "May", "Jul", "Sep", "May",
                "Apr", "Dec", "Oct", "Mar", "Jun", "Jul", "Sep", "Oct", "Apr", "May",
                "Jul", "Dec", "Dec", "May"]

var hometown: [String] = ["Yaroslavl, RUS", "Toronto, ON, CAN", "Bowmanville, ON, CAN", "Eisenstadt, AUT",
                "Lively, ON, CAN", "Winnipeg, MB, CAN", "Hilton Head Isl., SC, USA", "Chicago, IL, USA",
                "Stara Lubovna, SVK", "Buffalo, NY, USA", "Stockholm, SWE", "Korkino, RUS", "Vasteras, SWE",
                "Dearborn Hts, MI, USA", "Belleville, ON, CAN", "Helsinki, FIN", "Riga, LVA", "Winnipeg, MB, CAN",
                "Abbotsford, BC, CAN", "Toronto, ON, CAN", "Nynashamn, SWE", "Eksjo, SWE", "Winnipeg, MB, CAN",
                "Vlasim, CZE", "Lycksele, SWE", "Richmond, BC, CAN", "Gothenburg, SWE", "Middletown, NJ, USA",
                "Montreal, QC, CAN", "Newport News, VA, USA", "Petrolia, ON, CAN"]

var heightFeet:[Int] = [6, 6, 6, 5, 6, 6, 5, 5, 6, 5, 6, 5, 6, 6, 5, 5, 6, 6,
                        5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
var heightInches:[Int] = [4, 2, 4, 11, 1, 0, 11, 9, 1, 11, 0, 11, 3, 0, 11, 11, 2, 2,
                        11, 11, 0, 3, 1, 1, 2, 3, 8, 2, 2, 6, 3]
var jerseyNumber:[Int] = [15, 39, 29, 56, 11, 28, 38, 48, 81, 88, 16, 72, 70, 61, 65, 86, 14, 19,
                        26, 6, 52, 4, 2, 32, 5, 7, 43, 57, 50, 33, 49]
var age:[Int] = [27, 23, 29, 20, 29, 30, 21, 21, 36, 26, 25, 23, 25, 23, 24, 21, 27, 27,
                        28, 31, 23, 28, 32, 37, 24, 30, 24, 24, 30, 26, 34]

// Declare other variables
var rosterLength : Int = 0
var maxIndex : Int
var i, j, currentMin, tmpInt, tmpInt2, index : Int
var sumAges, sumFeet, sumInches : Int
var playerName : String
var averageAge, averageInches : Double
var averageFeet : Int
var tmpStr :String
var currentCountry, nextCountry : String
var tallyArr:[Int] = [0,0,0,0,0,0,0,0,0,0,0,0]
var curLen, nextLen: Int

// ************************************************
// First sort by age and display
// *************************************************
rosterLength = jerseyNumber.count;

// Sort by age array and swap jerseyNumber array accordingly
println("Chicago Blackhawks roster sorted by age.");
println("");
for (i=0; i<rosterLength-1; i++) {
    currentMin = i;
    for (j=i+1; j<rosterLength; j++) {
        if (age[j] < age[currentMin]){
            currentMin = j
        }
    }
    // Swap array values if necessary
    if (currentMin != i) {
        // swap spots in age array (and ALL of the other parallel arrays!!!)
        tmpInt = age[i]
        age[i] = age[currentMin]                    // age array
        age[currentMin] = tmpInt
            
        tmpInt2 = jerseyNumber[i]
        jerseyNumber[i] = jerseyNumber[currentMin]  //jersey number array
        jerseyNumber[currentMin] = tmpInt2
        
        tmpInt = heightInches[i]
        heightInches[i] = heightInches[currentMin]  // inches portion of height array
        heightInches[currentMin] = tmpInt
        
        tmpInt2 = heightFeet[i]
        heightFeet[i] = heightFeet[currentMin]      // feet portion of height array
        heightFeet[currentMin] = tmpInt2
        
        tmpStr = hometown[i]
        hometown[i] = hometown[currentMin]          // hometown array
        hometown[currentMin] = tmpStr
        
        tmpStr = birthmonth[i]
        birthmonth[i] = birthmonth[currentMin]      // and FINALLY the birthmonth array
        birthmonth[currentMin] = tmpStr
    }
}

// Display sorted list by age
for (i=0; i<rosterLength; i++) {
    index = jerseyNumber[i]
    if let playerName = players[index]{
        println("\(playerName)   Jersey Number  => \(jerseyNumber[i])  age => \(age[i])")
    }
}

// ********************************************
// Calculate average age of players
// *********************************************
sumAges = 0
for (i=0; i<rosterLength; i++) {
        sumAges += age[i];
}
averageAge = Double(sumAges) / Double(rosterLength)
println("")
println ("The average age of players on this roster is : \(Int(averageAge))")

// *********************************************
// Calculate the average height of players
// ********************************************
sumFeet = 0
sumInches = 0
for (i=0; i<rosterLength; i++) {
    sumFeet += heightFeet[i]
    sumInches += heightInches[i]
}
sumInches += 12 * sumFeet
averageFeet = Int(sumInches / rosterLength) / 12
averageInches = (Double(sumInches) % Double(rosterLength)) / Double(rosterLength)
println("")
println ("The average height of players on this roster is : \(averageFeet) feet \(averageInches) inches")

// ********************************************
// Find most popular birthday month
// ********************************************
for (i=0; i<rosterLength; i++) {
    if (birthmonth[i] == "Jan") {tallyArr[0] += 1}
    if (birthmonth[i] == "Feb") {tallyArr[1] += 1}
    if (birthmonth[i] == "Mar") {tallyArr[2] += 1}
    if (birthmonth[i] == "Apr") {tallyArr[3] += 1}
    if (birthmonth[i] == "May") {tallyArr[4] += 1}
    if (birthmonth[i] == "Jun") {tallyArr[5] += 1}
    if (birthmonth[i] == "Jul") {tallyArr[6] += 1}
    if (birthmonth[i] == "Aug") {tallyArr[7] += 1}
    if (birthmonth[i] == "Sep") {tallyArr[8] += 1}
    if (birthmonth[i] == "Oct") {tallyArr[9] += 1}
    if (birthmonth[i] == "Nov") {tallyArr[10] += 1}
    if (birthmonth[i] == "Dec") {tallyArr[11] += 1}
}

maxIndex = 0;
for (i=1; i<12; i++) {
    if tallyArr[i] > tallyArr[maxIndex] {
        maxIndex = i;
    }
}
println("")
println ("The most popular birthday month for players on this roster is : \(MONTHS[maxIndex])")

// *************************************************
// Sort roster by player home country
// *************************************************

println("")
println("Chicago Blackhawks roster sorted by home country:")
println("");
for (i=0; i<rosterLength-1; i++) {
    currentMin = i;
    for (j=i+1; j<rosterLength; j++) {       // get length of strings to compare curLen & nextLen
        curLen = count(hometown[currentMin]) // country is last 3 chars so get substrings to compare
        currentCountry = hometown[currentMin].substringFromIndex(advance(hometown[currentMin].startIndex, curLen - 3))
        nextLen = count(hometown[j])        // get the last three chars then compare
        nextCountry = hometown[j].substringFromIndex(advance(hometown[j].startIndex, nextLen - 3))
        if (nextCountry < currentCountry){
            currentMin = j
        }
    }
    
    // perform swap if necessary (ALL arrays - even though we're only displaying first two)
    if (currentMin != i) {
        // swap spots in age array
        tmpStr = hometown[i]
        hometown[i] = hometown[currentMin]          // home country
        hometown[currentMin] = tmpStr
        
        tmpInt2 = jerseyNumber[i]
        jerseyNumber[i] = jerseyNumber[currentMin]  // jersey number
        jerseyNumber[currentMin] = tmpInt2
        
        tmpInt = age[i]
        age[i] = age[currentMin]                    // age array
        age[currentMin] = tmpInt
        
        tmpInt = heightInches[i]
        heightInches[i] = heightInches[currentMin]  // inches portion of height array
        heightInches[currentMin] = tmpInt
        
        tmpInt2 = heightFeet[i]
        heightFeet[i] = heightFeet[currentMin]      // feet portion of height array
        heightFeet[currentMin] = tmpInt2
        
        tmpStr = birthmonth[i]
        birthmonth[i] = birthmonth[currentMin]      // and FINALLY the birthmonth array
        birthmonth[currentMin] = tmpStr
    }
}

// Display sorted list by country
for (i=0; i<rosterLength; i++) {
    index = jerseyNumber[i]
    if let playerName = players[index]{
        println("\(playerName)   Jersey Number  => \(jerseyNumber[i])  Home Country => \(hometown[i])")
    }
}

/*
DatabaseBlocks(TM)
A module of the CommerceBlocks line of modular ColdFusion development tools
Copyright (c) 2000 by Productivity Enhancement, Inc.
All Rights Reserved.
Development Team: Adam & David Churvis
*/

function checkNumber(object_value) {
	//Returns true if value is a number or is NULL
	//otherwise returns false	
	
	if (object_value.length == 0)
		return true;
	
	//Returns true if value is a number defined as
	//   having an optional leading + or -.
	//   having at most 1 decimal point.
	//   otherwise containing only the characters 0-9.
	var start_format = " .+-0123456789";
	var number_format = " .0123456789";
	var check_char;
	var decimal = false;
	var trailing_blank = false;
	var digits = false;
	
	//The first character can be + - .  blank or a digit.
	check_char = start_format.indexOf(object_value.toString().charAt(0))
	//Was it a decimal?
	if (check_char == 1)
		decimal = true;
	else if (check_char < 1)
		return false;
	
	//Remaining characters can be only . or a digit, but only one decimal.
	for (var i = 1; i < object_value.length; i++) {
		check_char = number_format.indexOf(object_value.charAt(i))
		if (check_char < 0)
			return false;
		else if (check_char == 1) {
			if (decimal)		// Second decimal.
				return false;
			else
				decimal = true;
		}
		else if (check_char == 0) {
			if (decimal || digits)	
				trailing_blank = true;
			
			// ignore leading blanks
			
		}
		else if (trailing_blank)
			return false;
		else
			digits = true;
	}	
	//All tests passed, so...
	return true;
}

function checkInteger(object_value) {
	//Returns true if value is a number or is NULL
	//otherwise returns false	
	
	if (object_value.length == 0)
		return true;
	
	//Returns true if value is an integer defined as
	//   having an optional leading + or -.
	//   otherwise containing only the characters 0-9.
	var decimal_format = ".";
	var check_char;
	
	//The first character can be + -  blank or a digit.
	check_char = object_value.indexOf(decimal_format)
	
	//Was it a decimal?
	if (check_char < 1)
		return checkNumber(object_value);
	else
		return false;
}

function checkRange(object_value, min_value, max_value) {
	//check integer
	if(!checkInteger(object_value)) {
		return false;
	}
	
	// check minimum
	if (min_value != null) {
		if (object_value < min_value)
			return false;
	}
	else {
		return false;
	}
	
	// check maximum
	if (max_value != null) {
		if (object_value > max_value)
			return false;
	}
	else {
		return false;
	}
	
	//All tests passed, so...
	return true;
}

function isInArray(prArray, prValue) {
	for(var i = 0; i < prArray.length; i++) {
		if(prValue == prArray[i])
			return true;
	}
	
	return false;
}

//create an array that contains valid month tokens
monthTokenArray = new Array(24);
monthTokenArray[0] = "Jan";
monthTokenArray[1] = "Feb";
monthTokenArray[2] = "Mar";
monthTokenArray[3] = "Apr";
monthTokenArray[4] = "May";
monthTokenArray[5] = "Jun";
monthTokenArray[6] = "Jul";
monthTokenArray[7] = "Aug";
monthTokenArray[8] = "Sep";
monthTokenArray[9] = "Sept";
monthTokenArray[10] = "Oct";
monthTokenArray[11] = "Nov";
monthTokenArray[12] = "Dec";
monthTokenArray[13] = "January";
monthTokenArray[14] = "Februrary";
monthTokenArray[15] = "March";
monthTokenArray[16] = "April";
monthTokenArray[17] = "June";
monthTokenArray[18] = "July";
monthTokenArray[19] = "August";
monthTokenArray[20] = "September";
monthTokenArray[21] = "October";
monthTokenArray[22] = "November";
monthTokenArray[23] = "December";

function checkDate(stringValue) {
	stringValue = lTrim(rTrim(stringValue));

	if(stringValue.length == 0)
		return true;
	// this function is designed to mimic the "date" portion of the
	// VBScript IsDate() function, allowing dates to be validated
	// with JavaScript in browsers before you run into a problem
	// in ASP pages with date database columns or the VBScript
	// CDate() function; an exception is that string months
	// ("Jan," etc.) are not accepted
	
	// this function does not handle BC dates or dates past 12/31/9999
	
	// you obviously want to strip the comments from production scripts
	
	// create a String object
	var theString = new String(stringValue);
	
	// determine the delimiter character (must be "/" "-" or space)
	var delimiterCharacter
	if ( theString.indexOf('/') > 0 )
		delimiterCharacter = '/';
	else
		if ( theString.indexOf('-') > 0 )
			delimiterCharacter = '-';
		else
			if ( theString.indexOf(' ') > 0 )
				delimiterCharacter = ' ';
			else
				return false;
				
	// split the string into an array of tokens
	var theTokens = theString.split(delimiterCharacter);
	
	// there must be either two or three tokens
	if ( theTokens.length < 2 || theTokens.length > 3 )
		return false;
	
	// convert the tokens to String objects, which will be needed later,
	// stripping a single leading 0
	var tokenIndex;
	for ( tokenIndex = 0; tokenIndex < theTokens.length; tokenIndex++ ) {
		theTokens[tokenIndex] = new String(theTokens[tokenIndex])			
		if ( theTokens[tokenIndex].charAt(0) == '0' )
			theTokens[tokenIndex] = theTokens[tokenIndex].substring(1, theTokens[tokenIndex].length);
	}

	// all of the tokens must be positive integers
	/*for ( tokenIndex = 0; tokenIndex < theTokens.length; tokenIndex++ ) {
		if ( ! isNonnegativeInteger(theTokens[tokenIndex]) )
			return false;
	}*/
	
	// we need to identify the year, month, and day tokens
	var numericValue;
	var yearTokenIndex = -1;
	var monthTokenIndex = -1;
	var dayTokenIndex = -1;
	for ( tokenIndex = 0; tokenIndex < theTokens.length; tokenIndex++ ) {
				
		// convert the value
		numericValue = parseInt(theTokens[tokenIndex], 10);
				
		// could this token be a month?
		if ( numericValue <= 12) {
				
			// yes; do we already have a month?
			if ( monthTokenIndex == -1 ) {
					
				// no; assign this token to the month and continue
				monthTokenIndex = tokenIndex;
				continue;
			}
			else {
						
				// we already have a month; this token could
				// also be the day; do we already have a day?
				if ( dayTokenIndex == -1 ) {
					
					// no; assign this token to the day and continue
					dayTokenIndex = tokenIndex;
					continue;
				}
				else {
						
					// we already have a day; this token could
					// also be the year; do we alreay have a year?
					if ( yearTokenIndex == -1 ) {
					
						// no; assign this token to the year and continue
						yearTokenIndex = tokenIndex;
						continue;
					}
				}
			}
		}
		else if(isInArray(monthTokenArray, theTokens[tokenIndex])) {
			if ( monthTokenIndex == -1 ) {
				monthTokenIndex = tokenIndex;
				continue;
			}
			else
			{
				dayTokenIndex = monthTokenIndex;
				monthTokenIndex = tokenIndex;
				continue;
			}
		}
		else {
					
			// the value is too large for a month;
			// could this token be a day?
			if ( numericValue <= 31 ) {
					
				// yes; do we already have a day?
				if ( dayTokenIndex == -1 ) {
					
					// no; assign this token to the day and continue
					dayTokenIndex = tokenIndex;
					continue;
				}
				else {
						
					// we already have a day; this token could
					// also be the year; do we alreay have a year?
					if ( yearTokenIndex == -1 ) {
					
						// no; assign this token to the year and continue
						dayTokenIndex = tokenIndex;
						continue;
					}
				}
			}
			else {
					
				// the value is too large for a day;
				// could this token be a year?
				if ( numericValue <= 9999 ) {
				
					// yes; do we already have a year?
					if ( yearTokenIndex == -1 ) {
					
						// no; assign this token to the year
						yearTokenIndex = tokenIndex;
					}
				}
			}
		}
	}	// end of for loop
	
	// evaluate, based on the number of tokens
	if ( theTokens.length == 2 ) {
		
		// two tokens can be either a month/year combination or a month/day
		// combination with the current year assumed; either way, we must have
		// a month
		if ( monthTokenIndex == -1 )
			
			// no month
			return false;
			
		// do we have a year?
		if ( ! (yearTokenIndex == -1) ) {
		
			// yes; month/year combination; must be okay
			return true;
		}
		else
			
			// no year; do we have a day?
			if ( ! (dayTokenIndex == -1) ) {
			
				// yes; month/day combination; get the current year
				var today = new Date();
				var currentYear = today.getYear();

				// make sure it's a valid date (we were testing days using
				// 31, and that might be too many for the month)
				return isDate(currentYear, theTokens[monthTokenIndex], theTokens[dayTokenIndex]);
			}
			else
			
				// we have neither a year nor a day
				return false;
	}
	else {
		
		// three tokens; we should have found tokens for year, month, and day
		if ( yearTokenIndex == -1 || monthTokenIndex == -1 || dayTokenIndex == -1 )
			
			// missing one or more
			return false;
		else
			
			// found all; however, VBScript can only handle the following sequences
			if ( monthTokenIndex == 0 ) {
			
				// must be m/d/y
				if ( dayTokenIndex != 1 || yearTokenIndex != 2)
					return false;
			}
			else
				if ( dayTokenIndex == 0 ) {
			
					// must be d/m/y
					if ( monthTokenIndex != 1 || yearTokenIndex != 2)
						return false;
				}
				else
					if ( yearTokenIndex == 0 ) {
			
						// must be y/m/d
						if ( monthTokenIndex != 1 || dayTokenIndex != 2)
							return false;
					}
					else
					
						// something is wrong
						return false;
			
			// make sure it's a valid date (we were testing days using a value
			// of 31, and that might be too many for the actual month)
			return isDate(theTokens[yearTokenIndex], theTokens[monthTokenIndex], theTokens[dayTokenIndex]);
	}
}

function checkTime(stringValue) {

	stringValue = lTrim(rTrim(stringValue));

	if(stringValue.length == 0)
		return true;

	// this function is designed to mimic the "time" portion of the
	// VBScript IsDate() function, allowing times to be validated
	// with JavaScript in browsers before you run into a problem
	// in ASP pages with date database columns or the VBScript
	// CDate() function
	
	// you obviously want to strip the comments from production scripts
	// and place this function in the library file

	// create a String object
	var theString = new String(stringValue);
	
	// the string must have either two (hours and minutes) or three
	// (hours, minutes and seconds) tokens, delimited by ":";
	// split the string into an array of tokens
	var theTokens = theString.split(':');
	if ( theTokens.length < 2 || theTokens.length > 3 )
		return false;
	
	// convert the tokens to String objects, which will be needed later,
	// stripping whitespace
	var firstToken = new String(theTokens[0])
	firstToken = trim(firstToken);
	var middleToken;
	if ( theTokens.length == 3 ) {
		middleToken = new String(theTokens[1])
		middleToken = trim(middleToken);
	}
	var lastToken = new String(theTokens[theTokens.length - 1])
	lastToken = trim(lastToken);

	// the first token (hours) must be an integer between 0 and 23
	if ( ! isInteger(firstToken) )
		return false;
	if ( ! isIntegerInRange(firstToken, 0, 23) )
		return false;
	
	// are there three tokens?
	if ( theTokens.length == 3 ){
	
		// the middle token (minutes) must be an integer between 0 and 59
		if ( ! isInteger(middleToken) )
			return false;
		if ( ! isIntegerInRange(middleToken, 0, 59) )
			return false;
	}
		
	// the first one or two characters of the last token (either minutes
	// and optional am/pm indicator or seconds and am/pm indicator) must
	// be digits
	if ( ! isDigit(lastToken.charAt(0)) )
		return false;
	
	// the first character is a digit; split the last token into the minutes
	// or seconds value and the indicator; depending on the second character
	var lastValue;
	var ampmIndicator;
	if ( isDigit(lastToken.charAt(1)) ) {
		lastValue = new String(lastToken.substring(0, 2));
		if ( lastToken.length >= 3 )
			ampmIndicator = new String(trim(lastToken.substring(2, lastToken.length)));
		else
			ampmIndicator = new String();
	}
	else {
		lastValue = new String(lastToken.substring(0, 1));
		if ( lastToken.length >= 2 )
			ampmIndicator = new String(trim(lastToken.substring(1, lastToken.length)));
		else
			ampmIndicator = new String();
	}
	ampmIndicator = ampmIndicator.toUpperCase();
	
	// the last value must be between 0 and 59
	if ( ! isIntegerInRange(lastValue, 0, 59) )
		return false;
	
	// check the am/pm indicator, if there is one
	if ( ampmIndicator.length > 0 )
		if ( ! ( ampmIndicator == "AM" || ampmIndicator == "PM" ) )
			return false;
			
	// valid time
	return true;
}

// most of the following was derived from Netscape's FormChek.js
// library, which should be reviewed for documentation and comments

var daysInMonth = makeArray(12);
daysInMonth[1] = 31;
daysInMonth[2] = 29;
daysInMonth[3] = 31;
daysInMonth[4] = 30;
daysInMonth[5] = 31;
daysInMonth[6] = 30;
daysInMonth[7] = 31;
daysInMonth[8] = 31;
daysInMonth[9] = 30;
daysInMonth[10] = 31;
daysInMonth[11] = 30;
daysInMonth[12] = 31;

var whitespace = " \t\n\r";

function charInString(c, s) {
	for (i = 0; i < s.length; i++) {
		if (s.charAt(i) == c)
			return true;
	}
	return false
}

function daysInFebruary(year) {
	return ( ((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}

function isDate(year, month, day) {
	if ( ! ( isYear(year) && isMonth(month) && isDay(day) ) ) return false;
	var intYear = parseInt(year);
	var intMonth = parseInt(month);
	var intDay = parseInt(day);
	if ( intDay > daysInMonth[intMonth] && intMonth != 0) return false; 
	if ( ( intMonth == 2 ) && ( intDay > daysInFebruary(intYear) ) ) return false;
	return true;
}

function isDay(s) {
	return isIntegerInRange(s, 1, 31);
}

function isDigit(c) {
	return ( ( c >= "0" ) && ( c <= "9" ) )
}

function isInteger(s) {
	var i;
	for ( i = 0; i < s.length; i++ )
	{   
		var c = s.charAt(i);
		if ( ! isDigit(c) ) return false;
	}
	return true;
}

function isIntegerInRange(s, a, b) {
	if ( ! isInteger(s) ) return false;
	var num = parseInt (s);
	return ( ( num >= a ) && ( num <= b ) );
}

function isMonth(s) {
	return (isIntegerInRange (s, 1, 12)) || (isInArray(monthTokenArray, s));
}

function isNonnegativeInteger(s) {
	return ( isSignedInteger(s) && ( parseInt(s) >= 0 ) );
}

function isSignedInteger(s) {
	var startPos = 0;
	if ( ( s.charAt(0) == "-" ) || ( s.charAt(0) == "+" ) )
	   startPos = 1;	
	return ( isInteger(s.substring(startPos, s.length)) )
}

function isYear(s) {
	if ( ! isNonnegativeInteger(s) ) return false;
	return true;
}

function lTrim(s) {
	var i = 0;
	while ( (i < s.length) && charInString(s.charAt(i), whitespace) )
	   i++;
	return s.substring(i, s.length);
}

function makeArray(n) {
   for ( var i = 1; i <= n; i++ ) {
	  this[i] = 0
   } 
   return this
}

function rTrim(s) {
	var i = s.length - 1;
	while ( (i > 0) && charInString(s.charAt(i), whitespace) )
		i--;
	return s.substring(0, i + 1);
}

function trim(s) {
	return lTrim(rTrim(s));
}

function checkDateTime(stringValue) {
	stringValue = trim(stringValue);
	arDateTime = stringValue.split(" ");
	if(arDateTime.length == 1 || (arDateTime.length == 2 && (arDateTime[1] == "AM" || arDateTime[1] == "PM")))
	{
		return (checkDate(stringValue) || checkTime(stringValue))
	}
	else
	{
		sTime = arDateTime[arDateTime.length - 1];
		
		arDateTime[arDateTime.length - 1] = null;
		
		return (checkDate(arDateTime.join(" ")) && checkTime(sTime));
	}
}

function checkPhone(object_value) {
	if (object_value.length == 0)
		return true;
	
	if (object_value.length != 8 && object_value.length != 12 && object_value.length != 14)
		return false;
	
	object_value = trimString(object_value);
	if(object_value.length == 8) {
	
		//EEE-NNNN 
		if(object_value.substring(3,4) != "-") {
			return false;
		}
		
		var exchange = object_value.substring(0,3);
		var number = object_value.substring(4,8);
		
		if(checkInteger(exchange) && checkInteger(number)) {
			if(!checkRange(exchange, 100, 999) || !checkRange(number, 1000, 9999)) {
				return false;
			}
		}
		else {
			return false;
		}
	}
	else if(object_value.length == 12) {
		//AAA-EEE-NNNN 
		if(object_value.substring(3,4) != "-" || object_value.substring(7,8) != "-") {
			return false;
		}
		
		var areacode = object_value.substring(0,3);
		var exchange = object_value.substring(4,7);
		var number = object_value.substring(8,12);
		
		if(checkInteger(exchange) && checkInteger(areacode) && checkInteger(number)) {
			if(!checkRange(areacode, 100, 999) || !checkRange(exchange, 100, 999) || !checkRange(number, 1000, 9999)) {
				return false;
			}
		}
		else {
			return false;
		}
	}
	else if(object_value.length == 14) {
		//(AAA) EEE-NNNN 
		if(object_value.substring(0,1) != "(" || object_value.substring(4,6) != ") " || object_value.substring(9,10) != "-") {
			return false;
		}
		
		var areacode = object_value.substring(1,4);
		var exchange = object_value.substring(6,9);
		var number = object_value.substring(10,14);
		
		if(checkInteger(exchange) && checkInteger(areacode) && checkInteger(number)) {
			if(!checkRange(areacode, 100, 999) || !checkRange(exchange, 100, 999) || !checkRange(number, 1000, 9999)) {
				return false;
			}
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
	
	return true;
}

function checkZip(object_value) {
	if (object_value.length == 0)
		return false;
	
	if (object_value.length != 5 && object_value.length != 10)
		return false;
	
	// make sure first 5 digits are a valid integer
	if (object_value.charAt(0) == "-" || object_value.charAt(0) == "+")
		return false;
	
	if (!checkInteger(object_value.substring(0,5)))
		return false;
	
	if (object_value.length == 5)
		return true;
	
	// make sure
	
	// check if separator is either a'-' or ' '
	if (object_value.charAt(5) != "-" && object_value.charAt(5) != " ")
		return false;
	
	// check if last 4 digits are a valid integer
	if (object_value.charAt(6) == "-" || object_value.charAt(6) == "+")
		return false;
	
	return (checkInteger(object_value.substring(6,10)));
}

function checkCreditCard(object_value) {
	var white_space = " -";
	var creditcard_string="";
	var check_char;
	
	
	if (object_value.length == 0)
		return true;
	
	// squish out the white space
	for (var i = 0; i < object_value.length; i++) {
		check_char = white_space.indexOf(object_value.charAt(i))
		if (check_char < 0)
			creditcard_string += object_value.substring(i, (i + 1));
	}	
	
	// if all white space return error
	if (creditcard_string.length == 0)
		return false;
	
	
	// make sure number is a valid integer
	if (creditcard_string.charAt(0) == "+")
		return false;
	
	if (!checkInteger(creditcard_string))
		return false;
	
	// now check mod10
	
	var doubledigit = creditcard_string.length % 2 == 1 ? false : true;
	var checkdigit = 0;
	var tempdigit;
	
	for (var i = 0; i < creditcard_string.length; i++) {
		tempdigit = eval(creditcard_string.charAt(i))
		
		if (doubledigit) {
			tempdigit *= 2;
			checkdigit += (tempdigit % 10);
			
			if ((tempdigit / 10) >= 1.0) {
				checkdigit++;
			}
			
			doubledigit = false;
		}
		else {
			checkdigit += tempdigit;
			doubledigit = true;
		}
	}	
	return (checkdigit % 10) == 0 ? true : false;
}

function checkSSN(object_value) {
	var white_space = " -+.";
	var ssc_string="";
	var check_char;
	
	
	if (object_value.length == 0)
		return true;
	
	if (object_value.length != 11 && object_value.length != 9)
		return false;
	
	// make sure white space is valid
	if (object_value.charAt(3) != "-" && object_value.charAt(3) != " ")
		return false;
	
	if (object_value.charAt(6) != "-" && object_value.charAt(6) != " ")
		return false;
	
	
	// squish out the white space
	for (var i = 0; i < object_value.length; i++) {
		check_char = white_space.indexOf(object_value.charAt(i))
		if (check_char < 0)
			ssc_string += object_value.substring(i, (i + 1));
	}	
	
	// if all white space return error
	if (ssc_string.length != 9)
		return false;
	
	
	// make sure number is a valid integer
	if (!checkInteger(ssc_string))
		return false;
	
	return true;
}

function trimString(str) {
	var retStr = "";
	for(var i = 0; i < str.length; i++) {
		if(str.substring(i, i+1) == " ") {
			continue;
		}
		else {
			str = str.substring(i, str.length);
			break;
		}
	}
	
	for(i = str.length - 1; i >= 0; i--) {
		if(str.substring(i, i+1) == " ") {
			continue;
		}
		else {
			retStr = str.substring(0, i+1);
			break;
		}
	}
	return retStr;
}

function hasValue(str) {
	if(trimString(str).length > 0) {
		return true;
	}
	else {
		return false;
	}
}

function checkFilterCriteria(str) {
	var badChars = " %";
	var checkedString = "";
	var inStr = "";
	
	for(var i = 0; i < str.length; i++) {
		inStr = badChars.indexOf(str.charAt(i));
		if(inStr < 0) {
			checkedString += str.charAt(i);
		}
	}
	
	if(checkedString.length > 0) {
		return true;
	}
	else {
		return false;
	}
}

function checkEmail(str) {
	if(str.length == 0) {
		return true;
	}
	
	atPos = str.indexOf("@");
	dotPos = str.indexOf(".");
	
	if(atPos < 0 || dotPos < 0) {
		return false;
	}
	
	return true;
}

function checkGUID(str) {
	var goodChars = "01234567890ABCDEFabcdef-";
	var inStr = -1;
	
	var numInChunk = 0;
	var whichChunk = 1;
	
	if(str.length == 0) {
		return true;
	}
	
	for(var i = 0; i < str.length; i++) {
		inStr = goodChars.indexOf(str.charAt(i));
		if(inStr < 0) {
			return false;
		}
		
		if(str.charAt(i) == "-") {
			switch(whichChunk) {
				case 1:
					if(numInChunk != 8)
						return false;
					break;
				
				case 2:
				case 3:
				case 4:
					if(numInChunk != 4)
						return false;
					break;
				
				case 5:
					if(numInChunk != 12)
						return false;
					break;
				
				default:
					return false;
					break;
			}
			
			whichChunk++;
			numInChunk = 0;
		}
		else {
			numInChunk++;
		}
	}
	
	if(whichChunk != 5)
		return false;
	
	return true;
}

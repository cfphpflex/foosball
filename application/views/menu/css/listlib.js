/*
DatabaseBlocks(TM)
A module of the CommerceBlocks line of modular ColdFusion development tools
Copyright (c) 2000 by Productivity Enhancement, Inc.
All Rights Reserved.
Development Team: Adam & David Churvis
*/

/*
Integer GetListIndex(String prElement, String prList)
Gets the 0-based index of a specified element inside of a string.  Returns -1 if item not found.
*/
function GetListIndex(prElement, prList) {
	var cReg = "";
	var szElement = "";
	var nIndex = -1;
	
	//Loop over the length of the passed list
	for(var nIndexStr = 0; nIndexStr <= prList.length; nIndexStr++) {
		
		//Get the current character in this list
		cReg = prList.charAt(nIndexStr);
		if(cReg == "," || nIndexStr == prList.length) {
			//if we have just finished a list element, compare it against the element stored in szElement
			nIndex++;
			if(szElement == prElement) {
				//if the two are identical, return the index.
				return nIndex;
			}
			else {
				//otherwise, set the stored element blank.
				szElement = "";
			}
		}
		else {
			//if we are in the middle of a list element, append the current character to the stored element.
			szElement += cReg;
		}
	}
	
	return -1;
}

/*
String AddListElement(String prElement, String prList)
Returns list with new element appended.
*/
function AddListElement(prElement, prList) {
	if(prList == "")
		//if list is blank, return new element as list
		return prElement;
	else
		//otherwise, return list with element appended
		return prList + "," + prElement;
}

/*
String DeleteListElement(String prElement, String prList)
Returns list with specified element deleted.
*/
function DeleteListElement(prElement, prList) {
	var cReg = "";
	var szElement = "";
	var szRetList = "";
	
	//Loop over passed list
	for(var nIndexStr = 0; nIndexStr <= prList.length; nIndexStr++) {
		
		//Get current character
		cReg = prList.charAt(nIndexStr);
		if(cReg == "," || nIndexStr == prList.length) {
			//if we have finished parsing an element, compare it against the passed element.
			if(szElement != prElement) {
				//If they are not equal, append the element to the list to be returned.  If not, ignore.
				szRetList = "" + szRetList + szElement;
				if(cReg == ",") {
					szRetList = szRetList + ",";
				}
			}
			szElement = "";
		}
		else {
			szElement += cReg;
		}
	}
			
	if(szRetList.charAt(szRetList.length - 1) == ",") {
		//Remove the last character of the list if it is a comma.
		szRetList = szRetList.substring(0, szRetList.length - 1);
	}
	
	return szRetList;
}

/*
Integer GetNumElements(String prList)
Returns number of elements in a list
*/
function GetNumElements(prList) {
	var bLoop = true;
	var nElements = 0;
	var nIndexStr = -1;
	
	//Loop over the passed list.  If the character is a comma, increment the number of elements.
	if(prList != "") {
		while(bLoop){
			nIndexStr = prList.indexOf(",", nIndexStr + 1);
			if(nIndexStr != -1 && nIndexStr < prList.length)
				nElements++;
			else
				bLoop = false;
		}
	}
	
	if(prList != "") nElements++;
	
	return nElements;
}

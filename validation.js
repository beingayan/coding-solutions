
/*
  * * * * * * * * * * * * * * * * * * * * * * 
  *                                         *
  *         #number validation  
  *            accept only numbers          * 
  *  * * * * * * * * * * * * * * * * * * * * *                                          
*/
 
  const onKeyDown=
  (e) => {
    if (e.key === "." || (!/^[0-9\b]+$/.test(e.key) && e.key !== "Backspace")) {
      e.preventDefault();
    }
  }
  <input type="text" onKeyDown={onkeydown} />

 


/*
  * * * * * * * * * * * * * * * * * * * * * * 
  *                                         *
  *         #email validation                                *
  *  * * * * * * * * * * * * * * * * * * * * *                                          
*/



  function isValidEmail(email) {
  // Regular expression pattern for email validation
  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  
  return emailPattern.test(email);
}

// Test the function
console.log(isValidEmail("test@example.com")); // true
console.log(isValidEmail("invalid_email")); // false



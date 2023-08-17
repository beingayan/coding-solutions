How to encode and decode string

function decodeString(encoded) {
  let decoded = encoded[0]; // Initialize with the first character of the encoded string
  encoded = encoded.slice(1); // Remove the first character from the encoded string

console.log("encoded-be",encoded)
  while (encoded.length > 0) {
    // Add the first character of the encoded string to the left of the decoded string
    decoded = encoded[0] + decoded;
    
    // Remove the added character from the encoded string
    encoded = encoded.slice(1);
    
    if (encoded.length > 0) {
      // Add the first character of the encoded string to the right of the decoded string
      decoded = decoded + encoded[0];
      
      // Remove the added character from the encoded string
      encoded = encoded.slice(1);
    }
  }
  
  return decoded;
}

const input1 = "ofrsgkeeeekgs";
console.log(decodeString(input1)); // Output: "geeksforgeeks"

const input2 = "bbaa";
console.log(decodeString(input2)); // Output: "abba"

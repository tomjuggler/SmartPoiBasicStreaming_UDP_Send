//here we have a function to compress 3 values into 1. R3G3B2 compression. Uncompressed on receiver side. 
//saves bandwidth over the network. 
byte pixelConverter(int red, int green, int blue) {
  byte encodedRGB;
  encodedRGB = byte((red & 0xE0) | ((green & 0xE0)>>3) | (blue >> 6));
  return encodedRGB;
}

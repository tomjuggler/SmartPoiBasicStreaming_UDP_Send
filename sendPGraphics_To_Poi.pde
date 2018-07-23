void sendPGraphicsToPoi(PGraphics pgSend) {
  int pixelCounter = 0;
  byte[] message = new byte[maxPx];
  //byte[] bigpx = new byte[72];
  for (int a = 0; a < pgSend.width*pgSend.height; a++) {
    r = (int) red(pgSend.pixels[a]);
    g = (int) green(pgSend.pixels[a]);
    b = (int) blue(pgSend.pixels[a]); 
    ////////UDP Send://///////////////////////////////////
    byte Y = byte(pixelConverter(r, g, b)+127);
    message[pixelCounter] = Y;
    pixelCounter++;    
    if (pixelCounter == pgSend.width) {
      udp.send(message, ip, UDPport);    
//      udp.send(message, ip2, UDPport); //uncomment to send to second poi
      pixelCounter = 0;
    }

    //delay(100);
  }
}


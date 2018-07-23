

//UDP code:///////////////////////////////////////////////////
import hypermedia.net.*;

UDP udp; // define the UDP object

String ip = "192.168.1.1"; // the remote IP address (Master Poi)
String ip2 = "192.168.1.78"; // the remote IP address (Slave Poi)

int UDPport = 2390; // the destination port
//////////////////////////////////////////////////////////////

PGraphics pg2;

int xInt = 0;
int incrDn = 0;
boolean goingUp = true;
int r, g, b;
boolean testing = false;
float speed;

int maxPx = 36;

void setup() {
  size(640, 480); //size of my phone screen
  background(0);
  //frameRate(5); //slow down for testing
  
  /////////////////////////////UDP Code://////////////////////
  udp = new UDP( this, UDPport ); // create a new datagram connection on port 8888
  //udp.log( true ); // <– printout the connection activity
  udp.listen( true ); // and wait for incoming message
  
  pg2 = createGraphics(36, 1);
}



void draw() {
  int varX = xInt;
  if (goingUp) {
    drawColouredThing(color(random(255), random(255), random(255)), varX);
  }
  //println(i);
  else {
    drawColouredThing(color(random(255), random(255), random(255)), (maxPx-1)-varX);
  }
  xInt++;
  if (xInt>36) {

    goingUp = !goingUp;
    incrDn++;
    if (incrDn > 8) {
      background(0);
      incrDn = 0;
    }
    xInt = 0;
  }
}



void drawColouredThing(color c, int up) {
  pg2.beginDraw();
  pg2.strokeWeight(1);
  pg2.background(0);
  pg2.stroke(c);
  //pg2.line(35-up, 0, up, 0);
  pg2.point(35-up, 0);
  pg2.point(up, 0);    
  pg2.endDraw();
  //background(0);
  image(pg2, 100, xInt+incrDn*(maxPx-1)+10, pg2.width*10, 1);
  println("image: " + xInt);
  println("frameRate: " + frameRate);
  //send to poi
  sendPGraphicsToPoi(pg2);
  //delay(100); //for testing
}

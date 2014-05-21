class ClockFace {
  int radius;
  int offset;
  int degPerSector;
  int secStartDeg;
  int[][] angles;
  int[] onColours = {170, 90, 35};
  /**
   * @param  int radius       - The radius of the clock face.
   * @param  int offset       - Number of px from the center of the screen (positiv or negativ).
   * @param  int degPerSector - Number of degrees contained in each sector.
   * @param  int secStartDeg  - The start degree of the first sector.
   * @param  int[][] angles   - An two-dimentional array with the start and stop degrees for each time increment.
   * 
   */
  ClockFace(int radius, int offset, int degPerSector, int secStartDeg, int[][] angles) {
    this.radius = radius;
    this.offset = offset;
    this.degPerSector = degPerSector;
    this.secStartDeg = secStartDeg;
    this.angles = angles;
  }
  /**
   * Draws the concentric circles that makes the clock face.
   * 
   */
  void drawCircles() {
    noFill();
    stroke(250, 0, 0);    // Set line colour to red.
    strokeWeight(4);      // Thicker line weight for circles.

    for (int i = r; i > 0; i -= radius/3) {
      ellipse(width/2 + offset, height/2, i, i);
    }
  }
  /**
   * Draws the lines that separates the clock face into sectors.
   * 
   */
  void drawLines() {
    stroke(0);
    strokeWeight(1);
    noFill();
    for (int i = 30; i <= 360; i += degPerSector ) {
      arc(width/2 + offset, height/2, r, r, radians(i), radians(i + degPerSector), PIE);
    }
  }
  /**
   * Draws the lines and cicles again.
   * 
   */
  void update() {
    drawLines();
    drawCircles();
  }
  /**
   * Draws the sectors that is used to show seconds, minutes and hours passing.
   * 
   */
  void drawArc(int startAng, int endAng, int fillColour, int unit) {
    noStroke();
    fill(fillColour);
    arc(width/2 + offset, height/2, r - (unit*(radius/3)), r - (unit*(radius/3)), radians(startAng), radians(endAng), PIE);
    if(unit < 2) {
      fill(255);
      arc(width/2 + offset, height/2, r - ((unit + 1)*(radius/3)), r - ((unit + 1)*(radius/3)), radians(startAng), radians(endAng), PIE);
    }
  }
  void sectorOn(int startAng, int endAng, int unit) {
    drawArc(startAng, endAng, onColours[unit], unit);
  }
  void sectorOff(int startAng, int endAng, int unit) {
    drawArc(startAng, endAng, 255, unit);
  }
}


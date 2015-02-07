// Variation
float increment = 0.01;

// Amount of Land
int archipelago = 100;
int islands = 120;
int continents = 140;
int greatLakes = 180;
int plains = 200;
int amountOfLand = continents; // 100 to 200

// Amount of Mountains
int amountOfMountains = 50 + amountOfLand;  // 50 to max (less is more)

// Water Levels
int deepWaterLevel = amountOfLand - 20;

// Terrain Colors
int mountainColor = color(80, 80, 80);
int landColor = color(90, 160, 0);
int waterColor = color(40, 75, 235);
int deepWaterColor = color(30, 50, 190);

void setup() {
  size(800, 800);
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  float detail = map(width, 0, width, 0.1, 0.6);
  noiseDetail(30, detail);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float result = noise(xoff, yoff) * 255;
      
      // Set each pixel depending on the terrain colors/levels
      if(result > amountOfMountains) {
        pixels[x+y*width] = mountainColor;
      } else if(result <= amountOfMountains && result > amountOfLand) {
        pixels[x+y*width] = landColor;
      } else if(result <= amountOfLand && result > deepWaterLevel) {
        pixels[x+y*width] = waterColor;
      } else {
        pixels[x+y*width] = deepWaterColor;
      }
    }
  }
  
  updatePixels();
}

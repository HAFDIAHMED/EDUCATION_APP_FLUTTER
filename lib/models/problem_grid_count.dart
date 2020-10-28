getProblemGridNumber(screenWidth) {
  int number;
  if (screenWidth <= 450) {
    number = 3;
  } else if (screenWidth < 600) {
    number = 4;
  } else {
    number = 5;
  }
  return number;
}

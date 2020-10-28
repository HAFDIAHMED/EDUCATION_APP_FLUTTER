getCardHight(sizingInformation) {
  double cardHeight = 0;
  if (sizingInformation.screenSize.width <= 400) {
    cardHeight = 0.30;
  } else if (sizingInformation.screenSize.width < 465) {
    cardHeight = 0.22;
  } else {
    cardHeight = 0.18;
  }
  return cardHeight;
}

getCardHightSmall(sizingInformation) {
  double cardHeight = 0;
  if (sizingInformation.screenSize.width <= 400) {
    cardHeight = 0.31;
  } else if (sizingInformation.screenSize.width < 465) {
    cardHeight = 0.26;
  } else {
    cardHeight = 0.24;
  }
  return cardHeight;
}

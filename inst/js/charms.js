$(document).click(function(event) {
  if(!$(event.target).closest('.charms').length) {
    if(isOpen('.charms')) {
      Metro.charms.open(".charms");
    }
  }
});

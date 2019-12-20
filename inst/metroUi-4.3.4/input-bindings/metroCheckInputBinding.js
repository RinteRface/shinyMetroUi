// Input binding
var metroCheckBinding = new Shiny.InputBinding();

$.extend(metroCheckBinding, {

  find: function(scope) {
    return $(scope).find(".checkbox");
  },

  // Given the DOM element for the input, return the value
  getValue: function(el) {
    console.log($(el));
  },

  // see updateMetroCheck
  receiveMessage: function(el, data) {

  },

  subscribe: function(el, callback) {
    $(el).on("card:opened.metroCheckBinding", function(e) {
      callback();
    });
  },

  unsubscribe: function(el) {
    $(el).off(".metroCheckBinding");
  }
});

Shiny.inputBindings.register(metroCheckBinding);

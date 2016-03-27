// APEX Tooltip functions
// Author: Daniel Hochleitner
// Version: 1.0

// global namespace
var apexTooltip = {
  // parse string to boolean
  parseBoolean: function(pString) {
    var pBoolean;
    if (pString.toLowerCase() == 'true') {
      pBoolean = true;
    }
    if (pString.toLowerCase() == 'false') {
      pBoolean = false;
    }
    if (!(pString.toLowerCase() == 'true') && !(pString.toLowerCase() == 'false')) {
      pBoolean = undefined;
    }
    return pBoolean;
  },
  // function that gets called from plugin
  showTooltip: function() {
    // plugin attributes
    var daThis = this;
    var vElementsArray = daThis.affectedElements;
    var vTheme = daThis.action.attribute01;
    var vContent = daThis.action.attribute02;
    var vContentAsHTML = apexTooltip.parseBoolean(daThis.action.attribute03);
    var vAnimation = daThis.action.attribute04;
    var vPosition = daThis.action.attribute05;
    var vDelay = parseInt(daThis.action.attribute06);
    var vTrigger = daThis.action.attribute07;
    var vMinWidth = parseInt(daThis.action.attribute08);
    var vMaxWidth = parseInt(daThis.action.attribute09);
    var vLogging = apexTooltip.parseBoolean(daThis.action.attribute10);
    // Logging
    if (vLogging) {
      console.log('showTooltip: affectedElements:', vElementsArray);
      console.log('showTooltip: Attribute Theme:', vTheme);
      console.log('showTooltip: Attribute Content:', vContent);
      console.log('showTooltip: Attribute Content as HTML:', vContentAsHTML);
      console.log('showTooltip: Attribute Animation:', vAnimation);
      console.log('showTooltip: Attribute Position:', vPosition);
      console.log('showTooltip: Attribute Delay:', vDelay);
      console.log('showTooltip: Attribute Trigger:', vTrigger);
      console.log('showTooltip: Attribute minWidth:', vMinWidth);
      console.log('showTooltip: Attribute maxWidth:', vMaxWidth);
      console.log('showTooltip: Attribute Logging:', vLogging);
    }
    for (var i = 0; i < vElementsArray.length; i++) {
      var vaffectedElement = daThis.affectedElements.eq(i);
      // call tooltipster plugin
      $(vaffectedElement).tooltipster({
        theme: vTheme,
        content: vContent,
        contentAsHTML: vContentAsHTML,
        animation: vAnimation,
        position: vPosition,
        delay: vDelay,
        touchDevices: false,
        trigger: vTrigger,
        minWidth: vMinWidth,
        maxWidth: vMaxWidth,
        debug: vLogging,
        functionBefore: function(origin, continueTooltip) {
          $(vaffectedElement).trigger('apextooltip-show');
          continueTooltip();
        },
        functionAfter: function(origin) {
          $(vaffectedElement).trigger('apextooltip-hide');
        }
      });
    }
  }
};

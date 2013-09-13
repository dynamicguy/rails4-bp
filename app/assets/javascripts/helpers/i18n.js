Rails4Bp.I18n = {
   language: "en",
   locale: {},

   loadLocale: function(locale, language) {
     this.locale = locale;
     this.language = language;
     rule = this.t('pluralization_rule');
     if (rule === "")
      rule = 'function (n) { return n == 1 ? "one" : "other" }';
     eval("this.pluralizationKey = "+rule);
   },

   t: function(item, views) {
    var items = item.split("."),
      translatedMessage,
      nextNamespace;

    if(views && typeof views.count !== "undefined") {
      items.push(this.pluralizationKey(views.count));
    }

    while(nextNamespace = items.shift()) {
      translatedMessage = (translatedMessage)
        ? translatedMessage[nextNamespace]
        : this.locale[nextNamespace];

      if(typeof translatedMessage === "undefined") {
        return "";
      }
    }

    return _.template(translatedMessage, views || {});
   }
 };

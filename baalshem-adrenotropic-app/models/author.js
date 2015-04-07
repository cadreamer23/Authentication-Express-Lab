"use strict";
module.exports = function(sequelize, DataTypes) {
  var Author = sequelize.define("Author", {
    first_name: DataTypes.STRING,
    last_name: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
        this.hasMany(models.Article);
      }
    }
  });
  return Author;
};
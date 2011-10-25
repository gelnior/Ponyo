# Models
CategoryProvider = require("../models/models").CategoryProvider


# Home page
exports.index = (req, res) ->
  res.render "index", title: "Ponyo"


# Category list
exports.getCategories = (req, res)  ->
  categoryProvider = new CategoryProvider
  categoryProvider.getAll (err, docs) =>
    if err
       console.error(err.stack)
       docs = []
    res.json rows: docs

# Category creation
exports.newCategory = (req, res) ->
  name = req.body.name
  categoryProvider = new CategoryProvider

  if name
    categoryProvider.newCategory name, (err) ->
      if err
        console.error(err.stack)
        return res.json  success: false
      else
        return res.json  success: true
  else
    return res.json success: false


# Category page
exports.category = (req, res) ->
  categoryProvider = new CategoryProvider
  categoryProvider.getCategory req.params.category, (err, docs) ->
    if err
      console.error(err.stack)
      res.json 'I dont have that', 404
    else if docs
       res.json docs[0]
    else
       res.json 'I dont have that', 404



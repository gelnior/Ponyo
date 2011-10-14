p ->
  if @nbArticles
    "#{@nbArticles} for #{@category}"
  else
    "no articles for #{@category}"

h2 ->
  "Articles"

ul ->
  for article in @articles
    article.date + " - " + article.name


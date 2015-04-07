var express = require('express');
var bodyParser = require('body-parser'),
	ejs = require('ejs'),
	methodOverride = require('method-override'),
	pg = require("pg");


var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));

// Refactor connection and query code
var db = require("./models");

app.get('/articles', function(req,res) {
  db.Article
  	.findAll({ include: db.Author })
  	.then(function(dbArticles) {
  		res.render('articles/index', { articlesList: dbArticles });
  	})
});

app.get('/articles/new', function(req,res) {
	// First, we have to get the authors that we can add to the form as a dropdown
	db.Author.all().then(function(dbAuthors) {
		res.render('articles/new', { ejsAuthors: dbAuthors });		
	});
  
});

app.post('/articles', function(req,res) {
  db.Article
  	.create(req.body.article)
  	.then(function(dbArticle) {
  		res.redirect('/articles');
  	})
});

app.get('/articles/:id', function(req, res) {
  db.Article.find({ where: { id: req.params.id }, include: db.Author })
  	.then(function(dbArticle) {
  		res.render('articles/article', { articleToDisplay: dbArticle });
  	});
  
})

// Fill in these author routes!
app.get('/authors', function(req, res) {
	db.Author
		.all()
		.then(function(dbAuthors) {
			res.render('authors/index', { ejsAuthors: dbAuthors} );
		});
});

app.get('/authors/new', function(req, res) {
	res.render('authors/new');
});

app.post('/authors', function(req, res) {
	db.Author
		.create(req.body.author)
		.then(function(dbAuthor) {
			res.redirect('/authors');
		});
});

app.get('/authors/:id', function(req, res) {
	db.Author
		.find({ where: {id: req.params.id}, include: db.Article })
		.then(function(dbAuthor) {
			res.render('authors/author', { ejsAuthor: dbAuthor })
		})
});

app.get('/', function(req,res) {
  res.render('site/index.ejs');
});

app.get('/about', function(req,res) {
  res.render('site/about');
});

app.get('/contact', function(req,res) {
  res.render('site/contact');
});

app.get('/sync', function(req, res) {
	db.sequelize.sync().then(function() {
		res.send("Sequelize Synchronization is Complete!");
	})
});

app.listen(3000, function() {
  console.log('Listening');
});
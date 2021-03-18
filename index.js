const express = require("express");
const hbs = require("hbs");
const wax = require("wax-on");
const mysql = require("mysql2/promise");

let app = express();
app.set("view engine", "hbs");
app.use(express.static("public"));
wax.on(hbs.handlebars);
wax.setLayoutPath("./views/layouts");

app.use(express.urlencoded({ extended: false }));

async function main(){
    //create a SQL connection
    const connection = await mysql.createConnection({
        //host is ususally is the web address of the DB or (more commonly) an IP address 
        'host': 'localhost',
        'user':'root',
        'database':'sakila'
    })
    // let query='SELECT * from actor'
    // //array destructuring
    // let [actors]=await connection.execute('SELECT * from actor')
    // for (let a of actors){
    //     console.log(a)
    // }
    app.get('/actors', async (req,res)=>{
        let [actors]=await connection.execute('SELECT * from actor')
        res.render('actors',{
            'actors':actors
        })
    })

    app.get('/actors/create',async(req,res)=>{
        res.render('actor_create.hbs')
    })

    app.post('/actors/create',async (req,res)=>{
        let {first_name,last_name}=req.body

        let query=`insert into actor (first_name,last_name) VALUES (?,?)`;
        await connection.execute(query,[first_name,last_name]);
        res.redirect('/actors')
    })

    app.get('/actors/:actor_id/update', async (req,res)=>{
        //1.retreive actor you want to update
        let query='SELECT * from actor WHERE actor_id=?'
        let [actors]=await connection.execute(query,[req.params.actor_id])
        let actor=actors[0]
        res.render('actor_update',{
            'actor':actor
        })

    })

    app.post('/actors/:actor_id/update',async(req,res)=>{
        let {first_name,last_name}=req.body
        const query='UPDATE actor SET first_name=?,last_name=? WHERE actor_id=?'
        connection.execute(query,[first_name,last_name,req.params.actor_id])
        res.redirect('/actors')

    })

    app.get('/actors/:actor_id/delete', async (req,res)=>{
        let query='SELECT * FROM actor WHERE actor_id=?'
        let [actors]=await connection.execute(query,[req.params.actor_id])
        let actor=actors[0]
        res.render('actor_delete',{
            'actor':actor
        })
    })

    app.post('/actors/:actor_id/delete',async(req,res)=>{
        let query ='DELETE FROM actor WHERE actor_id=?'
        await connection.execute(query,[req.params.actor_id])
        res.redirect('/actors')
    })

    app.get('/films/create',async (req,res)=>{
        let [languages]=await connection.execute('SELECT * from language WHERE language=?')
        res.render('film_create',{
            'languages':languages
        })
    })
}
main();

require("handlebars-helpers")({
  handlebars: hbs.handlebars,
});

// ROUTES BEGIN HERE

app.listen(3000, () => {
  console.log("Server started");
});
const  { Sequelize }  = require("sequelize")

const sequelize = new Sequelize('litura', 'root','', {
    host: 'localhost',
    dialect: 'mariadb',
    port: 3307
});

sequelize.authenticate().then(()=>{
    console.log('authentification réussie')
}).catch((err)=>{
    console.log(err);
})

module.exports = sequelize
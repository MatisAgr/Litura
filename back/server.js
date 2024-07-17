const express = require('express');
const cors = require('cors');
const databaseRoute = require('./routes/databaseRoute');
const userRoute = require('./routes/userRoute');
const loisirRoute = require('./routes/loisirRoute');

const app = express();

app.use(cors());
app.use(express.json());


app.use ('/database', databaseRoute);
app.use('/user', userRoute);
app.use('/loisir', loisirRoute);


app.listen(8001, () => {
    console.log('Server is running on port 8001');
});

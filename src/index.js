const express=require("express");

const app = express();

app.get('/', (req, res) => {res.send("Hello everybody!!!")});

app.listen(3010, "0.0.0.0");
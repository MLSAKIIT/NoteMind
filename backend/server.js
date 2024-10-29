const app = require("./app");
const dotenv = require('dotenv');

dotenv.config();

const port = process.env.PORT;

app.get("/", (_, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
    console.log(`Server is up and listening on http://localhost:${port}`);
})
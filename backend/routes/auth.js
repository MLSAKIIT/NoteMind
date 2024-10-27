const express = require("express");
const router = express.Router();
const {
  register,
  login,
  update,
} = require("../controllers/authController");
const bearer = require("../middleware/auth");

router.post("/register", register);
router.patch('/users/update/:_id', update);
router.post("/login", bearer, login);

module.exports = router;

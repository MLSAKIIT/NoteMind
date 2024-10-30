const express = require("express");
const router = express.Router();
const {
  getMindMap,
  getMindMaps,
  createMindMap,
  updateMindMap,
  deleteMindMap
} = require("../controllers/mindMapController");
const auth = require("../middleware/auth");

router.get("/", auth, getMindMaps);
router.get("/:id", auth, getMindMap);
router.post("/", auth, createMindMap);
router.put("/:id", auth, updateMindMap);
router.delete("/:id", auth, deleteMindMap);

module.exports = router;
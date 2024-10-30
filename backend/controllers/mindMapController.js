const MindMap = require("../models/MindMap");

exports.getMindMap = async (req, res) => {
    try {
      const mindMap = await MindMap.findById(req.params.id)
        .populate("relatedNotes")
        .where({ user: req.user.id });
  
      if (!mindMap) {
        return res.status(404).json({ msg: "Mind map not found" });
      }
  
      res.json(mindMap);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
};
  
exports.createMindMap = async (req, res) => {
    try {
      const { title, description, relatedNotes } = req.body;
      const newMindMap = new MindMap({
        user: req.user.id,
        title,
        description,
        relatedNotes,
      });
      const mindMap = await newMindMap.save();
      res.json(mindMap);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
};

exports.getMindMaps = async (req, res) => {
    try {
      const mindMaps = await MindMap.find({ user: req.user.id })
        .populate("relatedNotes")
        .sort({ createdAt: -1 });
      res.json(mindMaps);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
};
  
exports.updateMindMap = async (req, res) => {
    try {
      const { title, description, relatedNotes } = req.body;
      let mindMap = await MindMap.findById(req.params.id);
      if (!mindMap) return res.status(404).json({ msg: "Mind map not found" });
      if (mindMap.user.toString() !== req.user.id) {
        return res.status(401).json({ msg: "Not authorized" });
      }
      mindMap = await MindMap.findByIdAndUpdate(
        req.params.id,
        { title, description, relatedNotes },
        { new: true },
      ).populate("relatedNotes");
      res.json(mindMap);
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
};
  
exports.deleteMindMap = async (req, res) => {
    try {
      const mindMap = await MindMap.findById(req.params.id);
      if (!mindMap) return res.status(404).json({ msg: "Mind map not found" });
      if (mindMap.user.toString() !== req.user.id) {
        return res.status(401).json({ msg: "Not authorized" });
      }
      await mindMap.remove();
      res.json({ msg: "Mind map removed" });
    } catch (err) {
      console.error(err.message);
      res.status(500).send("Server error");
    }
};
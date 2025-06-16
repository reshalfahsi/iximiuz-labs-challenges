export default function handler(req, res) {
  res.status(200).json({
    message: "2baf70dc51d5d1d7bd94",
    timestamp: new Date().toISOString(),
  });
}
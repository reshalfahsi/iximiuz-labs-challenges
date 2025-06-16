export default function handler(req, res) {
  res.status(200).json({
    message: "c1ad189448e7e6b7dd46",
    timestamp: new Date().toISOString(),
  });
}
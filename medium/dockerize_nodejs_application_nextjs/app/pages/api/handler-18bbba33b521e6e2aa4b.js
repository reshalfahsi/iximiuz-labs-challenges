export default function handler(req, res) {
  res.status(200).json({
    message: "18bbba33b521e6e2aa4b",
    timestamp: new Date().toISOString(),
  });
}
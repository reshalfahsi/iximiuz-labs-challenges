export default function handler(req, res) {
  res.status(200).json({
    message: "b5b98ecf5ee2083419ce",
    timestamp: new Date().toISOString(),
  });
}
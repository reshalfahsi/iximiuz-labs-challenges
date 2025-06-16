export default function handler(req, res) {
  res.status(200).json({
    message: "97fcff87304bf9218221",
    timestamp: new Date().toISOString(),
  });
}
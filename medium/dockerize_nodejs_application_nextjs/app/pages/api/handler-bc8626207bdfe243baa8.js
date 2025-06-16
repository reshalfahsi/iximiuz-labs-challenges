export default function handler(req, res) {
  res.status(200).json({
    message: "bc8626207bdfe243baa8",
    timestamp: new Date().toISOString(),
  });
}
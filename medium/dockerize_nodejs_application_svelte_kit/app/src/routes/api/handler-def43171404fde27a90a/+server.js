import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "def43171404fde27a90a",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "4ad2c08efe8d1dc8b94a",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
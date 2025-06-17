import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "21791309a6e51627c0ed",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
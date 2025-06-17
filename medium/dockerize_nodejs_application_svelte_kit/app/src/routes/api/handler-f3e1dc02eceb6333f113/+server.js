import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "f3e1dc02eceb6333f113",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
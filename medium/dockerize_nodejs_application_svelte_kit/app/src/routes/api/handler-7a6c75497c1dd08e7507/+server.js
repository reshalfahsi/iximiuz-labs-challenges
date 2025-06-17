import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "7a6c75497c1dd08e7507",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
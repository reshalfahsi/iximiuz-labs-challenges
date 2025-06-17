import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "5dbd0e6dd7cd97837ce4",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
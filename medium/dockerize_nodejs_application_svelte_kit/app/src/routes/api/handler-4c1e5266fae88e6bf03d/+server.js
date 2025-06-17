import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "4c1e5266fae88e6bf03d",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
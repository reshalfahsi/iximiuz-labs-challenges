import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "4560b7b19ba515375912",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
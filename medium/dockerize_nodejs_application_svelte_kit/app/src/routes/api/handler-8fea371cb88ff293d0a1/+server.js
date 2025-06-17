import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "8fea371cb88ff293d0a1",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}
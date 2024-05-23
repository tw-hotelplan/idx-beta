function handler(_req: Request): Response {
  return new Response("Hello, World!");
}

const options = {
  handler,
  port: Number(Deno.env.get("PORT"))
}

console.log(Deno.args);

Deno.serve(options);

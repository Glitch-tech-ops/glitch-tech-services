export async function onRequestPost(context) {
  const { request, env } = context;
  try {
    const body = await request.json();

    // Optional Cloudflare Turnstile verification.
    // Active only when TURNSTILE_SECRET_KEY is set in the Pages env.
    // If unset, behavior is identical to before.
    if (env.TURNSTILE_SECRET_KEY) {
      const token = body.turnstileToken;
      if (!token) {
        return json({ error: "Missing verification token." }, 403);
      }
      const verifyRes = await fetch(
        "https://challenges.cloudflare.com/turnstile/v0/siteverify",
        {
          method: "POST",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: new URLSearchParams({
            secret: env.TURNSTILE_SECRET_KEY,
            response: token
          })
        }
      );
      const verifyData = await verifyRes.json();
      if (!verifyData.success) {
        return json({ error: "Verification failed." }, 403);
      }
    }

    // Always strip the token before forwarding to Anthropic.
    if ("turnstileToken" in body) delete body.turnstileToken;

    const response = await fetch("https://api.anthropic.com/v1/messages", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-api-key": env.ANTHROPIC_API_KEY,
        "anthropic-version": "2023-06-01"
      },
      body: JSON.stringify(body)
    });
    const data = await response.json();
    return json(data, response.status);
  } catch (err) {
    return json({ error: err.message }, 500);
  }
}

export async function onRequestOptions() {
  return new Response(null, {
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Access-Control-Allow-Headers": "Content-Type"
    }
  });
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    }
  });
}

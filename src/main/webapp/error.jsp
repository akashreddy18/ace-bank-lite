<%-- Created by IntelliJ IDEA. User: suman Date: 08-02-2026 Time: 11:56 --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${errorTitle} – AceBank</title>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
                rel="stylesheet">

            <style>
                *,
                *::before,
                *::after {
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                }

                :root {
                    --navy: #0a1628;
                    --gold: #f5c518;
                    --white: #ffffff;
                    --muted: #94a3b8;
                    --red: #f87171;
                    --border: rgba(255, 255, 255, 0.08);
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background: var(--navy);
                    color: var(--white);
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    overflow: hidden;
                }

                /* Background */
                .bg-grid {
                    position: fixed;
                    inset: 0;
                    background-image:
                        linear-gradient(rgba(255, 255, 255, 0.025) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(255, 255, 255, 0.025) 1px, transparent 1px);
                    background-size: 48px 48px;
                    pointer-events: none;
                }

                .blob {
                    position: fixed;
                    border-radius: 50%;
                    filter: blur(90px);
                    pointer-events: none;
                }

                .blob-1 {
                    width: 500px;
                    height: 400px;
                    background: rgba(248, 113, 113, 0.07);
                    top: -100px;
                    right: -100px;
                }

                .blob-2 {
                    width: 400px;
                    height: 400px;
                    background: rgba(245, 197, 24, 0.05);
                    bottom: -100px;
                    left: -80px;
                }

                /* Error container */
                .error-container {
                    position: relative;
                    z-index: 10;
                    text-align: center;
                    animation: fadeIn 0.6s ease both;
                    padding: 40px 24px;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: scale(0.95) translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: scale(1) translateY(0);
                    }
                }

                /* Big error code */
                .error-code {
                    font-size: clamp(6rem, 18vw, 12rem);
                    font-weight: 900;
                    letter-spacing: -6px;
                    line-height: 1;
                    background: linear-gradient(135deg, var(--red) 0%, #fb923c 100%);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                    margin-bottom: 8px;
                    position: relative;
                }

                .error-code::after {
                    content: attr(data-code);
                    position: absolute;
                    inset: 0;
                    background: linear-gradient(135deg, rgba(248, 113, 113, 0.15) 0%, rgba(251, 146, 60, 0.08) 100%);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                    transform: translate(4px, 4px);
                    z-index: -1;
                }

                /* Glitch animation on error code */
                @keyframes glitch {
                    0% {
                        clip-path: inset(0 0 95% 0);
                        transform: translate(-3px, 0);
                    }

                    20% {
                        clip-path: inset(40% 0 50% 0);
                        transform: translate(3px, 0);
                    }

                    40% {
                        clip-path: inset(70% 0 20% 0);
                        transform: translate(-2px, 0);
                    }

                    60% {
                        clip-path: inset(15% 0 75% 0);
                        transform: translate(2px, 0);
                    }

                    80% {
                        clip-path: inset(55% 0 35% 0);
                        transform: translate(-1px, 0);
                    }

                    100% {
                        clip-path: inset(0 0 95% 0);
                        transform: translate(0);
                    }
                }

                /* Card */
                .error-card {
                    background: rgba(255, 255, 255, 0.03);
                    border: 1px solid var(--border);
                    border-radius: 24px;
                    padding: 48px 56px;
                    max-width: 560px;
                    margin: 0 auto;
                    backdrop-filter: blur(12px);
                    box-shadow: 0 32px 80px rgba(0, 0, 0, 0.5);
                }

                .error-icon {
                    font-size: 3.5rem;
                    margin-bottom: 20px;
                    display: block;
                    animation: shakeBounce 2s ease-in-out infinite;
                }

                @keyframes shakeBounce {

                    0%,
                    100% {
                        transform: translateY(0) rotate(0deg);
                    }

                    15% {
                        transform: translateY(-8px) rotate(-5deg);
                    }

                    30% {
                        transform: translateY(-12px) rotate(5deg);
                    }

                    45% {
                        transform: translateY(-6px) rotate(-3deg);
                    }

                    60% {
                        transform: translateY(0) rotate(0deg);
                    }
                }

                .error-title {
                    font-size: 1.6rem;
                    font-weight: 800;
                    letter-spacing: -0.5px;
                    margin-bottom: 12px;
                    color: var(--white);
                }

                .error-message {
                    color: var(--muted);
                    font-size: 0.95rem;
                    line-height: 1.7;
                    margin-bottom: 36px;
                }

                /* Buttons */
                .error-actions {
                    display: flex;
                    gap: 12px;
                    justify-content: center;
                    flex-wrap: wrap;
                }

                .btn-primary {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    background: linear-gradient(135deg, var(--gold), #ffaa00);
                    color: var(--navy);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.9rem;
                    font-weight: 700;
                    padding: 13px 28px;
                    border-radius: 12px;
                    text-decoration: none;
                    border: none;
                    cursor: pointer;
                    box-shadow: 0 4px 20px rgba(245, 197, 24, 0.3);
                    transition: transform 0.2s, box-shadow 0.2s;
                }

                .btn-primary:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 32px rgba(245, 197, 24, 0.45);
                }

                .btn-ghost {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    background: rgba(255, 255, 255, 0.05);
                    color: var(--white);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.9rem;
                    font-weight: 600;
                    padding: 13px 28px;
                    border-radius: 12px;
                    text-decoration: none;
                    border: 1px solid var(--border);
                    cursor: pointer;
                    transition: background 0.2s, transform 0.2s;
                }

                .btn-ghost:hover {
                    background: rgba(255, 255, 255, 0.1);
                    transform: translateY(-2px);
                }

                /* Brand footer */
                .err-footer {
                    margin-top: 40px;
                    color: var(--muted);
                    font-size: 0.82rem;
                }

                .err-footer a {
                    color: var(--gold);
                    text-decoration: none;
                    font-weight: 600;
                }

                @media (max-width: 480px) {
                    .error-card {
                        padding: 36px 24px;
                    }
                }
            </style>
        </head>

        <body>

            <div class="bg-grid"></div>
            <div class="blob blob-1"></div>
            <div class="blob blob-2"></div>

            <div class="error-container">
                <div class="error-code" data-code="${errorCode}">${errorCode}</div>

                <div class="error-card">
                    <span class="error-icon">🚨</span>
                    <h1 class="error-title">${errorTitle}</h1>
                    <p class="error-message">${errorMessage}</p>

                    <div class="error-actions">
                        <a href="${pageContext.request.contextPath}/home" class="btn-primary" id="dashboardBtn">
                            🏠 Return to Dashboard
                        </a>
                        <button class="btn-ghost" onclick="history.back()" id="backBtn">
                            ← Go Back
                        </button>
                    </div>
                </div>

                <div class="err-footer">
                    Need help? Contact <a href="#">Ace Bank Support</a>
                </div>
            </div>

            <script>
                // Auto-redirect countdown (optional)
                const code = '${errorCode}';
                if (code === '401' || code === '403') {
                    // Could add a countdown redirect to login
                    setTimeout(() => {
                        window.location.href = '${pageContext.request.contextPath}/login.jsp';
                    }, 8000);
                }
            </script>

        </body>

        </html>
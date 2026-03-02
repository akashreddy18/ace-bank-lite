<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <% String savedAccount="" ; Cookie[] cookies=request.getCookies(); if (cookies !=null) { for (Cookie c :
            cookies) { if ("rememberedAccount".equals(c.getName())) { savedAccount=c.getValue();
            pageContext.setAttribute("savedAccount", savedAccount); } } } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login | AceBank</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
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
                        --navy-mid: #0f2044;
                        --gold: #f5c518;
                        --gold-dk: #d4a800;
                        --white: #ffffff;
                        --muted: #94a3b8;
                        --border: rgba(255, 255, 255, 0.08);
                        --error: #f87171;
                        --success: #4ade80;
                    }

                    body {
                        font-family: 'Inter', sans-serif;
                        background: var(--navy);
                        color: var(--white);
                        min-height: 100vh;
                        overflow: hidden;
                    }

                    /* Background grid */
                    .bg-grid {
                        position: fixed;
                        inset: 0;
                        background-image:
                            linear-gradient(rgba(255, 255, 255, 0.025) 1px, transparent 1px),
                            linear-gradient(90deg, rgba(255, 255, 255, 0.025) 1px, transparent 1px);
                        background-size: 48px 48px;
                        animation: gridMove 20s linear infinite;
                    }

                    @keyframes gridMove {
                        0% {
                            transform: translate(0, 0);
                        }

                        100% {
                            transform: translate(48px, 48px);
                        }
                    }

                    /* Glowing blobs */
                    .blob {
                        position: fixed;
                        border-radius: 50%;
                        filter: blur(100px);
                        pointer-events: none;
                        animation: blobPulse 6s ease-in-out infinite;
                    }

                    .blob-1 {
                        width: 500px;
                        height: 500px;
                        background: rgba(245, 197, 24, 0.07);
                        top: -150px;
                        right: -100px;
                    }

                    .blob-2 {
                        width: 400px;
                        height: 400px;
                        background: rgba(59, 130, 246, 0.07);
                        bottom: -100px;
                        left: -100px;
                        animation-delay: 3s;
                    }

                    @keyframes blobPulse {

                        0%,
                        100% {
                            transform: scale(1);
                        }

                        50% {
                            transform: scale(1.15);
                        }
                    }

                    /* Page layout */
                    .page {
                        position: relative;
                        z-index: 10;
                        min-height: 100vh;
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                    }

                    /* Left panel */
                    .left-panel {
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        padding: 60px;
                        background: rgba(245, 197, 24, 0.03);
                        border-right: 1px solid var(--border);
                    }

                    .brand {
                        font-size: 2rem;
                        font-weight: 800;
                        color: var(--white);
                        text-decoration: none;
                        margin-bottom: 48px;
                        display: block;
                    }

                    .brand span {
                        color: var(--gold);
                    }

                    .left-headline {
                        font-size: clamp(2rem, 3.5vw, 3rem);
                        font-weight: 800;
                        letter-spacing: -1.5px;
                        line-height: 1.1;
                        margin-bottom: 20px;
                    }

                    .left-headline em {
                        color: var(--gold);
                        font-style: normal;
                    }

                    .left-sub {
                        color: var(--muted);
                        font-size: 1rem;
                        line-height: 1.7;
                        margin-bottom: 48px;
                        max-width: 380px;
                    }

                    .trust-items {
                        display: flex;
                        flex-direction: column;
                        gap: 16px;
                    }

                    .trust-item {
                        display: flex;
                        align-items: center;
                        gap: 14px;
                        color: var(--muted);
                        font-size: 0.88rem;
                        font-weight: 500;
                    }

                    .trust-dot {
                        width: 36px;
                        height: 36px;
                        border-radius: 10px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 1rem;
                        flex-shrink: 0;
                    }

                    .td-gold {
                        background: rgba(245, 197, 24, 0.12);
                    }

                    .td-blue {
                        background: rgba(59, 130, 246, 0.12);
                    }

                    .td-green {
                        background: rgba(74, 222, 128, 0.12);
                    }

                    /* Right panel - form */
                    .right-panel {
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        align-items: center;
                        padding: 60px 40px;
                        overflow-y: auto;
                    }

                    .auth-card {
                        width: 100%;
                        max-width: 420px;
                        animation: slideIn 0.5s ease both;
                    }

                    @keyframes slideIn {
                        from {
                            opacity: 0;
                            transform: translateY(24px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .back-link {
                        display: inline-flex;
                        align-items: center;
                        gap: 6px;
                        color: var(--muted);
                        font-size: 0.84rem;
                        text-decoration: none;
                        margin-bottom: 36px;
                        transition: color 0.2s;
                    }

                    .back-link:hover {
                        color: var(--white);
                    }

                    .auth-card h2 {
                        font-size: 1.9rem;
                        font-weight: 800;
                        letter-spacing: -1px;
                        margin-bottom: 8px;
                    }

                    .auth-card .subtitle {
                        color: var(--muted);
                        font-size: 0.9rem;
                        margin-bottom: 36px;
                    }

                    /* Error banner */
                    .error-banner {
                        display: none;
                        background: rgba(248, 113, 113, 0.1);
                        border: 1px solid rgba(248, 113, 113, 0.3);
                        color: var(--error);
                        padding: 12px 16px;
                        border-radius: 10px;
                        font-size: 0.85rem;
                        margin-bottom: 20px;
                        align-items: center;
                        gap: 8px;
                    }

                    .error-banner.show {
                        display: flex;
                    }

                    /* Form fields */
                    .field {
                        margin-bottom: 20px;
                    }

                    .field label {
                        display: block;
                        font-size: 0.82rem;
                        font-weight: 600;
                        color: var(--muted);
                        margin-bottom: 8px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .input-wrap {
                        position: relative;
                    }

                    .input-wrap input {
                        width: 100%;
                        padding: 14px 48px 14px 16px;
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border);
                        border-radius: 12px;
                        color: var(--white);
                        font-size: 0.95rem;
                        font-family: 'Inter', sans-serif;
                        outline: none;
                        transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
                    }

                    .input-wrap input::placeholder {
                        color: rgba(148, 163, 184, 0.5);
                    }

                    .input-wrap input:focus {
                        border-color: rgba(245, 197, 24, 0.5);
                        background: rgba(255, 255, 255, 0.08);
                        box-shadow: 0 0 0 3px rgba(245, 197, 24, 0.12);
                    }

                    .input-wrap input.error-field {
                        border-color: var(--error);
                    }

                    .toggle-eye {
                        position: absolute;
                        right: 14px;
                        top: 50%;
                        transform: translateY(-50%);
                        background: none;
                        border: none;
                        color: var(--muted);
                        cursor: pointer;
                        font-size: 1rem;
                        padding: 2px;
                        transition: color 0.2s;
                    }

                    .toggle-eye:hover {
                        color: var(--white);
                    }

                    /* Row: remember + forgot */
                    .row-check {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 24px;
                    }

                    .checkbox-label {
                        display: flex;
                        align-items: center;
                        gap: 8px;
                        font-size: 0.84rem;
                        color: var(--muted);
                        cursor: pointer;
                        user-select: none;
                    }

                    .checkbox-label input[type="checkbox"] {
                        display: none;
                    }

                    .custom-check {
                        width: 18px;
                        height: 18px;
                        border: 1.5px solid var(--border);
                        border-radius: 5px;
                        background: transparent;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        transition: background 0.2s, border-color 0.2s;
                        font-size: 0.7rem;
                        color: var(--navy);
                    }

                    .checkbox-label input:checked+.custom-check {
                        background: var(--gold);
                        border-color: var(--gold);
                    }

                    .custom-check::after {
                        content: '✓';
                        display: none;
                    }

                    .checkbox-label input:checked+.custom-check::after {
                        display: block;
                    }

                    .forgot-link {
                        font-size: 0.84rem;
                        color: var(--gold);
                        text-decoration: none;
                        font-weight: 500;
                    }

                    .forgot-link:hover {
                        text-decoration: underline;
                    }

                    /* Submit button */
                    .btn-submit {
                        width: 100%;
                        padding: 15px;
                        background: linear-gradient(135deg, var(--gold) 0%, #ffaa00 100%);
                        color: var(--navy);
                        font-size: 1rem;
                        font-weight: 700;
                        font-family: 'Inter', sans-serif;
                        border: none;
                        border-radius: 12px;
                        cursor: pointer;
                        transition: transform 0.2s, box-shadow 0.2s, opacity 0.2s;
                        box-shadow: 0 4px 24px rgba(245, 197, 24, 0.3);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 8px;
                        position: relative;
                        overflow: hidden;
                    }

                    .btn-submit:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 32px rgba(245, 197, 24, 0.45);
                    }

                    .btn-submit:active {
                        transform: translateY(0);
                    }

                    .btn-submit.loading {
                        opacity: 0.7;
                        pointer-events: none;
                    }

                    .btn-submit .spinner {
                        width: 18px;
                        height: 18px;
                        border: 2px solid rgba(10, 22, 40, 0.3);
                        border-top-color: var(--navy);
                        border-radius: 50%;
                        animation: spin 0.7s linear infinite;
                        display: none;
                    }

                    .btn-submit.loading .spinner {
                        display: block;
                    }

                    .btn-submit.loading .btn-label {
                        opacity: 0.5;
                    }

                    @keyframes spin {
                        to {
                            transform: rotate(360deg);
                        }
                    }

                    .divider {
                        display: flex;
                        align-items: center;
                        gap: 12px;
                        margin: 24px 0;
                        color: var(--muted);
                        font-size: 0.8rem;
                    }

                    .divider::before,
                    .divider::after {
                        content: '';
                        flex: 1;
                        height: 1px;
                        background: var(--border);
                    }

                    .signup-link {
                        text-align: center;
                        font-size: 0.88rem;
                        color: var(--muted);
                    }

                    .signup-link a {
                        color: var(--gold);
                        text-decoration: none;
                        font-weight: 600;
                    }

                    .signup-link a:hover {
                        text-decoration: underline;
                    }

                    /* Responsive */
                    @media (max-width: 768px) {
                        .page {
                            grid-template-columns: 1fr;
                        }

                        .left-panel {
                            display: none;
                        }

                        .right-panel {
                            padding: 40px 24px;
                        }
                    }
                </style>
            </head>

            <body>

                <div class="bg-grid"></div>
                <div class="blob blob-1"></div>
                <div class="blob blob-2"></div>

                <div class="page">
                    <!-- Left Panel -->
                    <div class="left-panel">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="brand">Ace<span>Bank</span></a>
                        <h1 class="left-headline">Your money,<br>your <em>control</em></h1>
                        <p class="left-sub">Ace Bank gives you full transparency and control over every rupee. Secure,
                            fast, and always in your pocket.</p>
                        <div class="trust-items">
                            <div class="trust-item">
                                <div class="trust-dot td-gold">🔒</div>
                                <span>256-bit AES bank-grade encryption</span>
                            </div>
                            <div class="trust-item">
                                <div class="trust-dot td-blue">⚡</div>
                                <span>Instant transactions with zero fees</span>
                            </div>
                            <div class="trust-item">
                                <div class="trust-dot td-green">✅</div>
                                <span>2M+ active users trust Ace Bank daily</span>
                            </div>
                        </div>
                    </div>

                    <!-- Right Panel -->
                    <div class="right-panel">
                        <div class="auth-card">
                            <a href="${pageContext.request.contextPath}/index.jsp" class="back-link">← Back to Home</a>
                            <h2>Welcome back</h2>
                            <p class="subtitle">Sign in to access your account dashboard.</p>

                            <div class="error-banner" id="errorBanner">
                                <span>⚠</span>
                                <span id="errorMsg">Invalid account number or password.</span>
                            </div>

                            <form action="Login" method="POST" id="loginForm" novalidate>
                                <div class="field">
                                    <label for="accNo">Account Number</label>
                                    <div class="input-wrap">
                                        <input type="text" id="accNo" name="accountNumber" value="${savedAccount}"
                                            required placeholder="Enter your account number" autocomplete="username">
                                    </div>
                                </div>

                                <div class="field">
                                    <label for="pass">Password</label>
                                    <div class="input-wrap">
                                        <input type="password" id="pass" name="password" required
                                            placeholder="••••••••••" autocomplete="current-password">
                                        <button type="button" class="toggle-eye" id="eyeBtn"
                                            aria-label="Toggle password visibility">👁</button>
                                    </div>
                                </div>

                                <div class="row-check">
                                    <label class="checkbox-label" for="remember">
                                        <input type="checkbox" name="rememberMe" id="remember" ${not empty savedAccount
                                            ? 'checked' : '' }>
                                        <span class="custom-check"></span>
                                        Remember me
                                    </label>
                                    <a href="${pageContext.request.contextPath}/forgot-password"
                                        class="forgot-link">Forgot password?</a>
                                </div>

                                <button type="submit" class="btn-submit" id="loginBtn">
                                    <div class="spinner"></div>
                                    <span class="btn-label">Login to Account</span>
                                </button>
                            </form>

                            <div class="divider">or</div>
                            <div class="signup-link">
                                New to Ace Bank? <a href="${pageContext.request.contextPath}/sign-up.jsp">Create an
                                    account</a>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    // ── Toggle password visibility ──
                    const eyeBtn = document.getElementById('eyeBtn');
                    const passInput = document.getElementById('pass');
                    eyeBtn.addEventListener('click', () => {
                        const isHidden = passInput.type === 'password';
                        passInput.type = isHidden ? 'text' : 'password';
                        eyeBtn.textContent = isHidden ? '🙈' : '👁';
                    });

                    // ── Form validation + loading state ──
                    const loginForm = document.getElementById('loginForm');
                    const loginBtn = document.getElementById('loginBtn');
                    const errorBanner = document.getElementById('errorBanner');

                    loginForm.addEventListener('submit', function (e) {
                        const acc = document.getElementById('accNo').value.trim();
                        const pass = document.getElementById('pass').value.trim();

                        if (!acc || !pass) {
                            e.preventDefault();
                            errorBanner.querySelector('#errorMsg').textContent = 'Please fill in all fields.';
                            errorBanner.classList.add('show');
                            [document.getElementById('accNo'), document.getElementById('pass')].forEach(el => {
                                if (!el.value.trim()) el.classList.add('error-field');
                            });
                            return;
                        }
                        // Show loading
                        loginBtn.classList.add('loading');
                        loginBtn.querySelector('.btn-label').textContent = 'Signing in…';
                    });

                    // Remove error styling on input
                    document.querySelectorAll('input').forEach(input => {
                        input.addEventListener('input', () => {
                            input.classList.remove('error-field');
                            errorBanner.classList.remove('show');
                        });
                    });

                    // Remember Me toggle feedback
                    const rememberBox = document.getElementById('remember');
                    rememberBox.addEventListener('change', function () {
                        console.log('Remember Me:', this.checked);
                    });
                </script>
            </body>

            </html>
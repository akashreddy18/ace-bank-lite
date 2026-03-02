<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Get Started | AceBank</title>
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
            }

            /* Background */
            .bg-gradient {
                position: fixed;
                inset: 0;
                background:
                    radial-gradient(ellipse 60% 40% at 80% 10%, rgba(59, 130, 246, 0.06) 0%, transparent 70%),
                    radial-gradient(ellipse 50% 50% at 20% 90%, rgba(245, 197, 24, 0.06) 0%, transparent 70%);
                pointer-events: none;
                z-index: 0;
            }

            /* Dots pattern */
            .bg-dots {
                position: fixed;
                inset: 0;
                background-image: radial-gradient(rgba(255, 255, 255, 0.04) 1px, transparent 1px);
                background-size: 32px 32px;
                pointer-events: none;
                z-index: 0;
            }

            /* Page */
            .page {
                position: relative;
                z-index: 1;
                min-height: 100vh;
                display: grid;
                grid-template-columns: 1fr 1fr;
            }

            /* Left side */
            .left-side {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 60px;
                border-right: 1px solid var(--border);
            }

            .brand {
                font-size: 2rem;
                font-weight: 800;
                color: var(--white);
                text-decoration: none;
                margin-bottom: 64px;
                display: block;
            }

            .brand span {
                color: var(--gold);
            }

            .left-side h1 {
                font-size: clamp(2rem, 3.5vw, 3rem);
                font-weight: 800;
                letter-spacing: -1.5px;
                line-height: 1.1;
                margin-bottom: 20px;
            }

            .left-side h1 em {
                color: var(--gold);
                font-style: normal;
            }

            .left-side p {
                color: var(--muted);
                font-size: 0.95rem;
                line-height: 1.7;
                margin-bottom: 48px;
                max-width: 380px;
            }

            /* Perks list */
            .perks {
                list-style: none;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .perk {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .perk-icon {
                width: 42px;
                height: 42px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.1rem;
                flex-shrink: 0;
            }

            .pi-gold {
                background: rgba(245, 197, 24, 0.1);
            }

            .pi-blue {
                background: rgba(59, 130, 246, 0.1);
            }

            .pi-green {
                background: rgba(74, 222, 128, 0.1);
            }

            .pi-purple {
                background: rgba(99, 102, 241, 0.1);
            }

            .perk-text strong {
                display: block;
                font-size: 0.9rem;
                font-weight: 600;
                color: var(--white);
                margin-bottom: 2px;
            }

            .perk-text span {
                font-size: 0.8rem;
                color: var(--muted);
            }

            /* Right / form side */
            .right-side {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 60px 40px;
                overflow-y: auto;
            }

            .form-card {
                width: 100%;
                max-width: 440px;
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

            .form-card h2 {
                font-size: 1.9rem;
                font-weight: 800;
                letter-spacing: -1px;
                margin-bottom: 6px;
            }

            .form-card .subtitle {
                color: var(--muted);
                font-size: 0.88rem;
                margin-bottom: 32px;
            }

            /* Steps indicator */
            .step-progress {
                display: flex;
                align-items: center;
                gap: 0;
                margin-bottom: 32px;
            }

            .sp-step {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 0.78rem;
                font-weight: 600;
                color: var(--muted);
            }

            .sp-step.active {
                color: var(--gold);
            }

            .sp-step.done {
                color: var(--success);
            }

            .sp-dot {
                width: 26px;
                height: 26px;
                border-radius: 50%;
                border: 2px solid var(--border);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 0.72rem;
                font-weight: 700;
                transition: all 0.3s;
            }

            .sp-step.active .sp-dot {
                border-color: var(--gold);
                color: var(--gold);
                background: rgba(245, 197, 24, 0.1);
            }

            .sp-step.done .sp-dot {
                border-color: var(--success);
                color: var(--navy);
                background: var(--success);
            }

            .sp-line {
                flex: 1;
                height: 1px;
                background: var(--border);
                margin: 0 8px;
            }

            .sp-line.done {
                background: var(--success);
            }

            /* Field */
            .field {
                margin-bottom: 18px;
            }

            .field label {
                display: block;
                font-size: 0.78rem;
                font-weight: 600;
                color: var(--muted);
                margin-bottom: 8px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .field-row {
                display: flex;
                gap: 12px;
            }

            .field-row .field {
                flex: 1;
            }

            .input-wrap {
                position: relative;
            }

            .input-wrap input {
                width: 100%;
                padding: 14px 16px;
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid var(--border);
                border-radius: 12px;
                color: var(--white);
                font-size: 0.95rem;
                font-family: 'Inter', sans-serif;
                outline: none;
                transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
            }

            .input-wrap input[type="password"] {
                padding-right: 48px;
            }

            .input-wrap input::placeholder {
                color: rgba(148, 163, 184, 0.45);
            }

            .input-wrap input:focus {
                border-color: rgba(245, 197, 24, 0.5);
                background: rgba(255, 255, 255, 0.08);
                box-shadow: 0 0 0 3px rgba(245, 197, 24, 0.1);
            }

            .input-wrap input.error-field {
                border-color: var(--error);
                box-shadow: 0 0 0 3px rgba(248, 113, 113, 0.1);
            }

            .input-wrap input.valid-field {
                border-color: rgba(74, 222, 128, 0.4);
            }

            /* Inline error */
            .field-error {
                font-size: 0.75rem;
                color: var(--error);
                margin-top: 6px;
                display: none;
            }

            .field-error.show {
                display: block;
            }

            /* Password strength */
            .pwd-strength {
                margin-top: 8px;
            }

            .strength-bars {
                display: flex;
                gap: 4px;
                margin-bottom: 4px;
            }

            .strength-bar {
                flex: 1;
                height: 3px;
                border-radius: 2px;
                background: var(--border);
                transition: background 0.3s;
            }

            .strength-label {
                font-size: 0.72rem;
                color: var(--muted);
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
                transition: color 0.2s;
            }

            .toggle-eye:hover {
                color: var(--white);
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
                margin-top: 8px;
                transition: transform 0.2s, box-shadow 0.2s, opacity 0.2s;
                box-shadow: 0 4px 24px rgba(245, 197, 24, 0.3);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
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

            .spinner {
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

            @keyframes spin {
                to {
                    transform: rotate(360deg);
                }
            }

            .terms-note {
                font-size: 0.75rem;
                color: var(--muted);
                text-align: center;
                margin-top: 14px;
                line-height: 1.5;
            }

            .terms-note a {
                color: var(--gold);
                text-decoration: none;
            }

            .login-link {
                text-align: center;
                font-size: 0.88rem;
                color: var(--muted);
                margin-top: 20px;
            }

            .login-link a {
                color: var(--gold);
                text-decoration: none;
                font-weight: 600;
            }

            .login-link a:hover {
                text-decoration: underline;
            }

            @media (max-width: 768px) {
                .page {
                    grid-template-columns: 1fr;
                }

                .left-side {
                    display: none;
                }

                .right-side {
                    padding: 40px 20px;
                }
            }
        </style>
    </head>

    <body>

        <div class="bg-gradient"></div>
        <div class="bg-dots"></div>

        <div class="page">
            <!-- Left Side -->
            <div class="left-side">
                <a href="${pageContext.request.contextPath}/index.jsp" class="brand">Ace<span>Bank</span></a>
                <h1>Start your<br>financial <em>journey</em></h1>
                <p>Open a free Ace Bank account in under 2 minutes. Join millions who already bank smarter.</p>

                <ul class="perks">
                    <li class="perk">
                        <div class="perk-icon pi-gold">🎁</div>
                        <div class="perk-text">
                            <strong>Zero opening fees</strong>
                            <span>No minimum balance, no hidden charges</span>
                        </div>
                    </li>
                    <li class="perk">
                        <div class="perk-icon pi-blue">⚡</div>
                        <div class="perk-text">
                            <strong>Instant activation</strong>
                            <span>Your account is ready in minutes</span>
                        </div>
                    </li>
                    <li class="perk">
                        <div class="perk-icon pi-green">🛡️</div>
                        <div class="perk-text">
                            <strong>Fully insured & FDIC backed</strong>
                            <span>Your money is always protected</span>
                        </div>
                    </li>
                    <li class="perk">
                        <div class="perk-icon pi-purple">📊</div>
                        <div class="perk-text">
                            <strong>AI-powered insights</strong>
                            <span>Smart tips to grow your savings</span>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Right / Form Side -->
            <div class="right-side">
                <div class="form-card">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="back-link">← Back to Home</a>
                    <h2>Create Account</h2>
                    <p class="subtitle">Join thousands of users managing money smarter.</p>

                    <!-- Step progress -->
                    <div class="step-progress">
                        <div class="sp-step active" id="sp1">
                            <div class="sp-dot">1</div>
                            <span>Details</span>
                        </div>
                        <div class="sp-line" id="sp-line-1"></div>
                        <div class="sp-step" id="sp2">
                            <div class="sp-dot">2</div>
                            <span>Security</span>
                        </div>
                        <div class="sp-line" id="sp-line-2"></div>
                        <div class="sp-step" id="sp3">
                            <div class="sp-dot">3</div>
                            <span>Verify</span>
                        </div>
                    </div>

                    <form action="signup" method="POST" id="signup-form" novalidate>
                        <!-- Name row -->
                        <div class="field-row">
                            <div class="field">
                                <label for="firstName">First Name</label>
                                <div class="input-wrap">
                                    <input type="text" name="firstName" id="firstName" placeholder="Akash" required
                                        autocomplete="given-name">
                                </div>
                                <div class="field-error" id="err-firstName">First name is required.</div>
                            </div>
                            <div class="field">
                                <label for="lastName">Last Name</label>
                                <div class="input-wrap">
                                    <input type="text" name="lastName" id="lastName" placeholder="Kumar" required
                                        autocomplete="family-name">
                                </div>
                                <div class="field-error" id="err-lastName">Last name is required.</div>
                            </div>
                        </div>

                        <!-- Aadhar -->
                        <div class="field">
                            <label for="aadharNumber">Aadhar Number</label>
                            <div class="input-wrap">
                                <input type="text" name="aadharNumber" id="aadharNumber" placeholder="XXXX XXXX XXXX"
                                    maxlength="14" required autocomplete="off" inputmode="numeric">
                            </div>
                            <div class="field-error" id="err-aadhar">Must be exactly 12 digits.</div>
                        </div>

                        <!-- Email -->
                        <div class="field">
                            <label for="email">Email Address</label>
                            <div class="input-wrap">
                                <input type="email" name="email" id="email" placeholder="you@example.com" required
                                    autocomplete="email">
                            </div>
                            <div class="field-error" id="err-email">Enter a valid email address.</div>
                        </div>

                        <!-- Password -->
                        <div class="field">
                            <label for="password">Password</label>
                            <div class="input-wrap">
                                <input type="password" name="password" id="password" placeholder="Min. 10 characters"
                                    required autocomplete="new-password">
                                <button type="button" class="toggle-eye" id="pwdEyeBtn"
                                    aria-label="Toggle password">👁</button>
                            </div>
                            <div class="pwd-strength" id="pwdStrength" style="display:none;">
                                <div class="strength-bars">
                                    <div class="strength-bar" id="sb1"></div>
                                    <div class="strength-bar" id="sb2"></div>
                                    <div class="strength-bar" id="sb3"></div>
                                    <div class="strength-bar" id="sb4"></div>
                                </div>
                                <div class="strength-label" id="strength-label">Weak</div>
                            </div>
                            <div class="field-error" id="err-password">Password must be at least 10 characters.</div>
                        </div>

                        <button type="submit" class="btn-submit" id="submit-btn">
                            <div class="spinner" id="submitSpinner"></div>
                            <span id="btnLabel">Create My Account →</span>
                        </button>

                        <p class="terms-note">
                            By creating an account you agree to our
                            <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.
                        </p>
                    </form>

                    <div class="login-link">
                        Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Sign in</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // ── Password visibility toggle ──
            const pwdInput = document.getElementById('password');
            const pwdEyeBtn = document.getElementById('pwdEyeBtn');
            pwdEyeBtn.addEventListener('click', () => {
                const isHidden = pwdInput.type === 'password';
                pwdInput.type = isHidden ? 'text' : 'password';
                pwdEyeBtn.textContent = isHidden ? '🙈' : '👁';
            });

            // ── Aadhar number formatting (XXXX XXXX XXXX) ──
            const aadharInput = document.getElementById('aadharNumber');
            aadharInput.addEventListener('input', function () {
                let val = this.value.replace(/\D/g, '').substring(0, 12);
                this.value = val.replace(/(\d{4})(?=\d)/g, '$1 ');
            });

            // ── Password strength ──
            const strengthDiv = document.getElementById('pwdStrength');
            const strengthLabel = document.getElementById('strength-label');
            const bars = [document.getElementById('sb1'), document.getElementById('sb2'),
            document.getElementById('sb3'), document.getElementById('sb4')];
            const colors = ['#f87171', '#fb923c', '#facc15', '#4ade80'];
            const labels = ['Weak', 'Fair', 'Good', 'Strong'];

            function calcStrength(pwd) {
                let score = 0;
                if (pwd.length >= 10) score++;
                if (/[A-Z]/.test(pwd)) score++;
                if (/[0-9]/.test(pwd)) score++;
                if (/[^A-Za-z0-9]/.test(pwd)) score++;
                return score;
            }

            pwdInput.addEventListener('input', function () {
                const val = this.value;
                if (!val) { strengthDiv.style.display = 'none'; return; }
                strengthDiv.style.display = 'block';
                const score = Math.min(calcStrength(val), 4);
                bars.forEach((b, i) => {
                    b.style.background = i < score ? colors[score - 1] : 'var(--border)';
                });
                strengthLabel.textContent = labels[score - 1] || 'Weak';
                strengthLabel.style.color = score >= 3 ? '#4ade80' : score === 2 ? '#facc15' : '#f87171';
            });

            // ── Form validation ──
            const form = document.getElementById('signup-form');

            function showErr(id, show) {
                const el = document.getElementById(id);
                if (el) el.classList.toggle('show', show);
            }
            function markField(inputId, valid) {
                const input = document.getElementById(inputId);
                if (!input) return;
                input.classList.toggle('error-field', !valid);
                input.classList.toggle('valid-field', valid);
            }

            form.addEventListener('submit', function (e) {
                let valid = true;

                const fn = document.getElementById('firstName').value.trim();
                const ln = document.getElementById('lastName').value.trim();
                const aadhar = aadharInput.value.replace(/\s/g, '');
                const email = document.getElementById('email').value.trim();
                const pwd = pwdInput.value;

                // First name
                const fnOk = fn.length > 0;
                showErr('err-firstName', !fnOk); markField('firstName', fnOk);
                if (!fnOk) valid = false;

                // Last name
                const lnOk = ln.length > 0;
                showErr('err-lastName', !lnOk); markField('lastName', lnOk);
                if (!lnOk) valid = false;

                // Aadhar
                const aOk = aadhar.length === 12 && /^\d{12}$/.test(aadhar);
                showErr('err-aadhar', !aOk); markField('aadharNumber', aOk);
                if (!aOk) valid = false;

                // Email
                const eOk = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
                showErr('err-email', !eOk); markField('email', eOk);
                if (!eOk) valid = false;

                // Password
                const pOk = pwd.length >= 10;
                showErr('err-password', !pOk); markField('password', pOk);
                if (!pOk) valid = false;

                if (!valid) { e.preventDefault(); return; }

                // Strip spaces from aadhar before submit
                aadharInput.value = aadhar;

                // Show loading
                const btn = document.getElementById('submit-btn');
                btn.classList.add('loading');
                document.getElementById('btnLabel').textContent = 'Creating account…';

                // Simulate step progress
                setTimeout(() => {
                    document.getElementById('sp1').classList.remove('active');
                    document.getElementById('sp1').classList.add('done');
                    document.getElementById('sp-line-1').classList.add('done');
                    document.getElementById('sp2').classList.add('active');
                }, 400);
                setTimeout(() => {
                    document.getElementById('sp2').classList.remove('active');
                    document.getElementById('sp2').classList.add('done');
                    document.getElementById('sp-line-2').classList.add('done');
                    document.getElementById('sp3').classList.add('active');
                }, 900);
            });

            // Clear error on input
            document.querySelectorAll('input').forEach(input => {
                input.addEventListener('input', () => {
                    input.classList.remove('error-field');
                });
            });
        </script>

    </body>

    </html>
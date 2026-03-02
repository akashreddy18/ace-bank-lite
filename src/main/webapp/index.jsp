<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
            content="Ace Bank – Modern digital banking made simple. Manage, spend, and save with confidence.">
        <title>Ace Bank – Banking Made Easy</title>

        <!-- Google Fonts -->
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
                --navy-mid: #0f2044;
                --navy-card: rgba(15, 32, 68, 0.75);
                --gold: #f5c518;
                --gold-dark: #d4a800;
                --accent: #3b82f6;
                --accent2: #6366f1;
                --white: #ffffff;
                --muted: #94a3b8;
                --border: rgba(255, 255, 255, 0.08);
                --radius-lg: 20px;
                --radius-sm: 10px;
                --transition: 0.3s ease;
            }

            html {
                scroll-behavior: smooth;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: var(--navy);
                color: var(--white);
                overflow-x: hidden;
                min-height: 100vh;
            }

            /* ── CANVAS BACKGROUND ── */
            #bg-canvas {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            /* ── NAVBAR ── */
            .navbar {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 100;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 18px 5%;
                background: rgba(10, 22, 40, 0.7);
                backdrop-filter: blur(18px);
                -webkit-backdrop-filter: blur(18px);
                border-bottom: 1px solid var(--border);
                transition: padding var(--transition);
            }

            .navbar.scrolled {
                padding: 12px 5%;
            }

            .logo {
                font-size: 1.6rem;
                font-weight: 800;
                letter-spacing: -0.5px;
                text-decoration: none;
                color: var(--white);
            }

            .logo span {
                color: var(--gold);
            }

            .nav-links {
                display: flex;
                gap: 8px;
                align-items: center;
                list-style: none;
            }

            .nav-links a {
                color: var(--muted);
                text-decoration: none;
                font-size: 0.9rem;
                font-weight: 500;
                padding: 8px 16px;
                border-radius: 8px;
                transition: color var(--transition), background var(--transition);
            }

            .nav-links a:hover {
                color: var(--white);
                background: rgba(255, 255, 255, 0.07);
            }

            .nav-links .btn-nav {
                background: var(--gold);
                color: var(--navy);
                font-weight: 700;
                padding: 9px 22px;
                border-radius: 10px;
            }

            .nav-links .btn-nav:hover {
                background: var(--gold-dark);
                color: var(--navy);
            }

            .hamburger {
                display: none;
                flex-direction: column;
                gap: 5px;
                cursor: pointer;
                padding: 4px;
            }

            .hamburger span {
                width: 24px;
                height: 2px;
                background: var(--white);
                border-radius: 2px;
                transition: var(--transition);
            }

            /* ── HERO ── */
            .hero {
                position: relative;
                z-index: 1;
                min-height: 100vh;
                display: flex;
                align-items: center;
                padding: 120px 5% 80px;
                gap: 60px;
            }

            .hero-text {
                flex: 1;
                max-width: 620px;
            }

            .hero-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: rgba(245, 197, 24, 0.12);
                border: 1px solid rgba(245, 197, 24, 0.3);
                color: var(--gold);
                font-size: 0.78rem;
                font-weight: 600;
                padding: 6px 14px;
                border-radius: 50px;
                margin-bottom: 24px;
                animation: fadeSlideUp 0.6s ease both;
            }

            .hero-badge::before {
                content: '●';
                font-size: 0.5rem;
                animation: pulse-dot 1.5s infinite;
            }

            @keyframes pulse-dot {

                0%,
                100% {
                    opacity: 1;
                }

                50% {
                    opacity: 0.3;
                }
            }

            .hero-title {
                font-size: clamp(2.8rem, 6vw, 4.8rem);
                font-weight: 900;
                line-height: 1.08;
                letter-spacing: -2px;
                margin-bottom: 24px;
                animation: fadeSlideUp 0.7s 0.1s ease both;
            }

            .hero-title .highlight {
                background: linear-gradient(135deg, var(--gold) 0%, #ff9f43 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .hero-sub {
                font-size: 1.1rem;
                color: var(--muted);
                line-height: 1.7;
                max-width: 480px;
                margin-bottom: 40px;
                animation: fadeSlideUp 0.7s 0.2s ease both;
            }

            .hero-actions {
                display: flex;
                gap: 16px;
                flex-wrap: wrap;
                margin-bottom: 56px;
                animation: fadeSlideUp 0.7s 0.3s ease both;
            }

            .btn-primary {
                background: linear-gradient(135deg, var(--gold) 0%, #ffaa00 100%);
                color: var(--navy);
                font-weight: 700;
                font-size: 0.95rem;
                padding: 14px 32px;
                border-radius: 12px;
                text-decoration: none;
                border: none;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: transform var(--transition), box-shadow var(--transition);
                box-shadow: 0 4px 24px rgba(245, 197, 24, 0.35);
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 32px rgba(245, 197, 24, 0.5);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            .btn-secondary {
                background: rgba(255, 255, 255, 0.06);
                color: var(--white);
                font-weight: 600;
                font-size: 0.95rem;
                padding: 14px 32px;
                border-radius: 12px;
                text-decoration: none;
                border: 1px solid var(--border);
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: background var(--transition), transform var(--transition);
            }

            .btn-secondary:hover {
                background: rgba(255, 255, 255, 0.12);
                transform: translateY(-2px);
            }

            /* ── STATS ROW ── */
            .stats-row {
                display: flex;
                gap: 36px;
                flex-wrap: wrap;
                animation: fadeSlideUp 0.7s 0.4s ease both;
            }

            .stat {}

            .stat-num {
                font-size: 1.6rem;
                font-weight: 800;
                color: var(--white);
                letter-spacing: -1px;
            }

            .stat-num span {
                color: var(--gold);
            }

            .stat-label {
                font-size: 0.78rem;
                color: var(--muted);
                margin-top: 2px;
                font-weight: 500;
            }

            /* ── HERO CARD ── */
            .hero-visual {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                animation: fadeSlideUp 0.7s 0.2s ease both;
            }

            .bank-card-wrap {
                position: relative;
                perspective: 1000px;
            }

            .bank-card {
                width: 340px;
                height: 210px;
                border-radius: 24px;
                background: linear-gradient(135deg, #1e3a5f 0%, #0f2044 60%, #0a1628 100%);
                border: 1px solid rgba(255, 255, 255, 0.12);
                padding: 28px 32px;
                position: relative;
                overflow: hidden;
                box-shadow: 0 32px 80px rgba(0, 0, 0, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.05);
                animation: floatCard 4s ease-in-out infinite;
                transform-style: preserve-3d;
            }

            @keyframes floatCard {

                0%,
                100% {
                    transform: rotateY(-8deg) rotateX(4deg) translateY(0);
                }

                50% {
                    transform: rotateY(-8deg) rotateX(4deg) translateY(-14px);
                }
            }

            .card-glow {
                position: absolute;
                width: 200px;
                height: 200px;
                border-radius: 50%;
                background: radial-gradient(circle, rgba(245, 197, 24, 0.18), transparent 70%);
                top: -60px;
                right: -60px;
            }

            .card-glow2 {
                position: absolute;
                width: 160px;
                height: 160px;
                border-radius: 50%;
                background: radial-gradient(circle, rgba(59, 130, 246, 0.15), transparent 70%);
                bottom: -50px;
                left: -40px;
            }

            .card-chip {
                width: 42px;
                height: 32px;
                background: linear-gradient(135deg, #d4a800, #f5c518 60%, #a07800);
                border-radius: 6px;
                margin-bottom: 24px;
                position: relative;
                z-index: 1;
            }

            .card-chip::after {
                content: '';
                position: absolute;
                inset: 6px;
                border-radius: 3px;
                border: 1px solid rgba(0, 0, 0, 0.2);
            }

            .card-number {
                font-size: 1.1rem;
                letter-spacing: 3px;
                color: rgba(255, 255, 255, 0.85);
                margin-bottom: 20px;
                font-weight: 500;
                position: relative;
                z-index: 1;
            }

            .card-bottom {
                display: flex;
                justify-content: space-between;
                align-items: flex-end;
                position: relative;
                z-index: 1;
            }

            .card-holder {
                font-size: 0.72rem;
                color: var(--muted);
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .card-name {
                font-size: 0.95rem;
                font-weight: 600;
                color: var(--white);
                margin-top: 3px;
            }

            .card-logo {
                font-size: 1.3rem;
                font-weight: 900;
                color: var(--gold);
            }

            /* floating badges on card */
            .float-badge {
                position: absolute;
                background: rgba(15, 32, 68, 0.85);
                backdrop-filter: blur(12px);
                border: 1px solid var(--border);
                border-radius: 14px;
                padding: 12px 18px;
                font-size: 0.78rem;
                color: var(--white);
                font-weight: 600;
                white-space: nowrap;
                animation: floatCard 4s ease-in-out infinite;
            }

            .float-badge.top-left {
                top: -30px;
                left: -40px;
                animation-delay: 0.5s;
            }

            .float-badge.bottom-right {
                bottom: -30px;
                right: -30px;
                animation-delay: 1s;
            }

            .float-badge .badge-icon {
                font-size: 1.2rem;
                margin-right: 6px;
            }

            .float-badge .badge-val {
                color: #4ade80;
            }

            /* ── FEATURES SECTION ── */
            .features {
                position: relative;
                z-index: 1;
                padding: 100px 5%;
            }

            .section-label {
                text-align: center;
                font-size: 0.78rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 3px;
                color: var(--gold);
                margin-bottom: 16px;
            }

            .section-title {
                text-align: center;
                font-size: clamp(2rem, 4vw, 3rem);
                font-weight: 800;
                letter-spacing: -1px;
                margin-bottom: 16px;
            }

            .section-sub {
                text-align: center;
                color: var(--muted);
                font-size: 1rem;
                max-width: 520px;
                margin: 0 auto 60px;
                line-height: 1.7;
            }

            .features-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
                gap: 24px;
                max-width: 1100px;
                margin: 0 auto;
            }

            .feature-card {
                background: var(--navy-card);
                backdrop-filter: blur(12px);
                border: 1px solid var(--border);
                border-radius: var(--radius-lg);
                padding: 36px 30px;
                transition: transform var(--transition), border-color var(--transition), box-shadow var(--transition);
                cursor: default;
            }

            .feature-card:hover {
                transform: translateY(-6px);
                border-color: rgba(245, 197, 24, 0.25);
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
            }

            .feature-icon {
                width: 54px;
                height: 54px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                margin-bottom: 20px;
            }

            .icon-blue {
                background: rgba(59, 130, 246, 0.15);
            }

            .icon-gold {
                background: rgba(245, 197, 24, 0.15);
            }

            .icon-green {
                background: rgba(74, 222, 128, 0.15);
            }

            .icon-purple {
                background: rgba(99, 102, 241, 0.15);
            }

            .feature-card h3 {
                font-size: 1.1rem;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .feature-card p {
                color: var(--muted);
                font-size: 0.9rem;
                line-height: 1.65;
            }

            /* ── HOW IT WORKS ── */
            .how-it-works {
                position: relative;
                z-index: 1;
                padding: 80px 5%;
                background: rgba(255, 255, 255, 0.02);
                border-top: 1px solid var(--border);
                border-bottom: 1px solid var(--border);
            }

            .steps-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 40px;
                max-width: 900px;
                margin: 0 auto;
            }

            .step {
                text-align: center;
            }

            .step-num {
                width: 56px;
                height: 56px;
                border-radius: 50%;
                background: linear-gradient(135deg, var(--gold), #ff9f43);
                color: var(--navy);
                font-size: 1.3rem;
                font-weight: 900;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 20px;
                box-shadow: 0 8px 24px rgba(245, 197, 24, 0.3);
            }

            .step h4 {
                font-size: 1rem;
                font-weight: 700;
                margin-bottom: 8px;
            }

            .step p {
                color: var(--muted);
                font-size: 0.85rem;
                line-height: 1.6;
            }

            /* ── CTA SECTION ── */
            .cta-section {
                position: relative;
                z-index: 1;
                padding: 100px 5%;
                text-align: center;
            }

            .cta-box {
                max-width: 700px;
                margin: 0 auto;
                background: linear-gradient(135deg, rgba(245, 197, 24, 0.08), rgba(59, 130, 246, 0.06));
                border: 1px solid rgba(245, 197, 24, 0.2);
                border-radius: 28px;
                padding: 64px 48px;
            }

            .cta-box h2 {
                font-size: clamp(1.8rem, 4vw, 2.8rem);
                font-weight: 800;
                letter-spacing: -1px;
                margin-bottom: 16px;
            }

            .cta-box p {
                color: var(--muted);
                font-size: 1rem;
                margin-bottom: 36px;
                line-height: 1.7;
            }

            /* ── FOOTER ── */
            footer {
                position: relative;
                z-index: 1;
                border-top: 1px solid var(--border);
                padding: 32px 5%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 16px;
            }

            .footer-logo {
                font-size: 1.2rem;
                font-weight: 800;
                color: var(--white);
            }

            .footer-logo span {
                color: var(--gold);
            }

            footer p {
                color: var(--muted);
                font-size: 0.82rem;
            }

            .footer-links {
                display: flex;
                gap: 20px;
            }

            .footer-links a {
                color: var(--muted);
                font-size: 0.82rem;
                text-decoration: none;
                transition: color var(--transition);
            }

            .footer-links a:hover {
                color: var(--white);
            }

            /* ── ANIMATIONS ── */
            @keyframes fadeSlideUp {
                from {
                    opacity: 0;
                    transform: translateY(28px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .reveal {
                opacity: 0;
                transform: translateY(30px);
                transition: opacity 0.6s ease, transform 0.6s ease;
            }

            .reveal.visible {
                opacity: 1;
                transform: translateY(0);
            }

            /* ── MOBILE NAV ── */
            @media (max-width: 768px) {
                .nav-links {
                    position: fixed;
                    top: 0;
                    right: -100%;
                    height: 100vh;
                    width: 70%;
                    background: #0d1f3e;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    transition: right 0.4s ease;
                    z-index: 200;
                    gap: 20px;
                }

                .nav-links.open {
                    right: 0;
                }

                .nav-links a {
                    font-size: 1.1rem;
                }

                .hamburger {
                    display: flex;
                    z-index: 300;
                }

                .hero {
                    flex-direction: column;
                    padding: 100px 5% 60px;
                    text-align: center;
                    gap: 40px;
                }

                .hero-sub,
                .hero-actions,
                .stats-row {
                    justify-content: center;
                    margin: 0 auto 36px;
                }

                .hero-visual {
                    width: 100%;
                }

                .bank-card {
                    width: 290px;
                    height: 180px;
                }

                .float-badge.top-left {
                    top: -20px;
                    left: -10px;
                }

                .float-badge.bottom-right {
                    bottom: -20px;
                    right: -10px;
                }

                footer {
                    flex-direction: column;
                    text-align: center;
                }
            }

            /* ── SCROLL BAR ── */
            ::-webkit-scrollbar {
                width: 6px;
            }

            ::-webkit-scrollbar-track {
                background: var(--navy);
            }

            ::-webkit-scrollbar-thumb {
                background: var(--navy-mid);
                border-radius: 3px;
            }

            /* Toast notification */
            .toast {
                position: fixed;
                bottom: 32px;
                left: 50%;
                transform: translateX(-50%) translateY(80px);
                background: #1e3a5f;
                border: 1px solid rgba(245, 197, 24, 0.3);
                color: var(--white);
                padding: 14px 28px;
                border-radius: 50px;
                font-size: 0.9rem;
                font-weight: 500;
                z-index: 999;
                transition: transform 0.4s ease, opacity 0.4s ease;
                opacity: 0;
            }

            .toast.show {
                transform: translateX(-50%) translateY(0);
                opacity: 1;
            }
        </style>
    </head>

    <body>

        <!-- Animated Particle Background -->
        <canvas id="bg-canvas"></canvas>

        <!-- ── NAVBAR ── -->
        <nav class="navbar" id="navbar">
            <a class="logo" href="#">Ace<span>Bank</span></a>
            <ul class="nav-links" id="nav-links">
                <li><a href="#features">Features</a></li>
                <li><a href="#how">How It Works</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-nav">Open Account</a></li>
            </ul>
            <div class="hamburger" id="hamburger" aria-label="Toggle menu">
                <span></span><span></span><span></span>
            </div>
        </nav>

        <!-- ── HERO ── -->
        <section class="hero">
            <div class="hero-text">
                <div class="hero-badge">Trusted by 2M+ users worldwide</div>
                <h1 class="hero-title">Banking Made<br><span class="highlight">Simple & Secure</span></h1>
                <p class="hero-sub">Join over 40,000 people who open an Ace Bank account every week. Manage, spend, and
                    grow your money with confidence.</p>

                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary" id="openAccountBtn">
                        <span>Open Account</span>
                        <span>→</span>
                    </a>
                    <a href="#features" class="btn-secondary" id="featuresBtn">
                        <span>Explore Features</span>
                    </a>
                </div>

                <div class="stats-row">
                    <div class="stat">
                        <div class="stat-num" data-target="2">0<span>M+</span></div>
                        <div class="stat-label">Active Users</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" data-target="40">0<span>K+</span></div>
                        <div class="stat-label">New Accounts/week</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" data-target="99.9">0<span>%</span></div>
                        <div class="stat-label">Uptime SLA</div>
                    </div>
                </div>
            </div>

            <div class="hero-visual">
                <div class="bank-card-wrap">
                    <div class="float-badge top-left">
                        <span class="badge-icon">💰</span> Balance <span class="badge-val">+₹12,450</span>
                    </div>
                    <div class="bank-card">
                        <div class="card-glow"></div>
                        <div class="card-glow2"></div>
                        <div class="card-chip"></div>
                        <div class="card-number">4521 •••• •••• 8834</div>
                        <div class="card-bottom">
                            <div>
                                <div class="card-holder">Card Holder</div>
                                <div class="card-name">Ace Member</div>
                            </div>
                            <div class="card-logo">ACE</div>
                        </div>
                    </div>
                    <div class="float-badge bottom-right">
                        <span class="badge-icon">🔒</span> <span class="badge-val">Secured</span> 256-bit
                    </div>
                </div>
            </div>
        </section>

        <!-- ── FEATURES ── -->
        <section class="features" id="features">
            <div class="section-label">Why Choose Us</div>
            <h2 class="section-title">Everything you need,<br>all in one place</h2>
            <p class="section-sub">Ace Bank gives you powerful tools to take full control of your financial life.</p>

            <div class="features-grid">
                <div class="feature-card reveal">
                    <div class="feature-icon icon-blue">💳</div>
                    <h3>Smart Spending</h3>
                    <p>Automated categorization and real-time analytics help you understand where your money goes every
                        month.</p>
                </div>
                <div class="feature-card reveal">
                    <div class="feature-icon icon-gold">⚡</div>
                    <h3>Instant Transfers</h3>
                    <p>Send money to anyone, anywhere in seconds. No delays, no hidden fees — just seamless
                        transactions.</p>
                </div>
                <div class="feature-card reveal">
                    <div class="feature-icon icon-green">🛡️</div>
                    <h3>Bank-Grade Security</h3>
                    <p>256-bit encryption, two-factor authentication, and real-time fraud alerts protect your money
                        24/7.</p>
                </div>
                <div class="feature-card reveal">
                    <div class="feature-icon icon-purple">📈</div>
                    <h3>Smart Savings</h3>
                    <p>Round-up spare change, set saving goals, and watch your balance grow automatically over time.</p>
                </div>
                <div class="feature-card reveal">
                    <div class="feature-icon icon-blue">🌍</div>
                    <h3>Global Access</h3>
                    <p>Use your Ace Bank card anywhere in the world. Multi-currency support with zero forex markups.</p>
                </div>
                <div class="feature-card reveal">
                    <div class="feature-icon icon-gold">🤖</div>
                    <h3>AI Insights</h3>
                    <p>Personalized financial tips powered by AI help you make smarter decisions every single day.</p>
                </div>
            </div>
        </section>

        <!-- ── HOW IT WORKS ── -->
        <section class="how-it-works" id="how">
            <div class="section-label">Getting Started</div>
            <h2 class="section-title" style="margin-bottom:16px;">Up and running in minutes</h2>
            <p class="section-sub">Opening an Ace Bank account is fast, free, and fully online.</p>

            <div class="steps-grid">
                <div class="step reveal">
                    <div class="step-num">1</div>
                    <h4>Create Account</h4>
                    <p>Fill out our simple online form with your basic details and Aadhar number.</p>
                </div>
                <div class="step reveal">
                    <div class="step-num">2</div>
                    <h4>Verify Identity</h4>
                    <p>We securely verify your identity in seconds using our automated KYC process.</p>
                </div>
                <div class="step reveal">
                    <div class="step-num">3</div>
                    <h4>Start Banking</h4>
                    <p>Add funds to your account and start sending, spending, and saving right away.</p>
                </div>
            </div>
        </section>

        <!-- ── CTA ── -->
        <section class="cta-section">
            <div class="cta-box reveal">
                <h2>Ready to take control<br>of your finances?</h2>
                <p>Join millions of people who already trust Ace Bank to manage their money smarter. It takes less than
                    2 minutes to get started.</p>
                <a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-primary" id="ctaSignUpBtn"
                    style="display:inline-flex;">
                    Get Started — It's Free →
                </a>
            </div>
        </section>

        <!-- ── FOOTER ── -->
        <footer>
            <div class="footer-logo">Ace<span>Bank</span></div>
            <p>© 2026 AceBank. All rights reserved.</p>
            <div class="footer-links">
                <a href="#">Privacy</a>
                <a href="#">Terms</a>
                <a href="#">Support</a>
            </div>
        </footer>

        <!-- Toast -->
        <div class="toast" id="toast"></div>

        <!-- ── JS ── -->
        <script>
            // ── Particle Canvas ──
            const canvas = document.getElementById('bg-canvas');
            const ctx = canvas.getContext('2d');
            let particles = [];
            const PARTICLE_COUNT = 70;

            function resize() {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
            }
            resize();
            window.addEventListener('resize', () => { resize(); init(); });

            function randomRange(a, b) { return a + Math.random() * (b - a); }

            function init() {
                particles = [];
                for (let i = 0; i < PARTICLE_COUNT; i++) {
                    particles.push({
                        x: randomRange(0, canvas.width),
                        y: randomRange(0, canvas.height),
                        r: randomRange(0.5, 2.2),
                        dx: randomRange(-0.3, 0.3),
                        dy: randomRange(-0.3, 0.3),
                        alpha: randomRange(0.08, 0.35)
                    });
                }
            }

            function drawParticles() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                particles.forEach(p => {
                    ctx.beginPath();
                    ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                    ctx.fillStyle = `rgba(245,197,24,${p.alpha})`;
                    ctx.fill();
                    p.x += p.dx;
                    p.y += p.dy;
                    if (p.x < 0 || p.x > canvas.width) p.dx *= -1;
                    if (p.y < 0 || p.y > canvas.height) p.dy *= -1;
                });

                // Draw connecting lines
                for (let i = 0; i < particles.length; i++) {
                    for (let j = i + 1; j < particles.length; j++) {
                        const dist = Math.hypot(particles[i].x - particles[j].x, particles[i].y - particles[j].y);
                        if (dist < 120) {
                            ctx.beginPath();
                            ctx.moveTo(particles[i].x, particles[i].y);
                            ctx.lineTo(particles[j].x, particles[j].y);
                            ctx.strokeStyle = `rgba(245,197,24,${0.04 * (1 - dist / 120)})`;
                            ctx.lineWidth = 0.5;
                            ctx.stroke();
                        }
                    }
                }
                requestAnimationFrame(drawParticles);
            }
            init();
            drawParticles();

            // ── Navbar scroll shrink ──
            const navbar = document.getElementById('navbar');
            window.addEventListener('scroll', () => {
                navbar.classList.toggle('scrolled', window.scrollY > 60);
            });

            // ── Hamburger menu ──
            const hamburger = document.getElementById('hamburger');
            const navLinks = document.getElementById('nav-links');
            hamburger.addEventListener('click', () => navLinks.classList.toggle('open'));
            navLinks.querySelectorAll('a').forEach(a => a.addEventListener('click', () => navLinks.classList.remove('open')));

            // ── Scroll reveal ──
            const revealEls = document.querySelectorAll('.reveal');
            const revealObserver = new IntersectionObserver((entries) => {
                entries.forEach((entry, i) => {
                    if (entry.isIntersecting) {
                        setTimeout(() => entry.target.classList.add('visible'), i * 100);
                        revealObserver.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.15 });
            revealEls.forEach(el => revealObserver.observe(el));

            // ── Count-up stats ──
            function countUp(el, target, suffix) {
                const isDecimal = target % 1 !== 0;
                let current = 0;
                const step = target / 60;
                const timer = setInterval(() => {
                    current = Math.min(current + step, target);
                    const display = isDecimal ? current.toFixed(1) : Math.floor(current);
                    el.innerHTML = display + '<span>' + suffix + '</span>';
                    if (current >= target) clearInterval(timer);
                }, 20);
            }

            const statsObserver = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        document.querySelectorAll('.stat-num').forEach(el => {
                            const raw = el.dataset.target;
                            const num = parseFloat(raw);
                            const suffix = el.querySelector('span') ? el.querySelector('span').textContent : '';
                            countUp(el, num, suffix);
                        });
                        statsObserver.disconnect();
                    }
                });
            }, { threshold: 0.5 });
            const statsRow = document.querySelector('.stats-row');
            if (statsRow) statsObserver.observe(statsRow);

            // ── Toast helper ──
            function showToast(msg) {
                const t = document.getElementById('toast');
                t.textContent = msg;
                t.classList.add('show');
                setTimeout(() => t.classList.remove('show'), 2800);
            }

            // ── Card tilt on mouse move ──
            const cardWrap = document.querySelector('.bank-card-wrap');
            if (cardWrap) {
                cardWrap.addEventListener('mousemove', (e) => {
                    const rect = cardWrap.getBoundingClientRect();
                    const x = (e.clientX - rect.left) / rect.width - 0.5;
                    const y = (e.clientY - rect.top) / rect.height - 0.5;
                    const card = cardWrap.querySelector('.bank-card');
                    card.style.animation = 'none';
                    card.style.transform = `rotateY(${x * 20}deg) rotateX(${-y * 12}deg)`;
                });
                cardWrap.addEventListener('mouseleave', () => {
                    const card = cardWrap.querySelector('.bank-card');
                    card.style.animation = '';
                    card.style.transform = '';
                });
            }

            // ── Smooth scroll for anchor links ──
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        e.preventDefault();
                        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                });
            });
        </script>

    </body>

    </html>
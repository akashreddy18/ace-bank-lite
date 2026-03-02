<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Dashboard | AceBank</title>
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
                    --navy-card: rgba(15, 32, 68, 0.8);
                    --gold: #f5c518;
                    --gold-dk: #d4a800;
                    --white: #ffffff;
                    --muted: #94a3b8;
                    --border: rgba(255, 255, 255, 0.08);
                    --green: #4ade80;
                    --red: #f87171;
                    --blue: #3b82f6;
                    --sidebar-w: 260px;
                    --radius: 16px;
                    --transition: 0.25s ease;
                }

                html {
                    scroll-behavior: smooth;
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background: var(--navy);
                    color: var(--white);
                    min-height: 100vh;
                    display: flex;
                    overflow-x: hidden;
                }

                /* ── BACKGROUND ── */
                body::before {
                    content: '';
                    position: fixed;
                    inset: 0;
                    background:
                        radial-gradient(ellipse 60% 50% at 70% 0%, rgba(59, 130, 246, 0.05) 0%, transparent 70%),
                        radial-gradient(ellipse 50% 40% at 10% 90%, rgba(245, 197, 24, 0.05) 0%, transparent 70%);
                    pointer-events: none;
                    z-index: 0;
                }

                /* ── SIDEBAR ── */
                .sidebar {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: var(--sidebar-w);
                    height: 100vh;
                    background: rgba(10, 22, 40, 0.95);
                    backdrop-filter: blur(20px);
                    border-right: 1px solid var(--border);
                    display: flex;
                    flex-direction: column;
                    padding: 32px 20px;
                    z-index: 100;
                    transition: transform var(--transition);
                }

                .sidebar-logo {
                    font-size: 1.6rem;
                    font-weight: 800;
                    text-decoration: none;
                    color: var(--white);
                    margin-bottom: 48px;
                    padding: 0 8px;
                    display: block;
                }

                .sidebar-logo span {
                    color: var(--gold);
                }

                .sidebar-section-label {
                    font-size: 0.65rem;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    color: rgba(148, 163, 184, 0.5);
                    padding: 0 8px;
                    margin-bottom: 8px;
                }

                .sidebar-nav {
                    list-style: none;
                    margin-bottom: 32px;
                }

                .sidebar-nav li a {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    padding: 11px 12px;
                    border-radius: 10px;
                    color: var(--muted);
                    text-decoration: none;
                    font-size: 0.88rem;
                    font-weight: 500;
                    transition: background var(--transition), color var(--transition);
                    margin-bottom: 2px;
                }

                .sidebar-nav li a:hover {
                    background: rgba(255, 255, 255, 0.06);
                    color: var(--white);
                }

                .sidebar-nav li a.active {
                    background: rgba(245, 197, 24, 0.12);
                    color: var(--gold);
                    font-weight: 600;
                }

                .sidebar-nav li a .nav-icon {
                    font-size: 1rem;
                    width: 20px;
                    text-align: center;
                }

                .sidebar-bottom {
                    margin-top: auto;
                }

                .sidebar-user {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    padding: 14px 12px;
                    border-radius: 12px;
                    background: rgba(255, 255, 255, 0.04);
                    border: 1px solid var(--border);
                    margin-bottom: 12px;
                }

                .user-avatar {
                    width: 38px;
                    height: 38px;
                    border-radius: 50%;
                    background: linear-gradient(135deg, var(--gold), #ff9f43);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 0.9rem;
                    font-weight: 800;
                    color: var(--navy);
                    flex-shrink: 0;
                }

                .user-info {
                    overflow: hidden;
                }

                .user-name {
                    font-size: 0.85rem;
                    font-weight: 600;
                    color: var(--white);
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                }

                .user-acc {
                    font-size: 0.72rem;
                    color: var(--muted);
                }

                .logout-btn {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 8px;
                    width: 100%;
                    padding: 11px;
                    border-radius: 10px;
                    background: rgba(248, 113, 113, 0.08);
                    border: 1px solid rgba(248, 113, 113, 0.18);
                    color: var(--red);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.86rem;
                    font-weight: 600;
                    text-decoration: none;
                    cursor: pointer;
                    transition: background var(--transition);
                }

                .logout-btn:hover {
                    background: rgba(248, 113, 113, 0.15);
                }

                /* ── MAIN CONTENT ── */
                .main-content {
                    margin-left: var(--sidebar-w);
                    flex: 1;
                    padding: 36px 36px 60px;
                    position: relative;
                    z-index: 1;
                    min-width: 0;
                }

                /* ── TOP BAR ── */
                .topbar {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 36px;
                }

                .topbar-greet h1 {
                    font-size: 1.7rem;
                    font-weight: 800;
                    letter-spacing: -0.5px;
                }

                .topbar-greet p {
                    color: var(--muted);
                    font-size: 0.88rem;
                    margin-top: 4px;
                }

                .topbar-actions {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .topbar-btn {
                    display: flex;
                    align-items: center;
                    gap: 6px;
                    padding: 9px 18px;
                    border-radius: 10px;
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid var(--border);
                    color: var(--muted);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.83rem;
                    font-weight: 500;
                    text-decoration: none;
                    cursor: pointer;
                    transition: background var(--transition), color var(--transition);
                }

                .topbar-btn:hover {
                    background: rgba(255, 255, 255, 0.09);
                    color: var(--white);
                }

                /* ── BALANCE BANNER ── */
                .balance-banner {
                    background: linear-gradient(135deg, #0f2044 0%, #162d5c 50%, #0f2044 100%);
                    border: 1px solid rgba(245, 197, 24, 0.15);
                    border-radius: 24px;
                    padding: 36px 40px;
                    margin-bottom: 28px;
                    position: relative;
                    overflow: hidden;
                    animation: fadeUp 0.5s ease both;
                }

                .balance-banner::before {
                    content: '';
                    position: absolute;
                    width: 300px;
                    height: 300px;
                    border-radius: 50%;
                    background: radial-gradient(circle, rgba(245, 197, 24, 0.08), transparent 70%);
                    top: -100px;
                    right: -60px;
                    pointer-events: none;
                }

                .balance-banner::after {
                    content: '';
                    position: absolute;
                    width: 200px;
                    height: 200px;
                    border-radius: 50%;
                    background: radial-gradient(circle, rgba(59, 130, 246, 0.07), transparent 70%);
                    bottom: -80px;
                    left: 40%;
                }

                .balance-inner {
                    position: relative;
                    z-index: 1;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 24px;
                }

                .balance-left {}

                .balance-label {
                    font-size: 0.78rem;
                    font-weight: 600;
                    color: var(--muted);
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 10px;
                }

                .balance-amount {
                    font-size: clamp(2.2rem, 5vw, 3.4rem);
                    font-weight: 900;
                    letter-spacing: -2px;
                    color: var(--white);
                    display: flex;
                    align-items: baseline;
                    gap: 6px;
                }

                .balance-currency {
                    font-size: 1.6rem;
                    font-weight: 700;
                    color: var(--gold);
                }

                .balance-avail {
                    margin-top: 10px;
                    font-size: 0.82rem;
                    color: var(--green);
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 6px;
                }

                .balance-avail::before {
                    content: '●';
                    font-size: 0.5rem;
                }

                .balance-right {
                    display: flex;
                    gap: 16px;
                    flex-wrap: wrap;
                }

                .balance-stat {
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid var(--border);
                    border-radius: 14px;
                    padding: 16px 22px;
                    text-align: center;
                    min-width: 110px;
                }

                .balance-stat-val {
                    font-size: 1.1rem;
                    font-weight: 700;
                    color: var(--white);
                }

                .balance-stat-lbl {
                    font-size: 0.72rem;
                    color: var(--muted);
                    margin-top: 4px;
                    font-weight: 500;
                }

                @keyframes fadeUp {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                /* ── ACTION CARDS GRID ── */
                .action-grid {
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);
                    gap: 20px;
                    margin-bottom: 32px;
                }

                .action-card {
                    background: var(--navy-card);
                    backdrop-filter: blur(12px);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    padding: 28px 24px;
                    transition: transform var(--transition), border-color var(--transition), box-shadow var(--transition);
                    animation: fadeUp 0.5s ease both;
                }

                .action-card:hover {
                    transform: translateY(-4px);
                    border-color: rgba(245, 197, 24, 0.2);
                    box-shadow: 0 16px 48px rgba(0, 0, 0, 0.35);
                }

                .action-card:nth-child(2) {
                    animation-delay: 0.08s;
                }

                .action-card:nth-child(3) {
                    animation-delay: 0.16s;
                }

                .card-header {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    margin-bottom: 22px;
                }

                .card-icon {
                    width: 42px;
                    height: 42px;
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1.2rem;
                    flex-shrink: 0;
                }

                .ci-green {
                    background: rgba(74, 222, 128, 0.12);
                }

                .ci-blue {
                    background: rgba(59, 130, 246, 0.12);
                }

                .ci-orange {
                    background: rgba(251, 146, 60, 0.12);
                }

                .card-header h3 {
                    font-size: 0.95rem;
                    font-weight: 700;
                    color: var(--white);
                }

                .card-header p {
                    font-size: 0.75rem;
                    color: var(--muted);
                    margin-top: 2px;
                }

                /* Form fields inside cards */
                .card-field {
                    margin-bottom: 14px;
                }

                .card-field label {
                    display: block;
                    font-size: 0.73rem;
                    font-weight: 600;
                    color: var(--muted);
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-bottom: 7px;
                }

                .card-field input {
                    width: 100%;
                    padding: 12px 14px;
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid var(--border);
                    border-radius: 10px;
                    color: var(--white);
                    font-size: 0.9rem;
                    font-family: 'Inter', sans-serif;
                    outline: none;
                    transition: border-color var(--transition), background var(--transition), box-shadow var(--transition);
                }

                .card-field input::placeholder {
                    color: rgba(148, 163, 184, 0.4);
                }

                .card-field input:focus {
                    border-color: rgba(245, 197, 24, 0.45);
                    background: rgba(255, 255, 255, 0.08);
                    box-shadow: 0 0 0 3px rgba(245, 197, 24, 0.08);
                }

                .field-row {
                    display: flex;
                    gap: 10px;
                }

                .field-row .card-field {
                    flex: 1;
                }

                /* Card submit buttons */
                .btn-card {
                    width: 100%;
                    padding: 12px;
                    border: none;
                    border-radius: 10px;
                    font-family: 'Inter', sans-serif;
                    font-size: 0.88rem;
                    font-weight: 700;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 6px;
                    transition: transform var(--transition), box-shadow var(--transition), opacity 0.2s;
                    margin-top: 4px;
                }

                .btn-card:active {
                    transform: scale(0.98);
                }

                .btn-deposit {
                    background: linear-gradient(135deg, var(--green), #22c55e);
                    color: #052e16;
                    box-shadow: 0 4px 16px rgba(74, 222, 128, 0.25);
                }

                .btn-deposit:hover {
                    box-shadow: 0 6px 24px rgba(74, 222, 128, 0.4);
                    transform: translateY(-1px);
                }

                .btn-transfer {
                    background: linear-gradient(135deg, var(--blue), #6366f1);
                    color: var(--white);
                    box-shadow: 0 4px 16px rgba(59, 130, 246, 0.25);
                }

                .btn-transfer:hover {
                    box-shadow: 0 6px 24px rgba(59, 130, 246, 0.4);
                    transform: translateY(-1px);
                }

                .btn-withdraw {
                    background: linear-gradient(135deg, #fb923c, #f97316);
                    color: var(--white);
                    box-shadow: 0 4px 16px rgba(251, 146, 60, 0.25);
                }

                .btn-withdraw:hover {
                    box-shadow: 0 6px 24px rgba(251, 146, 60, 0.4);
                    transform: translateY(-1px);
                }

                /* ── TRANSACTIONS TABLE ── */
                .tx-section {
                    background: var(--navy-card);
                    backdrop-filter: blur(12px);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    overflow: hidden;
                    animation: fadeUp 0.5s 0.2s ease both;
                }

                .tx-header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 22px 28px;
                    border-bottom: 1px solid var(--border);
                    flex-wrap: wrap;
                    gap: 12px;
                }

                .tx-header h3 {
                    font-size: 1rem;
                    font-weight: 700;
                }

                .tx-header p {
                    font-size: 0.78rem;
                    color: var(--muted);
                    margin-top: 2px;
                }

                .btn-csv {
                    display: flex;
                    align-items: center;
                    gap: 6px;
                    padding: 9px 18px;
                    border-radius: 10px;
                    background: rgba(245, 197, 24, 0.1);
                    border: 1px solid rgba(245, 197, 24, 0.2);
                    color: var(--gold);
                    font-family: 'Inter', sans-serif;
                    font-size: 0.82rem;
                    font-weight: 600;
                    cursor: pointer;
                    transition: background var(--transition);
                }

                .btn-csv:hover {
                    background: rgba(245, 197, 24, 0.18);
                }

                .tx-table-wrap {
                    overflow-x: auto;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                thead th {
                    padding: 14px 28px;
                    text-align: left;
                    font-size: 0.72rem;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    color: var(--muted);
                    background: rgba(255, 255, 255, 0.02);
                    border-bottom: 1px solid var(--border);
                    white-space: nowrap;
                }

                tbody tr {
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    transition: background var(--transition);
                }

                tbody tr:last-child {
                    border-bottom: none;
                }

                tbody tr:hover {
                    background: rgba(255, 255, 255, 0.03);
                }

                tbody td {
                    padding: 16px 28px;
                    font-size: 0.87rem;
                    color: var(--white);
                    vertical-align: middle;
                }

                .td-date {
                    color: var(--muted);
                    font-size: 0.82rem;
                    white-space: nowrap;
                }

                .td-ref {
                    color: var(--muted);
                    font-size: 0.84rem;
                }

                /* type badges */
                .tx-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 5px;
                    padding: 4px 12px;
                    border-radius: 50px;
                    font-size: 0.72rem;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .badge-deposit {
                    background: rgba(74, 222, 128, 0.12);
                    color: var(--green);
                }

                .badge-withdrawal {
                    background: rgba(251, 146, 60, 0.12);
                    color: #fb923c;
                }

                .badge-transfer {
                    background: rgba(59, 130, 246, 0.12);
                    color: var(--blue);
                }

                .td-amount {
                    font-size: 0.95rem;
                    font-weight: 700;
                    white-space: nowrap;
                }

                .amt-credit {
                    color: var(--green);
                }

                .amt-debit {
                    color: var(--red);
                }

                /* empty state */
                .tx-empty {
                    padding: 60px 28px;
                    text-align: center;
                    color: var(--muted);
                }

                .tx-empty-icon {
                    font-size: 3rem;
                    margin-bottom: 14px;
                    opacity: 0.4;
                }

                .tx-empty p {
                    font-size: 0.9rem;
                }

                /* Toast notification */
                .toast {
                    position: fixed;
                    bottom: 28px;
                    right: 28px;
                    background: #1e3a5f;
                    border: 1px solid rgba(245, 197, 24, 0.3);
                    color: var(--white);
                    padding: 14px 22px;
                    border-radius: 12px;
                    font-size: 0.87rem;
                    font-weight: 500;
                    z-index: 999;
                    transform: translateY(80px);
                    opacity: 0;
                    transition: transform 0.35s ease, opacity 0.35s ease;
                    max-width: 300px;
                }

                .toast.show {
                    transform: translateY(0);
                    opacity: 1;
                }

                /* Hamburger for mobile */
                .menu-toggle {
                    display: none;
                    position: fixed;
                    top: 20px;
                    left: 20px;
                    z-index: 200;
                    background: rgba(10, 22, 40, 0.9);
                    border: 1px solid var(--border);
                    border-radius: 10px;
                    padding: 10px 12px;
                    color: var(--white);
                    font-size: 1.2rem;
                    cursor: pointer;
                    backdrop-filter: blur(12px);
                }

                /* ── RESPONSIVE ── */
                @media (max-width: 1100px) {
                    .action-grid {
                        grid-template-columns: 1fr 1fr;
                    }
                }

                @media (max-width: 860px) {
                    .sidebar {
                        transform: translateX(-100%);
                    }

                    .sidebar.open {
                        transform: translateX(0);
                    }

                    .main-content {
                        margin-left: 0;
                        padding: 24px 20px 60px;
                    }

                    .menu-toggle {
                        display: block;
                    }

                    .topbar {
                        margin-top: 60px;
                    }

                    .action-grid {
                        grid-template-columns: 1fr;
                    }

                    .balance-inner {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    thead th,
                    tbody td {
                        padding: 12px 16px;
                    }
                }

                @media (max-width: 480px) {
                    .balance-banner {
                        padding: 24px 20px;
                    }

                    .tx-header {
                        padding: 16px 20px;
                    }
                }

                /* scrollbar */
                ::-webkit-scrollbar {
                    width: 5px;
                    height: 5px;
                }

                ::-webkit-scrollbar-track {
                    background: transparent;
                }

                ::-webkit-scrollbar-thumb {
                    background: rgba(255, 255, 255, 0.1);
                    border-radius: 3px;
                }
            </style>
        </head>

        <body>

            <!-- Mobile Menu Toggle -->
            <button class="menu-toggle" id="menuToggle" aria-label="Open menu">☰</button>

            <!-- ── SIDEBAR ── -->
            <aside class="sidebar" id="sidebar">
                <a href="#" class="sidebar-logo">Ace<span>Bank</span></a>

                <div class="sidebar-section-label">Main Menu</div>
                <ul class="sidebar-nav">
                    <li>
                        <a href="#" class="active">
                            <span class="nav-icon">🏠</span> Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#transactions">
                            <span class="nav-icon">📋</span> Transactions
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/loans">
                            <span class="nav-icon">🏦</span> Loans
                        </a>
                    </li>
                    <li>
                        <a href="ChangePassword.jsp">
                            <span class="nav-icon">🔑</span> Reset Password
                        </a>
                    </li>
                </ul>

                <div class="sidebar-section-label">Account</div>
                <ul class="sidebar-nav">
                    <li>
                        <a href="#">
                            <span class="nav-icon">⚙️</span> Settings
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="nav-icon">🛡️</span> Security
                        </a>
                    </li>
                </ul>

                <div class="sidebar-bottom">
                    <div class="sidebar-user">
                        <div class="user-avatar" id="userInitial">A</div>
                        <div class="user-info">
                            <div class="user-name">${sessionScope.firstName}</div>
                            <div class="user-acc">#${sessionScope.accountNumber}</div>
                        </div>
                    </div>
                    <a href="Logout" class="logout-btn">
                        <span>⎋</span> Sign Out
                    </a>
                </div>
            </aside>

            <!-- ── MAIN CONTENT ── -->
            <main class="main-content">

                <!-- Top Bar -->
                <div class="topbar">
                    <div class="topbar-greet">
                        <h1>Hello, ${sessionScope.firstName} 👋</h1>
                        <p>Here's your financial overview for today</p>
                    </div>
                    <div class="topbar-actions">
                        <a href="ChangePassword.jsp" class="topbar-btn">🔑 Reset Password</a>
                    </div>
                </div>

                <!-- Balance Banner -->
                <div class="balance-banner">
                    <div class="balance-inner">
                        <div class="balance-left">
                            <div class="balance-label">Total Balance</div>
                            <div class="balance-amount">
                                <span class="balance-currency">₹</span>
                                <span id="balance-counter">${sessionScope.balance}</span>
                            </div>
                            <div class="balance-avail">Available for withdrawal</div>
                        </div>
                        <div class="balance-right">
                            <div class="balance-stat">
                                <div class="balance-stat-val" style="color:var(--green);">↑</div>
                                <div class="balance-stat-lbl">Income</div>
                            </div>
                            <div class="balance-stat">
                                <div class="balance-stat-val" style="color:var(--red);">↓</div>
                                <div class="balance-stat-lbl">Expenses</div>
                            </div>
                            <div class="balance-stat">
                                <div class="balance-stat-val" style="color:var(--blue);">↔</div>
                                <div class="balance-stat-lbl">Transfers</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Cards -->
                <div class="action-grid">

                    <!-- Deposit Card -->
                    <div class="action-card">
                        <div class="card-header">
                            <div class="card-icon ci-green">💰</div>
                            <div>
                                <h3>Quick Deposit</h3>
                                <p>Add funds to your account</p>
                            </div>
                        </div>
                        <form action="home" method="post" id="depositForm">
                            <div class="card-field">
                                <label for="depositAmt">Amount (₹)</label>
                                <input type="text" id="depositAmt" name="deposit" placeholder="e.g. 5,000"
                                    pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required>
                            </div>
                            <button type="submit" class="btn-card btn-deposit">
                                ＋ Add to Balance
                            </button>
                        </form>
                    </div>

                    <!-- Transfer Card -->
                    <div class="action-card">
                        <div class="card-header">
                            <div class="card-icon ci-blue">↗️</div>
                            <div>
                                <h3>Send Money</h3>
                                <p>Transfer to another account</p>
                            </div>
                        </div>
                        <form action="home" method="post" id="transferForm">
                            <div class="card-field">
                                <label for="toAccount">Recipient Account No</label>
                                <input type="text" id="toAccount" name="toAccount" placeholder="Enter account number"
                                    required>
                            </div>
                            <div class="card-field">
                                <label for="toAmount">Amount (₹)</label>
                                <input type="text" id="toAmount" name="toAmount" placeholder="e.g. 1,000"
                                    pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required>
                            </div>
                            <button type="submit" class="btn-card btn-transfer">
                                → Transfer Now
                            </button>
                        </form>
                    </div>

                    <!-- Withdraw Card -->
                    <div class="action-card">
                        <div class="card-header">
                            <div class="card-icon ci-orange">↙️</div>
                            <div>
                                <h3>Withdraw Money</h3>
                                <p>Move funds to your wallet</p>
                            </div>
                        </div>
                        <form action="home" method="post" id="withdrawForm">
                            <div class="card-field">
                                <label for="withdrawAmt">Amount (₹)</label>
                                <input type="text" id="withdrawAmt" name="withdraw" placeholder="e.g. 2,000"
                                    pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required>
                            </div>
                            <button type="submit" class="btn-card btn-withdraw">
                                − Withdraw Now
                            </button>
                        </form>
                    </div>

                </div>

                <!-- Transactions Table -->
                <section class="tx-section" id="transactions">
                    <div class="tx-header">
                        <div>
                            <h3>Recent Transactions</h3>
                            <p>Your latest account activity</p>
                        </div>
                        <button class="btn-csv" id="csvBtn">⬇ Download CSV</button>
                    </div>

                    <div class="tx-table-wrap">
                        <c:choose>
                            <c:when test="${empty sessionScope.transactionDetailsList}">
                                <div class="tx-empty">
                                    <div class="tx-empty-icon">📭</div>
                                    <p>No transactions yet. Start by depositing or sending money.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table id="txTable">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Type</th>
                                            <th>Reference</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="tx" items="${sessionScope.transactionDetailsList}">
                                            <tr>
                                                <td class="td-date">${tx.createdAt()}</td>
                                                <td>
                                                    <span class="tx-badge badge-${tx.txType().toLowerCase()}">
                                                        <c:choose>
                                                            <c:when test="${tx.txType() == 'DEPOSIT'}">↑</c:when>
                                                            <c:when test="${tx.txType() == 'WITHDRAWAL'}">↓</c:when>
                                                            <c:otherwise>↔</c:otherwise>
                                                        </c:choose>
                                                        ${tx.txType()}
                                                    </span>
                                                </td>
                                                <td class="td-ref">
                                                    <c:choose>
                                                        <c:when test="${tx.txType() == 'TRANSFER'}">
                                                            <span>
                                                                ${tx.senderAccount() == sessionScope.accountNumber ? '→
                                                                To' : '← From'}
                                                                ${tx.senderAccount() == sessionScope.accountNumber ?
                                                                tx.receiverAccount() : tx.senderAccount()}
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${tx.remark()}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="td-amount">
                                                    <c:choose>
                                                        <c:when
                                                            test="${tx.txType() == 'DEPOSIT' or (tx.txType() == 'TRANSFER' and tx.receiverAccount() == sessionScope.accountNumber)}">
                                                            <span class="amt-credit">+ ₹${tx.amount()}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="amt-debit">− ₹${tx.amount()}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </section>

            </main>

            <!-- Toast -->
            <div class="toast" id="toast"></div>

            <!-- ── JS ── -->
            <script>
                // ── Mobile sidebar toggle ──
                const menuToggle = document.getElementById('menuToggle');
                const sidebar = document.getElementById('sidebar');
                menuToggle.addEventListener('click', () => sidebar.classList.toggle('open'));
                document.addEventListener('click', (e) => {
                    if (!sidebar.contains(e.target) && !menuToggle.contains(e.target)) {
                        sidebar.classList.remove('open');
                    }
                });

                // ── Set user initial in avatar ──
                const firstName = '${sessionScope.firstName}';
                const initEl = document.getElementById('userInitial');
                if (firstName && initEl) initEl.textContent = firstName.charAt(0).toUpperCase();

                // ── Animated balance counter ──
                function animateCounter(el, target) {
                    if (!el || isNaN(target)) return;
                    const duration = 1200;
                    const start = performance.now();
                    const startVal = 0;
                    function step(now) {
                        const elapsed = now - start;
                        const progress = Math.min(elapsed / duration, 1);
                        const eased = 1 - Math.pow(1 - progress, 4);
                        const current = startVal + (target - startVal) * eased;
                        el.textContent = current.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                        if (progress < 1) requestAnimationFrame(step);
                    }
                    requestAnimationFrame(step);
                }

                window.addEventListener('load', () => {
                    const el = document.getElementById('balance-counter');
                    const raw = el ? parseFloat(el.textContent.replace(/,/g, '')) : 0;
                    animateCounter(el, raw);
                });

                // ── Toast notification ──
                function showToast(msg, type = 'info') {
                    const t = document.getElementById('toast');
                    t.textContent = msg;
                    t.style.borderColor = type === 'success' ? 'rgba(74,222,128,0.4)'
                        : type === 'error' ? 'rgba(248,113,113,0.35)'
                            : 'rgba(245,197,24,0.3)';
                    t.classList.add('show');
                    setTimeout(() => t.classList.remove('show'), 3000);
                }

                // ── Client-side form validation ──
                function validateAmount(val) {
                    const n = parseFloat(val);
                    return !isNaN(n) && n > 0;
                }

                document.getElementById('depositForm').addEventListener('submit', function (e) {
                    const val = document.getElementById('depositAmt').value.replace(/,/g, '');
                    if (!validateAmount(val)) {
                        e.preventDefault();
                        showToast('⚠ Please enter a valid deposit amount.', 'error');
                    }
                });

                document.getElementById('transferForm').addEventListener('submit', function (e) {
                    const acc = document.getElementById('toAccount').value.trim();
                    const amt = document.getElementById('toAmount').value.replace(/,/g, '');
                    if (!acc) { e.preventDefault(); showToast('⚠ Enter recipient account number.', 'error'); return; }
                    if (!validateAmount(amt)) { e.preventDefault(); showToast('⚠ Enter a valid transfer amount.', 'error'); }
                });

                document.getElementById('withdrawForm').addEventListener('submit', function (e) {
                    const val = document.getElementById('withdrawAmt').value.replace(/,/g, '');
                    if (!validateAmount(val)) {
                        e.preventDefault();
                        showToast('⚠ Please enter a valid withdrawal amount.', 'error');
                    }
                });

                // ── CSV Download ──
                document.getElementById('csvBtn').addEventListener('click', function () {
                    const table = document.getElementById('txTable');
                    if (!table) { showToast('No transactions to export.', 'error'); return; }

                    let csv = 'Date,Type,Reference,Amount\n';
                    const rows = table.querySelectorAll('tbody tr');
                    rows.forEach(row => {
                        const cells = row.querySelectorAll('td');
                        const rowData = Array.from(cells).map(td => '"' + td.innerText.trim().replace(/"/g, '""') + '"');
                        csv += rowData.join(',') + '\n';
                    });

                    const blob = new Blob([csv], { type: 'text/csv' });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = url;
                    a.download = 'acebank_transactions.csv';
                    a.click();
                    URL.revokeObjectURL(url);
                    showToast('✅ CSV downloaded successfully!', 'success');
                });

                // ── Highlight active sidebar nav from hash ──
                const navLinks = document.querySelectorAll('.sidebar-nav a');
                navLinks.forEach(link => {
                    link.addEventListener('click', function () {
                        navLinks.forEach(l => l.classList.remove('active'));
                        this.classList.add('active');
                    });
                });
            </script>

        </body>

        </html>
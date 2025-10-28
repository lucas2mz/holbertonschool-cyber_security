#!/bin/bash
grep -E "^smtpd_tls_security_level\s*=" /etc/postfix/main.cf || echo "STARTTLS not configured"
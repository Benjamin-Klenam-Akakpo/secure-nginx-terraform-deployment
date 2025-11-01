#!/bin/bash

# Update system
yum update -y

# Install nginx
amazon-linux-extras install nginx1 -y

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# KlensPro website
cat > /var/www/html/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description" content="KlensPro Cleaning Services - Professional cleaning solutions">
<title>KlensPro Cleaning Services - Professional Cleaning Solutions</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;line-height:1.6;color:#333;background:linear-gradient(135deg,#f5f7fa 0%,#c3cfe2 100%)}
header{background:linear-gradient(135deg,#2d5f3a 0%,#4a8f5a 100%);color:#fff;padding:2rem 0;box-shadow:0 2px 10px rgba(0,0,0,.1)}
.container{max-width:1200px;margin:0 auto;padding:0 20px}
.header-content{display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap}
.logo-section{display:flex;align-items:center;gap:20px}
.logo{width:80px;height:80px;background:#fff;border-radius:15px;display:flex;align-items:center;justify-content:center;box-shadow:0 4px 6px rgba(0,0,0,.1);font-size:50px}
.company-name{font-size:2.5rem;font-weight:700;text-shadow:2px 2px 4px rgba(0,0,0,.2)}
.tagline{color:#e0e0e0;font-size:1.1rem;margin-top:5px}
nav{margin-top:1rem}
nav a{color:#fff;text-decoration:none;padding:.5rem 1rem;margin:0 .5rem;border-radius:5px;transition:background .3s}
nav a:hover{background:rgba(255,255,255,.2)}
.hero{background:linear-gradient(135deg,#4a8f5a 0%,#2d5f3a 100%);color:#fff;padding:4rem 0;text-align:center}
.hero h1{font-size:3rem;margin-bottom:1rem;text-shadow:2px 2px 4px rgba(0,0,0,.3)}
.hero p{font-size:1.3rem;margin-bottom:2rem;opacity:.95}
.cta-button{display:inline-block;background:#fff;color:#2d5f3a;padding:1rem 2.5rem;border-radius:50px;text-decoration:none;font-weight:700;font-size:1.1rem;transition:transform .3s,box-shadow .3s;box-shadow:0 4px 15px rgba(0,0,0,.2)}
.cta-button:hover{transform:translateY(-3px);box-shadow:0 6px 20px rgba(0,0,0,.3)}
.services{padding:4rem 0;background:#fff}
.section-title{text-align:center;font-size:2.5rem;color:#2d5f3a;margin-bottom:3rem}
.services-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:2rem}
.service-card{background:linear-gradient(135deg,#f5f7fa 0%,#e8ede8 100%);padding:2rem;border-radius:15px;text-align:center;transition:transform .3s,box-shadow .3s;box-shadow:0 4px 6px rgba(0,0,0,.1)}
.service-card:hover{transform:translateY(-10px);box-shadow:0 10px 25px rgba(0,0,0,.15)}
.service-icon{font-size:3rem;margin-bottom:1rem}
.service-card h3{color:#2d5f3a;font-size:1.5rem;margin-bottom:1rem}
.service-card p{color:#666;line-height:1.6}
.features{padding:4rem 0;background:linear-gradient(135deg,#f5f7fa 0%,#c3cfe2 100%)}
.features-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(250px,1fr));gap:2rem;margin-top:2rem}
.feature-item{background:#fff;padding:1.5rem;border-radius:10px;border-left:4px solid #4a8f5a;box-shadow:0 2px 5px rgba(0,0,0,.1)}
.feature-item h4{color:#2d5f3a;margin-bottom:.5rem}
.contact{padding:4rem 0;background:#fff;text-align:center}
.contact-info{display:flex;justify-content:center;flex-wrap:wrap;gap:3rem;margin-top:2rem}
.contact-item{display:flex;flex-direction:column;align-items:center}
.contact-item-icon{font-size:2.5rem;color:#4a8f5a;margin-bottom:.5rem}
.contact-item h4{color:#2d5f3a;margin-bottom:.5rem}
.contact-item p{color:#666;font-size:1.1rem}
footer{background:#2d5f3a;color:#fff;text-align:center;padding:2rem 0}
.footer-content{display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:1rem}
.social-links a{color:#fff;font-size:1.5rem;margin:0 10px;transition:opacity .3s}
.social-links a:hover{opacity:.7}
.info-banner{background:#fff3cd;border:1px solid #ffc107;padding:1rem;margin:2rem 0;border-radius:8px;text-align:center}
.info-banner strong{color:#856404}
@media (max-width:768px){
.company-name{font-size:1.8rem}
.hero h1{font-size:2rem}
.header-content{justify-content:center;text-align:center}
nav{width:100%;text-align:center}
}
</style>
</head>
<body>
<header>
<div class="container">
<div class="header-content">
<div class="logo-section">
<div class="logo"><span>🧹</span></div>
<div>
<h1 class="company-name">KLENSPRO</h1>
<p class="tagline">CLEANING SERVICES</p>
</div>
</div>
<nav>
<a href="#services">Services</a>
<a href="#why-us">Why Us</a>
<a href="#contact">Contact</a>
</nav>
</div>
</div>
</header>
<section class="hero">
<div class="container">
<h1>Professional Cleaning Solutions</h1>
<p>Experience spotless spaces with KlensPro's expert cleaning services</p>
<a href="#contact" class="cta-button">Get a Free Quote</a>
</div>
</section>
<div class="container">
<div class="info-banner">
<strong>🚀 Powered by AWS:</strong> Secure, highly available infrastructure with Auto Scaling, Load Balancing, and WAF protection.
<br><strong>Instance:</strong> <span id="instance-id">Loading...</span> | <strong>AZ:</strong> <span id="az">Loading...</span>
</div>
</div>
<section class="services" id="services">
<div class="container">
<h2 class="section-title">Our Services</h2>
<div class="services-grid">
<div class="service-card">
<div class="service-icon">🏠</div>
<h3>Residential Cleaning</h3>
<p>Complete home cleaning services including deep cleaning, regular maintenance, and move-in/move-out cleaning.</p>
</div>
<div class="service-card">
<div class="service-icon">🏢</div>
<h3>Commercial Cleaning</h3>
<p>Professional office and commercial space cleaning tailored to your business needs and schedule.</p>
</div>
<div class="service-card">
<div class="service-icon">✨</div>
<h3>Deep Cleaning</h3>
<p>Intensive cleaning service that reaches every corner, perfect for seasonal cleaning or special occasions.</p>
</div>
<div class="service-card">
<div class="service-icon">🪟</div>
<h3>Window Cleaning</h3>
<p>Crystal clear windows inside and out, using professional equipment and eco-friendly products.</p>
</div>
<div class="service-card">
<div class="service-icon">🛋️</div>
<h3>Carpet & Upholstery</h3>
<p>Professional carpet and furniture cleaning that removes stains, odors, and allergens.</p>
</div>
<div class="service-card">
<div class="service-icon">🏗️</div>
<h3>Post-Construction</h3>
<p>Thorough cleanup after construction or renovation projects, removing all dust and debris.</p>
</div>
</div>
</div>
</section>
<section class="features" id="why-us">
<div class="container">
<h2 class="section-title">Why Choose KlensPro?</h2>
<div class="features-grid">
<div class="feature-item"><h4>✓ Experienced Professionals</h4><p>Trained and vetted cleaning experts with years of experience</p></div>
<div class="feature-item"><h4>✓ Eco-Friendly Products</h4><p>Safe, green cleaning solutions that protect your family and pets</p></div>
<div class="feature-item"><h4>✓ Flexible Scheduling</h4><p>We work around your schedule with convenient booking options</p></div>
<div class="feature-item"><h4>✓ Satisfaction Guaranteed</h4><p>100% satisfaction guarantee or we'll make it right</p></div>
<div class="feature-item"><h4>✓ Fully Insured</h4><p>Complete insurance coverage for your peace of mind</p></div>
<div class="feature-item"><h4>✓ Competitive Pricing</h4><p>Premium quality service at affordable rates</p></div>
</div>
</div>
</section>
<section class="contact" id="contact">
<div class="container">
<h2 class="section-title">Get In Touch</h2>
<p style="font-size:1.2rem;color:#666;margin-bottom:2rem">Ready to experience the KlensPro difference? Contact us today for a free quote!</p>
<div class="contact-info">
<div class="contact-item">
<div class="contact-item-icon">📞</div>
<h4>Phone</h4>
<p>+233 541 223 319<br>+233 504 032 965</p>
</div>
<div class="contact-item">
<div class="contact-item-icon">📧</div>
<h4>Email</h4>
<p>klenscleaningsolutions@gmail.com</p>
</div>
<div class="contact-item">
<div class="contact-item-icon">📍</div>
<h4>Location</h4>
<p>Kumasi, Ashanti, Ghana</p>
</div>
<div class="contact-item">
<div class="contact-item-icon">⏰</div>
<h4>Hours</h4>
<p>Mon-Sat: 8AM - 6PM</p>
</div>
</div>
<div style="margin-top:3rem">
<a href="#contact" class="cta-button">Request a Free Quote</a>
</div>
</div>
</section>
<footer>
<div class="container">
<div class="footer-content">
<p>&copy; 2024 KlensPro Cleaning Services. All rights reserved.</p>
<div class="social-links">
<a href="https://www.instagram.com/klenspro_cleaning_services/profilecard/?igsh=MTd2NHRqNTVudnd4bQ==" target="_blank" title="Instagram">📷</a>
<a href="https://web.facebook.com/profile.php?id=100089218938188" target="_blank" title="Facebook">📘</a>
<a href="https://www.tiktok.com/@klenspro.cleaning?_t=ZM-8xxcou0Kllw" target="_blank" title="TikTok">🎵</a>
</div>
</div>
<p style="margin-top:1rem;opacity:.8;font-size:.9rem">Secured by AWS WAF | SSL Encrypted | Highly Available Infrastructure</p>
</div>
</footer>
<script>
fetch('http://169.254.169.254/latest/meta-data/instance-id').then(r=>r.text()).then(d=>document.getElementById('instance-id').textContent=d).catch(()=>document.getElementById('instance-id').textContent='N/A');
fetch('http://169.254.169.254/latest/meta-data/placement/availability-zone').then(r=>r.text()).then(d=>document.getElementById('az').textContent=d).catch(()=>document.getElementById('az').textContent='N/A');
document.querySelectorAll('a[href^="#"]').forEach(a=>{a.addEventListener('click',function(e){e.preventDefault();const t=document.querySelector(this.getAttribute('href'));if(t)t.scrollIntoView({behavior:'smooth',block:'start'})})});
</script>
</body>
</html>
HTMLEOF

# Set permissions
chown nginx:nginx /var/www/html/index.html
chmod 644 /var/www/html/index.html

# Configure nginx
cat > /etc/nginx/nginx.conf << 'NGINXEOF'
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;
events{worker_connections 1024;}
http{
log_format main '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent"';
access_log /var/log/nginx/access.log main;
sendfile on;tcp_nopush on;tcp_nodelay on;keepalive_timeout 65;types_hash_max_size 2048;
include /etc/nginx/mime.types;default_type application/octet-stream;
server{listen 80 default_server;listen [::]:80 default_server;server_name _;root /var/www/html;
location /{index index.html;}
location /health{access_log off;return 200 "healthy\n";add_header Content-Type text/plain;}
error_page 404 /404.html;error_page 500 502 503 504 /50x.html;location = /50x.html{root /usr/share/nginx/html;}}}
NGINXEOF

# Restart nginx
systemctl restart nginx

# Install CloudWatch agent
yum install -y amazon-cloudwatch-agent

# Log completion
echo "KlensPro deployment completed at $(date)" >> /var/log/deployment.log
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="KlensPro Cleaning Services - Professional cleaning solutions for your home and business">
    <meta name="keywords" content="cleaning services, professional cleaning, home cleaning, office cleaning, KlensPro">
    <title>KlensPro Cleaning Services - Professional Cleaning Solutions</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        /* Header Styles */
        header {
            background: linear-gradient(135deg, #2d5f3a 0%, #4a8f5a 100%);
            color: white;
            padding: 2rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .logo-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .logo {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .logo-icon {
            font-size: 50px;
        }
        
        .company-name {
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        
        .tagline {
            color: #e0e0e0;
            font-size: 1.1rem;
            margin-top: 5px;
        }
        
        nav {
            margin-top: 1rem;
        }
        
        nav a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            margin: 0 0.5rem;
            border-radius: 5px;
            transition: background 0.3s;
        }
        
        nav a:hover {
            background: rgba(255,255,255,0.2);
        }
        
        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #4a8f5a 0%, #2d5f3a 100%);
            color: white;
            padding: 4rem 0;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.95;
        }
        
        .cta-button {
            display: inline-block;
            background: white;
            color: #2d5f3a;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1rem;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }
        
        /* Services Section */
        .services {
            padding: 4rem 0;
            background: white;
        }
        
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            color: #2d5f3a;
            margin-bottom: 3rem;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }
        
        .service-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #e8ede8 100%);
            padding: 2rem;
            border-radius: 15px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        
        .service-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .service-card h3 {
            color: #2d5f3a;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .service-card p {
            color: #666;
            line-height: 1.6;
        }
        
        /* Features Section */
        .features {
            padding: 4rem 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .feature-item {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            border-left: 4px solid #4a8f5a;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .feature-item h4 {
            color: #2d5f3a;
            margin-bottom: 0.5rem;
        }
        
        /* Contact Section */
        .contact {
            padding: 4rem 0;
            background: white;
            text-align: center;
        }
        
        .contact-info {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 3rem;
            margin-top: 2rem;
        }
        
        .contact-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .contact-item-icon {
            font-size: 2.5rem;
            color: #4a8f5a;
            margin-bottom: 0.5rem;
        }
        
        .contact-item h4 {
            color: #2d5f3a;
            margin-bottom: 0.5rem;
        }
        
        .contact-item p {
            color: #666;
            font-size: 1.1rem;
        }
        
        /* Footer */
        footer {
            background: #2d5f3a;
            color: white;
            text-align: center;
            padding: 2rem 0;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .social-links a {
            color: white;
            font-size: 1.5rem;
            margin: 0 10px;
            transition: opacity 0.3s;
        }
        
        .social-links a:hover {
            opacity: 0.7;
        }
        
        /* Info Banner */
        .info-banner {
            background: #fff3cd;
            border: 1px solid #ffc107;
            padding: 1rem;
            margin: 2rem 0;
            border-radius: 8px;
            text-align: center;
        }
        
        .info-banner strong {
            color: #856404;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .company-name {
                font-size: 1.8rem;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .header-content {
                justify-content: center;
                text-align: center;
            }
            
            nav {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo-section">
                    <div class="logo">
                        <span class="logo-icon">🧹</span>
                    </div>
                    <div>
                        <h1 class="company-name">KLENSPRO</h1>
                        <p class="tagline">CLEANING SERVICES</p>
                    </div>
                </div>
                <nav>
                    <a href="#services">Services</a>
                    <a href="#why-us">Why Us</a>
                    <a href="#contact">Contact</a>
                </nav>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Professional Cleaning Solutions</h1>
            <p>Experience spotless spaces with KlensPro's expert cleaning services</p>
            <a href="#contact" class="cta-button">Get a Free Quote</a>
        </div>
    </section>

    <!-- Info Banner -->
    <div class="container">
        <div class="info-banner">
            <strong>🚀 Powered by AWS:</strong> This website is hosted on a secure, highly available infrastructure with Auto Scaling, Load Balancing, and WAF protection.
            <br><strong>Instance ID:</strong> <span id="instance-id">Loading...</span> | 
            <strong>AZ:</strong> <span id="az">Loading...</span>
        </div>
    </div>

    <!-- Services Section -->
    <section class="services" id="services">
        <div class="container">
            <h2 class="section-title">Our Services</h2>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">🏠</div>
                    <h3>Residential Cleaning</h3>
                    <p>Complete home cleaning services including deep cleaning, regular maintenance, and move-in/move-out cleaning.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">🏢</div>
                    <h3>Commercial Cleaning</h3>
                    <p>Professional office and commercial space cleaning tailored to your business needs and schedule.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">✨</div>
                    <h3>Deep Cleaning</h3>
                    <p>Intensive cleaning service that reaches every corner, perfect for seasonal cleaning or special occasions.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">🪟</div>
                    <h3>Window Cleaning</h3>
                    <p>Crystal clear windows inside and out, using professional equipment and eco-friendly products.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">🛋️</div>
                    <h3>Carpet & Upholstery</h3>
                    <p>Professional carpet and furniture cleaning that removes stains, odors, and allergens.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">🏗️</div>
                    <h3>Post-Construction</h3>
                    <p>Thorough cleanup after construction or renovation projects, removing all dust and debris.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="why-us">
        <div class="container">
            <h2 class="section-title">Why Choose KlensPro?</h2>
            <div class="features-grid">
                <div class="feature-item">
                    <h4>✓ Experienced Professionals</h4>
                    <p>Trained and vetted cleaning experts with years of experience</p>
                </div>
                <div class="feature-item">
                    <h4>✓ Eco-Friendly Products</h4>
                    <p>Safe, green cleaning solutions that protect your family and pets</p>
                </div>
                <div class="feature-item">
                    <h4>✓ Flexible Scheduling</h4>
                    <p>We work around your schedule with convenient booking options</p>
                </div>
                <div class="feature-item">
                    <h4>✓ Satisfaction Guaranteed</h4>
                    <p>100% satisfaction guarantee or we'll make it right</p>
                </div>
                <div class="feature-item">
                    <h4>✓ Fully Insured</h4>
                    <p>Complete insurance coverage for your peace of mind</p>
                </div>
                <div class="feature-item">
                    <h4>✓ Competitive Pricing</h4>
                    <p>Premium quality service at affordable rates</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <div class="container">
            <h2 class="section-title">Get In Touch</h2>
            <p style="font-size: 1.2rem; color: #666; margin-bottom: 2rem;">
                Ready to experience the KlensPro difference? Contact us today for a free quote!
            </p>
            <div class="contact-info">
                <div class="contact-item">
                    <div class="contact-item-icon">📞</div>
                    <h4>Phone</h4>
                    <p>+233 541 223 319<br>+233 504 032 965</p>
                </div>
                <div class="contact-item">
                    <div class="contact-item-icon">📧</div>
                    <h4>Email</h4>
                    <p>klenscleaningsolutions@gmail.com</p>
                </div>
                <div class="contact-item">
                    <div class="contact-item-icon">📍</div>
                    <h4>Location</h4>
                    <p>Kumasi, Ashanti, Ghana</p>
                </div>
                <div class="contact-item">
                    <div class="contact-item-icon">⏰</div>
                    <h4>Hours</h4>
                    <p>Mon-Sat: 8AM - 6PM</p>
                </div>
            </div>
            <div style="margin-top: 3rem;">
                <a href="#" class="cta-button">Request a Free Quote</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <p>&copy; 2024 KlensPro Cleaning Services. All rights reserved.</p>
                <div class="social-links">
                    <a href="https://www.instagram.com/klenspro_cleaning_services/profilecard/?igsh=MTd2NHRqNTVudnd4bQ==" target="_blank" title="Instagram">📷</a>
                    <a href="https://web.facebook.com/profile.php?id=100089218938188" target="_blank" title="Facebook">📘</a>
                    <a href="https://www.tiktok.com/@klenspro.cleaning?_t=ZM-8xxcou0Kllw" target="_blank" title="TikTok">🎵</a>
                </div>
            </div>
            <p style="margin-top: 1rem; opacity: 0.8; font-size: 0.9rem;">
                Secured by AWS WAF | SSL Encrypted | Highly Available Infrastructure
            </p>
        </div>
    </footer>

    <script>
        // Update server time
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleString();
            document.title = 'KlensPro Cleaning Services - ' + timeString;
        }
        updateTime();
        setInterval(updateTime, 60000);

        // Fetch instance metadata
        fetch('http://169.254.169.254/latest/meta-data/instance-id')
            .then(response => response.text())
            .then(data => document.getElementById('instance-id').textContent = data)
            .catch(() => document.getElementById('instance-id').textContent = 'N/A');

        fetch('http://169.254.169.254/latest/meta-data/placement/availability-zone')
            .then(response => response.text())
            .then(data => document.getElementById('az').textContent = data)
            .catch(() => document.getElementById('az').textContent = 'N/A');

        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>
</body>
</html>
EOF

# Set proper permissions
chown nginx:nginx /var/www/html/index.html
chmod 644 /var/www/html/index.html

# Configure nginx
cat <<EOF > /etc/nginx/nginx.conf
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  _;
        root         /var/www/html;

        location / {
            index  index.html index.htm;
        }

        location /health {
            access_log off;
            return 200 "healthy\n";
            add_header Content-Type text/plain;
        }

        error_page   404              /404.html;
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}
EOF

# Restart nginx to apply configuration
systemctl restart nginx

# Install CloudWatch agent (optional)
yum install -y amazon-cloudwatch-agent

# Create a simple health check script
cat <<EOF > /usr/local/bin/health_check.sh
#!/bin/bash
curl -f http://localhost/health > /dev/null 2>&1
exit \$?
EOF

chmod +x /usr/local/bin/health_check.sh

# Log deployment completion
echo "Nginx deployment completed at \$(date)" >> /var/log/deployment.log
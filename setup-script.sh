#!/bin/bash

# Setup script for Woodward & Guy Next.js website
# This script creates all necessary files and folders

echo "🚀 Setting up Woodward & Guy website structure..."

# Create directories
echo "📁 Creating directories..."
mkdir -p components/common
mkdir -p components/layout
mkdir -p components/sections
mkdir -p lib/constants
mkdir -p lib/hooks
mkdir -p lib/utils
mkdir -p types
mkdir -p app/api/contact

# Create type definitions
echo "📝 Creating type definitions..."
cat > types/index.ts << 'EOF'
// types/index.ts
export interface Service {
  id: string;
  icon: string;
  title: string;
  description: string;
}

export interface Solution {
  id: string;
  title: string;
  tier: 'foundation' | 'premium';
  features: string[];
  cta: {
    text: string;
    href: string;
  };
}

export interface Testimonial {
  id: string;
  quote: string;
  author: string;
  company: string;
}

export interface CTAButton {
  text: string;
  href: string;
  variant?: 'primary' | 'secondary' | 'outline';
}

export interface NavItem {
  label: string;
  href: string;
}

export interface CompanyInfo {
  name: string;
  tagline: string;
  description: string;
  phone: string;
  email: string;
}
EOF

# Create utilities
echo "🛠️ Creating utilities..."
cat > lib/utils/classNames.ts << 'EOF'
// lib/utils/classNames.ts
import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
EOF

cat > lib/utils/formatters.ts << 'EOF'
// lib/utils/formatters.ts
export const formatPhone = (phone: string): string => {
  return phone.replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3');
};

export const formatEmail = (email: string): string => {
  return email.toLowerCase().trim();
};

export const truncateText = (text: string, maxLength: number): string => {
  if (text.length <= maxLength) return text;
  return text.substring(0, maxLength).trim() + '...';
};
EOF

# Create constants
echo "📊 Creating constants..."
cat > lib/constants/theme.ts << 'EOF'
// lib/constants/theme.ts
export const COLORS = {
  primary: {
    50: '#eff6ff',
    100: '#dbeafe',
    200: '#bfdbfe',
    300: '#93c5fd',
    400: '#60a5fa',
    500: '#3b82f6',
    600: '#2563eb',
    700: '#1d4ed8',
    800: '#1e40af',
    900: '#1e3a8a',
  },
  gray: {
    50: '#f9fafb',
    100: '#f3f4f6',
    200: '#e5e7eb',
    300: '#d1d5db',
    400: '#9ca3af',
    500: '#6b7280',
    600: '#4b5563',
    700: '#374151',
    800: '#1f2937',
    900: '#111827',
  }
};

export const SPACING = {
  section: 'py-16 lg:py-24',
  container: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
  card: 'p-6 lg:p-8'
};

export const ANIMATIONS = {
  fadeIn: {
    initial: { opacity: 0, y: 20 },
    animate: { opacity: 1, y: 0 },
    transition: { duration: 0.6 }
  },
  fadeInUp: {
    initial: { opacity: 0, y: 40 },
    animate: { opacity: 1, y: 0 },
    transition: { duration: 0.6 }
  },
  fadeInDown: {
    initial: { opacity: 0, y: -20 },
    animate: { opacity: 1, y: 0 },
    transition: { duration: 0.6 }
  },
  stagger: {
    animate: {
      transition: {
        staggerChildren: 0.1
      }
    }
  },
  scale: {
    initial: { opacity: 0, scale: 0.8 },
    animate: { opacity: 1, scale: 1 },
    transition: { duration: 0.5 }
  }
};

export const BREAKPOINTS = {
  sm: '640px',
  md: '768px',
  lg: '1024px',
  xl: '1280px',
  '2xl': '1536px',
};
EOF

cat > lib/constants/content.ts << 'EOF'
// lib/constants/content.ts
import { Service, Solution, Testimonial, CompanyInfo } from '@/types';

export const COMPANY: CompanyInfo = {
  name: "Woodward & Guy",
  tagline: "Strategic Growth. Built on Data. Driven by Results.",
  description: "Woodward & Guy delivers tailored solutions that align strategy, data, and execution.",
  phone: "(717) 417-8618",
  email: "contact@woodwardandguy.com"
};

export const HERO_CONTENT = {
  heading: COMPANY.tagline,
  subheading: COMPANY.description,
  primaryCTA: {
    text: "Schedule Free Consultation",
    href: "#contact",
    variant: "primary" as const
  }
};

export const SERVICES: Service[] = [
  {
    id: "foundations",
    icon: "FaChartLine",
    title: "Establish resilient business foundations",
    description: "Start with structured audits, SWOT analysis, and lean process optimization. Align business operations with a clear, data-driven roadmap."
  },
  {
    id: "scale",
    icon: "FaRocket",
    title: "Scale operations with strategic precision",
    description: "Enable growth through AI-driven insights, compliance alignment, infrastructure planning, and embedded analytics—built for scale."
  },
  {
    id: "marketing",
    icon: "FaBullseye",
    title: "Drive marketing ROI with precision targeting",
    description: "Execute with clarity using GA4, segmentation, retargeting, and KPI-driven campaigns that maximize reach and efficiency."
  }
];

export const SOLUTIONS: Solution[] = [
  {
    id: "business-strategy",
    title: "Business Strategy Plan",
    tier: "foundation",
    features: [
      "Business review (structure, goals, operations)",
      "Lean process evaluation to identify inefficiencies",
      "SWOT analysis to assess current positioning",
      "Infrastructure audit (tools, systems, reporting readiness)",
      "Strategic recommendations for optimization and growth",
      "Priority roadmap with short- and mid-term action items"
    ],
    cta: {
      text: "Learn More",
      href: "/solutions/business-strategy"
    }
  },
  {
    id: "marketing-plan",
    title: "Marketing Plan",
    tier: "foundation",
    features: [
      "Google Tag Manager setup (event tracking & goals)",
      "GA4 property configuration with KPI alignment",
      "Retargeting pixel placement (Google, Meta, LinkedIn)",
      "Basic funnel mapping & segmentation",
      "30-day tactical rollout checklist",
      "Lightweight dashboard setup"
    ],
    cta: {
      text: "Learn More",
      href: "/solutions/marketing-plan"
    }
  },
  {
    id: "ward-strategy",
    title: "Ward Strategy",
    tier: "premium",
    features: [
      "Audit & compliance operational alignment",
      "Org structure guidance (growth-stage roles)",
      "Workflow optimization (collaboration & tooling)",
      "AI-assisted efficiency & scale mapping",
      "Tailored infrastructure planning",
      "Embedded analytics for visibility"
    ],
    cta: {
      text: "Learn More",
      href: "/solutions/ward-strategy"
    }
  },
  {
    id: "ward-marketing",
    title: "Ward Marketing",
    tier: "premium",
    features: [
      "Multi-platform performance integration (Meta, Google, CRM)",
      "Custom event strategy (form abandon, scroll depth)",
      "Cross-domain tracking & attribution",
      "Automated remarketing campaign structure",
      "AI-optimized copy testing & targeting",
      "Predictive benchmarks & budget modeling"
    ],
    cta: {
      text: "Learn More",
      href: "/solutions/ward-marketing"
    }
  }
];

export const TESTIMONIALS: Testimonial[] = [
  {
    id: "testimonial-1",
    quote: "Ward Analytics helped us unify scattered data and uncover trends we didn't know existed.",
    author: "VP, Growth Marketing",
    company: "Regional Homebuilder"
  }
];

export const CTA_CONTENT = {
  heading: "Let's Build Your Data-Driven Advantage",
  subheading: "Our experts are ready to craft a solution aligned with your business model.",
  button: {
    text: "Schedule Free Consultation",
    href: "#contact",
    variant: "primary" as const
  }
};

export const FOOTER_CONTENT = {
  phoneHeading: "Prefer to speak directly?",
  phoneSubheading: "Call us now and one of our partners will answer:",
  copyright: `© ${new Date().getFullYear()} ${COMPANY.name}. All rights reserved.`,
  sections: [
    {
      title: "Solutions",
      links: [
        { label: "Business Strategy", href: "/solutions/business-strategy" },
        { label: "Marketing Plan", href: "/solutions/marketing-plan" },
        { label: "Ward Strategy", href: "/solutions/ward-strategy" },
        { label: "Ward Marketing", href: "/solutions/ward-marketing" }
      ]
    },
    {
      title: "Company",
      links: [
        { label: "About", href: "/about" },
        { label: "Contact", href: "/contact" },
        { label: "Privacy Policy", href: "/privacy" },
        { label: "Terms of Service", href: "/terms" }
      ]
    }
  ]
};
EOF

cat > lib/constants/navigation.ts << 'EOF'
// lib/constants/navigation.ts
import { NavItem } from '@/types';

export const NAVIGATION_ITEMS: NavItem[] = [
  {
    label: 'Services',
    href: '#services'
  },
  {
    label: 'Solutions',
    href: '#solutions'
  },
  {
    label: 'About',
    href: '#about'
  },
  {
    label: 'Contact',
    href: '#contact'
  }
];

export const MOBILE_MENU_ITEMS = NAVIGATION_ITEMS;
EOF

# Create hooks
echo "🪝 Creating hooks..."
cat > lib/hooks/useScrollPosition.ts << 'EOF'
// lib/hooks/useScrollPosition.ts
import { useState, useEffect } from 'react';

export function useScrollPosition() {
  const [scrollPosition, setScrollPosition] = useState(0);
  const [isScrolled, setIsScrolled] = useState(false);
  
  useEffect(() => {
    const handleScroll = () => {
      const position = window.scrollY;
      setScrollPosition(position);
      setIsScrolled(position > 10);
    };
    
    // Set initial position
    handleScroll();
    
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);
  
  return { scrollPosition, isScrolled };
}
EOF

cat > lib/hooks/useIntersectionObserver.ts << 'EOF'
// lib/hooks/useIntersectionObserver.ts
import { useEffect, useRef, useState } from 'react';

interface UseIntersectionObserverProps {
  threshold?: number;
  root?: Element | null;
  rootMargin?: string;
  freezeOnceVisible?: boolean;
}

export function useIntersectionObserver({
  threshold = 0,
  root = null,
  rootMargin = '0%',
  freezeOnceVisible = false,
}: UseIntersectionObserverProps = {}) {
  const [entry, setEntry] = useState<IntersectionObserverEntry>();
  const [isVisible, setIsVisible] = useState(false);
  const frozen = useRef(false);
  
  const ref = useRef<Element>(null);
  
  useEffect(() => {
    const node = ref?.current;
    if (!node || frozen.current) return;
    
    const observer = new IntersectionObserver(
      ([entry]) => {
        setEntry(entry);
        setIsVisible(entry.isIntersecting);
        
        if (entry.isIntersecting && freezeOnceVisible) {
          frozen.current = true;
        }
      },
      { threshold, root, rootMargin }
    );
    
    observer.observe(node);
    
    return () => observer.disconnect();
  }, [threshold, root, rootMargin, freezeOnceVisible]);
  
  return { ref, entry, isVisible };
}
EOF

# Create common components
echo "🧩 Creating common components..."
cat > components/common/Button.tsx << 'EOF'
// components/common/Button.tsx
import Link from 'next/link';
import { cn } from '@/lib/utils/classNames';

interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'outline';
  size?: 'sm' | 'md' | 'lg';
  href?: string;
  onClick?: () => void;
  children: React.ReactNode;
  className?: string;
  disabled?: boolean;
  type?: 'button' | 'submit' | 'reset';
}

export default function Button({ 
  variant = 'primary', 
  size = 'md', 
  href, 
  onClick, 
  children, 
  className,
  disabled = false,
  type = 'button'
}: ButtonProps) {
  const baseClasses = 'inline-flex items-center justify-center font-medium rounded-md transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed';
  
  const variants = {
    primary: 'bg-primary-600 text-white hover:bg-primary-700 focus:ring-primary-500 shadow-sm hover:shadow-md',
    secondary: 'bg-gray-100 text-gray-900 hover:bg-gray-200 focus:ring-gray-500',
    outline: 'border-2 border-gray-300 text-gray-700 hover:bg-gray-50 focus:ring-gray-500'
  };
  
  const sizes = {
    sm: 'px-4 py-2 text-sm',
    md: 'px-6 py-3 text-base',
    lg: 'px-8 py-4 text-lg'
  };
  
  const classes = cn(baseClasses, variants[variant], sizes[size], className);
  
  if (href && !disabled) {
    return (
      <Link href={href} className={classes}>
        {children}
      </Link>
    );
  }
  
  return (
    <button 
      type={type}
      onClick={onClick} 
      className={classes}
      disabled={disabled}
    >
      {children}
    </button>
  );
}
EOF

cat > components/common/Container.tsx << 'EOF'
// components/common/Container.tsx
import { cn } from '@/lib/utils/classNames';

interface ContainerProps {
  children: React.ReactNode;
  className?: string;
  size?: 'default' | 'narrow' | 'wide';
}

export default function Container({ 
  children, 
  className,
  size = 'default' 
}: ContainerProps) {
  const sizes = {
    narrow: 'max-w-4xl',
    default: 'max-w-7xl',
    wide: 'max-w-screen-2xl'
  };
  
  return (
    <div className={cn(
      sizes[size], 
      'mx-auto px-4 sm:px-6 lg:px-8', 
      className
    )}>
      {children}
    </div>
  );
}
EOF

cat > components/common/Section.tsx << 'EOF'
// components/common/Section.tsx
import { cn } from '@/lib/utils/classNames';
import Container from './Container';

interface SectionProps {
  id?: string;
  background?: 'white' | 'gray' | 'gradient' | 'dark';
  children: React.ReactNode;
  className?: string;
  containerSize?: 'default' | 'narrow' | 'wide';
  noPadding?: boolean;
}

export default function Section({ 
  id, 
  background = 'white', 
  children, 
  className,
  containerSize = 'default',
  noPadding = false
}: SectionProps) {
  const backgrounds = {
    white: 'bg-white',
    gray: 'bg-gray-50',
    gradient: 'bg-gradient-to-br from-blue-50 via-white to-indigo-50',
    dark: 'bg-gray-900 text-white'
  };
  
  const padding = noPadding ? '' : 'py-16 lg:py-24';
  
  return (
    <section 
      id={id} 
      className={cn(
        backgrounds[background], 
        padding,
        className
      )}
    >
      <Container size={containerSize}>
        {children}
      </Container>
    </section>
  );
}
EOF

cat > components/common/Heading.tsx << 'EOF'
// components/common/Heading.tsx
import { cn } from '@/lib/utils/classNames';

interface HeadingProps {
  level?: 1 | 2 | 3 | 4 | 5 | 6;
  children: React.ReactNode;
  className?: string;
  align?: 'left' | 'center' | 'right';
  size?: 'sm' | 'md' | 'lg' | 'xl';
}

export default function Heading({ 
  level = 2, 
  children, 
  className,
  align = 'left',
  size = 'lg'
}: HeadingProps) {
  const Tag = `h${level}` as keyof JSX.IntrinsicElements;
  
  const alignments = {
    left: 'text-left',
    center: 'text-center',
    right: 'text-right'
  };
  
  const sizes = {
    sm: 'text-lg md:text-xl font-semibold',
    md: 'text-xl md:text-2xl lg:text-3xl font-bold',
    lg: 'text-2xl md:text-3xl lg:text-4xl font-bold',
    xl: 'text-3xl md:text-4xl lg:text-5xl font-bold'
  };
  
  return (
    <Tag className={cn(
      'text-gray-900',
      alignments[align],
      sizes[size],
      className
    )}>
      {children}
    </Tag>
  );
}
EOF

cat > components/common/Card.tsx << 'EOF'
// components/common/Card.tsx
import { cn } from '@/lib/utils/classNames';

interface CardProps {
  variant?: 'default' | 'bordered' | 'gradient' | 'elevated';
  children: React.ReactNode;
  className?: string;
  hover?: boolean;
}

export default function Card({ 
  variant = 'default', 
  children, 
  className,
  hover = true
}: CardProps) {
  const baseClasses = 'rounded-lg transition-all duration-200';
  
  const variants = {
    default: 'bg-white shadow-md',
    bordered: 'bg-white border-2 border-gray-200',
    gradient: 'bg-gradient-to-br from-blue-500 to-indigo-600 text-white',
    elevated: 'bg-white shadow-lg'
  };
  
  const hoverClasses = hover ? {
    default: 'hover:shadow-lg',
    bordered: 'hover:border-primary-500',
    gradient: 'hover:shadow-xl hover:scale-[1.02]',
    elevated: 'hover:shadow-xl hover:-translate-y-1'
  }[variant] : '';
  
  return (
    <div className={cn(
      baseClasses,
      variants[variant],
      hoverClasses,
      'p-6 lg:p-8',
      className
    )}>
      {children}
    </div>
  );
}
EOF

# Create layout components
echo "🏗️ Creating layout components..."
cat > components/layout/Header.tsx << 'EOF'
// components/layout/Header.tsx
'use client';

import { useState } from 'react';
import Link from 'next/link';
import { FaBars, FaTimes } from 'react-icons/fa';
import { cn } from '@/lib/utils/classNames';
import { useScrollPosition } from '@/lib/hooks/useScrollPosition';
import { COMPANY } from '@/lib/constants/content';
import { NAVIGATION_ITEMS } from '@/lib/constants/navigation';
import Button from '@/components/common/Button';
import Container from '@/components/common/Container';

export default function Header() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const { isScrolled } = useScrollPosition();
  
  const toggleMobileMenu = () => setMobileMenuOpen(!mobileMenuOpen);
  
  return (
    <header className={cn(
      'fixed top-0 left-0 right-0 z-50 transition-all duration-300',
      isScrolled 
        ? 'bg-white shadow-md' 
        : 'bg-transparent'
    )}>
      <Container>
        <nav className="flex items-center justify-between py-4 lg:py-6">
          {/* Logo */}
          <Link href="/" className="flex items-center">
            <span className={cn(
              'text-2xl font-bold transition-colors',
              isScrolled ? 'text-gray-900' : 'text-gray-900'
            )}>
              {COMPANY.name}
            </span>
          </Link>
          
          {/* Desktop Navigation */}
          <div className="hidden lg:flex items-center space-x-8">
            {NAVIGATION_ITEMS.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className={cn(
                  'font-medium transition-colors hover:text-primary-600',
                  isScrolled ? 'text-gray-700' : 'text-gray-700'
                )}
              >
                {item.label}
              </Link>
            ))}
            <Button
              href="#contact"
              size="sm"
              variant="primary"
            >
              Schedule Consultation
            </Button>
          </div>
          
          {/* Mobile Menu Button */}
          <button
            onClick={toggleMobileMenu}
            className="lg:hidden p-2 rounded-md text-gray-700 hover:text-primary-600 focus:outline-none"
            aria-label="Toggle menu"
          >
            {mobileMenuOpen ? <FaTimes size={24} /> : <FaBars size={24} />}
          </button>
        </nav>
      </Container>
      
      {/* Mobile Menu */}
      <div className={cn(
        'lg:hidden fixed inset-x-0 top-full bg-white shadow-lg transition-all duration-300 ease-in-out',
        mobileMenuOpen 
          ? 'opacity-100 translate-y-0' 
          : 'opacity-0 -translate-y-full pointer-events-none'
      )}>
        <Container>
          <div className="py-4 space-y-4">
            {NAVIGATION_ITEMS.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="block py-2 text-gray-700 font-medium hover:text-primary-600"
                onClick={() => setMobileMenuOpen(false)}
              >
                {item.label}
              </Link>
            ))}
            <Button
              href="#contact"
              size="md"
              variant="primary"
              className="w-full"
              onClick={() => setMobileMenuOpen(false)}
            >
              Schedule Consultation
            </Button>
          </div>
        </Container>
      </div>
    </header>
  );
}
EOF

cat > components/layout/Footer.tsx << 'EOF'
// components/layout/Footer.tsx
import Link from 'next/link';
import { FaPhone, FaEnvelope, FaLinkedin, FaTwitter } from 'react-icons/fa';
import { COMPANY, FOOTER_CONTENT, TESTIMONIALS } from '@/lib/constants/content';
import Container from '@/components/common/Container';
import Card from '@/components/common/Card';

export default function Footer() {
  return (
    <footer className="bg-gray-900 text-gray-300">
      {/* Testimonial Section */}
      <div className="border-b border-gray-800">
        <Container>
          <div className="py-12">
            <Card variant="default" className="bg-gray-800 border-gray-700 max-w-3xl mx-auto">
              <blockquote className="text-center">
                <p className="text-lg md:text-xl text-gray-100 mb-4 italic">
                  "{TESTIMONIALS[0].quote}"
                </p>
                <footer className="text-sm text-gray-400">
                  — {TESTIMONIALS[0].author}, {TESTIMONIALS[0].company}
                </footer>
              </blockquote>
            </Card>
          </div>
        </Container>
      </div>
      
      {/* Contact CTA */}
      <div className="border-b border-gray-800">
        <Container>
          <div className="py-12 text-center">
            <p className="text-lg text-gray-100 mb-2">{FOOTER_CONTENT.phoneHeading}</p>
            <p className="text-sm text-gray-400 mb-4">{FOOTER_CONTENT.phoneSubheading}</p>
            <a 
              href={`tel:${COMPANY.phone.replace(/\D/g, '')}`}
              className="text-2xl md:text-3xl font-bold text-primary-400 hover:text-primary-300 transition-colors inline-flex items-center gap-3"
            >
              <FaPhone className="text-xl" />
              {COMPANY.phone}
            </a>
          </div>
        </Container>
      </div>
      
      {/* Main Footer */}
      <Container>
        <div className="py-12">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {/* Company Info */}
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">{COMPANY.name}</h3>
              <p className="text-gray-400 mb-6">{COMPANY.description}</p>
              <div className="space-y-2">
                <a 
                  href={`mailto:${COMPANY.email}`}
                  className="flex items-center gap-2 text-gray-400 hover:text-primary-400 transition-colors"
                >
                  <FaEnvelope />
                  {COMPANY.email}
                </a>
                <a 
                  href={`tel:${COMPANY.phone.replace(/\D/g, '')}`}
                  className="flex items-center gap-2 text-gray-400 hover:text-primary-400 transition-colors"
                >
                  <FaPhone />
                  {COMPANY.phone}
                </a>
              </div>
            </div>
            
            {/* Footer Links */}
            {FOOTER_CONTENT.sections.map((section) => (
              <div key={section.title}>
                <h4 className="text-lg font-semibold text-white mb-4">{section.title}</h4>
                <ul className="space-y-2">
                  {section.links.map((link) => (
                    <li key={link.href}>
                      <Link 
                        href={link.href}
                        className="text-gray-400 hover:text-primary-400 transition-colors"
                      >
                        {link.label}
                      </Link>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
          
          {/* Bottom Bar */}
          <div className="mt-12 pt-8 border-t border-gray-800 flex flex-col md:flex-row justify-between items-center gap-4">
            <p className="text-sm text-gray-400">
              {FOOTER_CONTENT.copyright}
            </p>
            <div className="flex gap-4">
              <a 
                href="#" 
                className="text-gray-400 hover:text-primary-400 transition-colors"
                aria-label="LinkedIn"
              >
                <FaLinkedin size={20} />
              </a>
              <a 
                href="#" 
                className="text-gray-400 hover:text-primary-400 transition-colors"
                aria-label="Twitter"
              >
                <FaTwitter size={20} />
              </a>
            </div>
          </div>
        </div>
      </Container>
    </footer>
  );
}
EOF

# Create section components
echo "📱 Creating section components..."
cat > components/sections/HeroSection.tsx << 'EOF'
// components/sections/HeroSection.tsx
'use client';

import { motion } from 'framer-motion';
import Button from '@/components/common/Button';
import Section from '@/components/common/Section';
import { HERO_CONTENT } from '@/lib/constants/content';
import { ANIMATIONS } from '@/lib/constants/theme';

export default function HeroSection() {
  return (
    <Section 
      background="gradient" 
      className="min-h-screen flex items-center pt-20"
      containerSize="narrow"
    >
      <motion.div
        initial={ANIMATIONS.fadeIn.initial}
        animate={ANIMATIONS.fadeIn.animate}
        transition={ANIMATIONS.fadeIn.transition}
        className="text-center w-full"
      >
        <motion.h1 
          className="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 mb-6 leading-tight"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
        >
          {HERO_CONTENT.heading}
        </motion.h1>
        
        <motion.p 
          className="text-xl md:text-2xl text-gray-600 mb-8 max-w-3xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
        >
          {HERO_CONTENT.subheading}
        </motion.p>
        
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
        >
          <Button
            href={HERO_CONTENT.primaryCTA.href}
            variant={HERO_CONTENT.primaryCTA.variant}
            size="lg"
            className="shadow-lg hover:shadow-xl transform hover:-translate-y-0.5"
          >
            {HERO_CONTENT.primaryCTA.text}
          </Button>
        </motion.div>
        
        {/* Decorative elements */}
        <motion.div
          className="absolute top-1/4 left-10 w-20 h-20 bg-primary-200 rounded-full blur-3xl opacity-30"
          animate={{
            x: [0, 30, 0],
            y: [0, -30, 0],
          }}
          transition={{
            duration: 6,
            repeat: Infinity,
            repeatType: "reverse"
          }}
        />
        <motion.div
          className="absolute bottom-1/4 right-10 w-32 h-32 bg-indigo-200 rounded-full blur-3xl opacity-30"
          animate={{
            x: [0, -30, 0],
            y: [0, 30, 0],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            repeatType: "reverse"
          }}
        />
      </motion.div>
    </Section>
  );
}
EOF

cat > components/sections/ServicesSection.tsx << 'EOF'
// components/sections/ServicesSection.tsx
'use client';

import { motion } from 'framer-motion';
import * as Icons from 'react-icons/fa';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';
import { SERVICES, COMPANY } from '@/lib/constants/content';
import { ANIMATIONS } from '@/lib/constants/theme';
import { useIntersectionObserver } from '@/lib/hooks/useIntersectionObserver';

export default function ServicesSection() {
  const { ref, isVisible } = useIntersectionObserver({
    threshold: 0.1,
    freezeOnceVisible: true
  });
  
  return (
    <Section id="services" background="gray">
      <div ref={ref}>
        <motion.div
          initial="initial"
          animate={isVisible ? "animate" : "initial"}
          variants={ANIMATIONS.stagger}
        >
          <motion.div variants={ANIMATIONS.fadeIn} className="text-center mb-12">
            <Heading level={2} size="lg" align="center">
              {COMPANY.name} helps organizations:
            </Heading>
          </motion.div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {SERVICES.map((service, index) => {
              const Icon = Icons[service.icon as keyof typeof Icons] || Icons.FaQuestionCircle;
              
              return (
                <motion.div
                  key={service.id}
                  variants={ANIMATIONS.fadeInUp}
                  custom={index}
                >
                  <Card variant="default" className="h-full text-center">
                    <div className="flex justify-center mb-6">
                      <div className="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center">
                        <Icon className="text-2xl text-primary-600" />
                      </div>
                    </div>
                    <h3 className="text-xl font-semibold text-gray-900 mb-4">
                      {service.title}
                    </h3>
                    <p className="text-gray-600 leading-relaxed">
                      {service.description}
                    </p>
                  </Card>
                </motion.div>
              );
            })}
          </div>
        </motion.div>
      </div>
    </Section>
  );
}
EOF

cat > components/sections/SolutionsSection.tsx << 'EOF'
// components/sections/SolutionsSection.tsx
'use client';

import { motion } from 'framer-motion';
import { FaCheck } from 'react-icons/fa';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';
import Button from '@/components/common/Button';
import { SOLUTIONS } from '@/lib/constants/content';
import { ANIMATIONS } from '@/lib/constants/theme';
import { useIntersectionObserver } from '@/lib/hooks/useIntersectionObserver';
import { cn } from '@/lib/utils/classNames';

export default function SolutionsSection() {
  const { ref, isVisible } = useIntersectionObserver({
    threshold: 0.1,
    freezeOnceVisible: true
  });
  
  return (
    <Section id="solutions" background="white">
      <div ref={ref}>
        <motion.div
          initial="initial"
          animate={isVisible ? "animate" : "initial"}
          variants={ANIMATIONS.stagger}
        >
          <motion.div variants={ANIMATIONS.fadeIn} className="text-center mb-12">
            <Heading level={2} size="lg" align="center" className="mb-4">
              Explore Our Strategic Solutions
            </Heading>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Data-driven strategy, measurable marketing execution, and powerful analytics tailored to your growth goals.
            </p>
          </motion.div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {SOLUTIONS.map((solution, index) => (
              <motion.div
                key={solution.id}
                variants={ANIMATIONS.fadeInUp}
                custom={index}
              >
                <Card 
                  variant="bordered" 
                  className={cn(
                    "h-full",
                    solution.tier === 'premium' && "border-primary-500 relative overflow-hidden"
                  )}
                >
                  {solution.tier === 'premium' && (
                    <div className="absolute top-0 right-0 bg-primary-600 text-white px-4 py-1 text-sm font-medium rounded-bl-lg">
                      Premium
                    </div>
                  )}
                  
                  <h3 className="text-2xl font-bold text-gray-900 mb-6">
                    {solution.title}
                  </h3>
                  
                  <ul className="space-y-3 mb-8">
                    {solution.features.map((feature, featureIndex) => (
                      <li key={featureIndex} className="flex items-start">
                        <FaCheck className="text-primary-600 mt-1 mr-3 flex-shrink-0" />
                        <span className="text-gray-600 text-sm">{feature}</span>
                      </li>
                    ))}
                  </ul>
                  
                  <Button
                    href={solution.cta.href}
                    variant={solution.tier === 'premium' ? 'primary' : 'outline'}
                    className="w-full"
                  >
                    {solution.cta.text}
                  </Button>
                </Card>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </Section>
  );
}
EOF

cat > components/sections/CTASection.tsx << 'EOF'
// components/sections/CTASection.tsx
'use client';

import { motion } from 'framer-motion';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Button from '@/components/common/Button';
import { CTA_CONTENT } from '@/lib/constants/content';
import { ANIMATIONS } from '@/lib/constants/theme';
import { useIntersectionObserver } from '@/lib/hooks/useIntersectionObserver';

export default function CTASection() {
  const { ref, isVisible } = useIntersectionObserver({
    threshold: 0.1,
    freezeOnceVisible: true
  });
  
  return (
    <Section 
      id="cta" 
      background="gradient"
      className="relative overflow-hidden"
    >
      <div ref={ref} className="relative z-10">
        <motion.div
          initial="initial"
          animate={isVisible ? "animate" : "initial"}
          variants={ANIMATIONS.stagger}
          className="text-center max-w-3xl mx-auto"
        >
          <motion.div variants={ANIMATIONS.fadeIn}>
            <Heading level={2} size="xl" align="center" className="mb-6">
              {CTA_CONTENT.heading}
            </Heading>
          </motion.div>
          
          <motion.p 
            variants={ANIMATIONS.fadeIn}
            className="text-xl text-gray-600 mb-8"
          >
            {CTA_CONTENT.subheading}
          </motion.p>
          
          <motion.div variants={ANIMATIONS.scale}>
            <Button
              href={CTA_CONTENT.button.href}
              variant={CTA_CONTENT.button.variant}
              size="lg"
              className="shadow-xl hover:shadow-2xl transform hover:-translate-y-1"
            >
              {CTA_CONTENT.button.text}
            </Button>
          </motion.div>
        </motion.div>
      </div>
      
      {/* Background decorations */}
      <motion.div
        className="absolute top-0 left-1/4 w-64 h-64 bg-primary-200 rounded-full blur-3xl opacity-20"
        animate={{
          scale: [1, 1.2, 1],
          rotate: [0, 90, 0],
        }}
        transition={{
          duration: 10,
          repeat: Infinity,
          repeatType: "reverse"
        }}
      />
      <motion.div
        className="absolute bottom-0 right-1/4 w-96 h-96 bg-indigo-200 rounded-full blur-3xl opacity-20"
        animate={{
          scale: [1, 1.3, 1],
          rotate: [0, -90, 0],
        }}
        transition={{
          duration: 12,
          repeat: Infinity,
          repeatType: "reverse"
        }}
      />
    </Section>
  );
}
EOF

# Create API route
echo "🔌 Creating API route..."
cat > app/api/contact/route.ts << 'EOF'
// app/api/contact/route.ts
import { NextRequest, NextResponse } from 'next/server';

interface ContactFormData {
  name: string;
  email: string;
  phone?: string;
  company?: string;
  message: string;
}

export async function POST(request: NextRequest) {
  try {
    const body: ContactFormData = await request.json();
    
    // Validate required fields
    if (!body.name || !body.email || !body.message) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      );
    }
    
    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(body.email)) {
      return NextResponse.json(
        { error: 'Invalid email format' },
        { status: 400 }
      );
    }
    
    // Here you would integrate with your email service
    // Examples: SendGrid, Resend, AWS SES, etc.
    
    // For now, we'll just log the submission
    console.log('Contact form submission:', {
      name: body.name,
      email: body.email,
      phone: body.phone || 'Not provided',
      company: body.company || 'Not provided',
      message: body.message,
      timestamp: new Date().toISOString()
    });
    
    // Example integration with Resend (uncomment and configure if using Resend):
    /*
    if (process.env.RESEND_API_KEY) {
      const resend = new Resend(process.env.RESEND_API_KEY);
      
      await resend.emails.send({
        from: 'noreply@woodwardandguy.com',
        to: 'contact@woodwardandguy.com',
        subject: `New Contact Form Submission from ${body.name}`,
        html: `
          <h2>New Contact Form Submission</h2>
          <p><strong>Name:</strong> ${body.name}</p>
          <p><strong>Email:</strong> ${body.email}</p>
          <p><strong>Phone:</strong> ${body.phone || 'Not provided'}</p>
          <p><strong>Company:</strong> ${body.company || 'Not provided'}</p>
          <p><strong>Message:</strong></p>
          <p>${body.message}</p>
        `
      });
    }
    */
    
    return NextResponse.json(
      { 
        success: true,
        message: 'Thank you for your message. We\'ll be in touch soon!' 
      },
      { status: 200 }
    );
    
  } catch (error) {
    console.error('Contact form error:', error);
    return NextResponse.json(
      { error: 'Failed to process your request. Please try again.' },
      { status: 500 }
    );
  }
}
EOF

# Create updated app files
echo "📄 Creating updated app files..."
cat > app/page.tsx << 'EOF'
// app/page.tsx
import HeroSection from '@/components/sections/HeroSection';
import ServicesSection from '@/components/sections/ServicesSection';
import SolutionsSection from '@/components/sections/SolutionsSection';
import CTASection from '@/components/sections/CTASection';

export default function Home() {
  return (
    <>
      <HeroSection />
      <ServicesSection />
      <SolutionsSection />
      <CTASection />
    </>
  );
}
EOF

# Create CSS additions file
cat > app/globals-additions.css << 'EOF'
/* Add these styles to your existing app/globals.css */

@layer base {
  /* Custom color variables */
  :root {
    --color-primary-50: 239 246 255;
    --color-primary-100: 219 234 254;
    --color-primary-200: 191 219 254;
    --color-primary-300: 147 197 253;
    --color-primary-400: 96 165 250;
    --color-primary-500: 59 130 246;
    --color-primary-600: 37 99 235;
    --color-primary-700: 29 78 216;
    --color-primary-800: 30 64 175;
    --color-primary-900: 30 58 138;
  }
  
  /* Smooth scrolling */
  html {
    scroll-behavior: smooth;
  }
  
  /* Remove default focus styles and add custom ones */
  *:focus {
    outline: none;
  }
  
  /* Custom selection color */
  ::selection {
    background-color: rgb(var(--color-primary-200));
    color: rgb(var(--color-primary-900));
  }
}

@layer components {
  /* Custom utility classes */
  .gradient-text {
    @apply bg-gradient-to-r from-primary-600 to-indigo-600 bg-clip-text text-transparent;
  }
  
  .gradient-bg {
    @apply bg-gradient-to-br from-blue-50 via-white to-indigo-50;
  }
  
  /* Animation classes */
  .animate-float {
    animation: float 6s ease-in-out infinite;
  }
  
  @keyframes float {
    0%, 100% {
      transform: translateY(0);
    }
    50% {
      transform: translateY(-20px);
    }
  }
}

@layer utilities {
  /* Hide scrollbar but keep functionality */
  .scrollbar-hide {
    -ms-overflow-style: none;
    scrollbar-width: none;
  }
  
  .scrollbar-hide::-webkit-scrollbar {
    display: none;
  }
  
  /* Text balance for better readability */
  .text-balance {
    text-wrap: balance;
  }
}
EOF

# Create environment variables template
cat > .env.local.example << 'EOF'
# Copy this file to .env.local and fill in your values
NEXT_PUBLIC_GA_ID=your-google-analytics-id
NEXT_PUBLIC_SITE_URL=https://woodwardandguy.com
RESEND_API_KEY=your-resend-api-key
EOF

# Create a README for the implementation
cat > WOODWARD_GUY_SETUP.md << 'EOF'
# Woodward & Guy Website Setup

## Installation Steps

1. **Install dependencies:**
   ```bash
   npm install framer-motion react-icons clsx tailwind-merge
   npm install --save-dev @types/node
   ```

2. **Update your app/layout.tsx:**
   Add these imports at the top:
   ```typescript
   import Header from '@/components/layout/Header';
   import Footer from '@/components/layout/Footer';
   import { COMPANY } from '@/lib/constants/content';
   ```

   Update your metadata and wrap children with Header/Footer:
   ```typescript
   export const metadata: Metadata = {
     title: `${COMPANY.name} - ${COMPANY.tagline}`,
     description: COMPANY.description,
     // ... other metadata
   };

   // In the body:
   <body className={inter.className}>
     <Header />
     <main>{children}</main>
     <Footer />
   </body>
   ```

3. **Update tailwind.config.ts:**
   Add the primary color palette:
   ```typescript
   theme: {
     extend: {
       colors: {
         primary: {
           50: '#eff6ff',
           100: '#dbeafe',
           200: '#bfdbfe',
           300: '#93c5fd',
           400: '#60a5fa',
           500: '#3b82f6',
           600: '#2563eb',
           700: '#1d4ed8',
           800: '#1e40af',
           900: '#1e3a8a',
         }
       }
     }
   }
   ```

4. **Add the CSS styles to your app/globals.css:**
   Copy the contents from `app/globals-additions.css` to your existing `app/globals.css` file.

5. **Create environment variables:**
   Copy `.env.local.example` to `.env.local` and fill in your values.

6. **Run the development server:**
   ```bash
   npm run dev
   ```

## File Structure Created

```
├── components/
│   ├── common/
│   │   ├── Button.tsx
│   │   ├── Card.tsx
│   │   ├── Container.tsx
│   │   ├── Heading.tsx
│   │   └── Section.tsx
│   ├── layout/
│   │   ├── Footer.tsx
│   │   └── Header.tsx
│   └── sections/
│       ├── CTASection.tsx
│       ├── HeroSection.tsx
│       ├── ServicesSection.tsx
│       └── SolutionsSection.tsx
├── lib/
│   ├── constants/
│   │   ├── content.ts
│   │   ├── navigation.ts
│   │   └── theme.ts
│   ├── hooks/
│   │   ├── useIntersectionObserver.ts
│   │   └── useScrollPosition.ts
│   └── utils/
│       ├── classNames.ts
│       └── formatters.ts
├── types/
│   └── index.ts
└── app/
    ├── api/
    │   └── contact/
    │       └── route.ts
    └── page.tsx (updated)
```

## Troubleshooting

- If you get import errors, make sure your `tsconfig.json` has the correct path aliases.
- If styles aren't working, ensure Tailwind is properly configured.
- For TypeScript errors, install `@types/node` if not already installed.
EOF

echo "✅ Setup complete! All files have been created."
echo ""
echo "Next steps:"
echo "1. Run: chmod +x setup-woodward-guy.sh"
echo "2. Run: ./setup-woodward-guy.sh"
echo "3. Install dependencies: npm install framer-motion react-icons clsx tailwind-merge"
echo "4. Follow the instructions in WOODWARD_GUY_SETUP.md"
echo ""
echo "Remember to:"
echo "- Update your app/layout.tsx file"
echo "- Add styles to your app/globals.css"
echo "- Update your tailwind.config.ts"
echo "- Create a .env.local file with your environment variables"
EOF
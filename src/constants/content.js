export const COMPANY = {
  name: "Woodward & Guy",
  tagline: "Strategic Growth. Built on Data. Driven by Results.",
  description: "Woodward & Guy delivers tailored solutions that align strategy, data, and execution.",
  phone: "(717) 417-8618",
  email: "contact@woodwardandguy.com",
  address: "Pennsylvania, USA"
};

export const HERO_CONTENT = {
  heading: COMPANY.tagline,
  subheading: COMPANY.description,
  primaryCTA: {
    text: "Schedule Free Consultation",
    href: "#contact",
    variant: "primary"
  },
  secondaryCTA: {
    text: "View Our Solutions",
    href: "#solutions",
    variant: "outline"
  }
};

export const SERVICES = [
  {
    id: "foundations",
    icon: "FaChartLine",
    title: "Establish resilient business foundations",
    description: "Start with structured audits, SWOT analysis, and lean process optimization. Align business operations with a clear, data-driven roadmap.",
    features: ["Business Audits", "SWOT Analysis", "Process Optimization", "Strategic Planning"]
  },
  {
    id: "scale",
    icon: "FaRocket",
    title: "Scale operations with strategic precision",
    description: "Enable growth through AI-driven insights, compliance alignment, infrastructure planning, and embedded analytics—built for scale.",
    features: ["AI-Driven Insights", "Compliance Alignment", "Infrastructure Planning", "Analytics Integration"]
  },
  {
    id: "marketing",
    icon: "FaBullseye",
    title: "Drive marketing ROI with precision targeting",
    description: "Execute with clarity using GA4, segmentation, retargeting, and KPI-driven campaigns that maximize reach and efficiency.",
    features: ["GA4 Implementation", "Audience Segmentation", "Campaign Optimization", "ROI Tracking"]
  }
];

export const SOLUTIONS = [
  {
    id: "business-strategy",
    title: "Business Strategy Plan",
    tier: "Foundation",
    price: "Starting at $2,500",
    description: "Comprehensive business review and strategic roadmap development",
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
      href: "#contact"
    }
  },
  {
    id: "growth-acceleration",
    title: "Growth Acceleration Package",
    tier: "Scale",
    price: "Starting at $5,000",
    description: "Advanced analytics and growth optimization for scaling businesses",
    features: [
      "Advanced data analytics implementation",
      "Customer acquisition optimization",
      "Revenue stream diversification",
      "Performance monitoring dashboards",
      "Scalable process automation",
      "Quarterly growth reviews"
    ],
    cta: {
      text: "Learn More",
      href: "#contact"
    }
  },
  {
    id: "marketing-optimization",
    title: "Marketing ROI Optimization",
    tier: "Performance",
    price: "Starting at $3,500",
    description: "Data-driven marketing strategies that maximize return on investment",
    features: [
      "GA4 setup and optimization",
      "Conversion tracking implementation",
      "Audience segmentation and targeting",
      "Campaign performance analysis",
      "A/B testing framework",
      "Monthly performance reports"
    ],
    cta: {
      text: "Learn More",
      href: "#contact"
    }
  }
];

export const TESTIMONIALS = [
  {
    id: "testimonial-1",
    quote: "Woodward & Guy helped us unify scattered data and uncover trends we didn't know existed. Their strategic approach transformed our decision-making process.",
    author: "Sarah Chen",
    title: "VP, Growth Marketing",
    company: "Regional Homebuilder"
  },
  {
    id: "testimonial-2",
    quote: "The business strategy plan they developed became our roadmap to success. We've seen 40% growth in the first year of implementation.",
    author: "Michael Rodriguez",
    title: "CEO",
    company: "Tech Startup"
  },
  {
    id: "testimonial-3",
    quote: "Their marketing optimization work doubled our conversion rates while reducing our acquisition costs by 30%.",
    author: "Jennifer Walsh",
    title: "Marketing Director",
    company: "E-commerce Company"
  }
];

export const STATS = [
  {
    id: "clients",
    value: "50+",
    label: "Clients Served"
  },
  {
    id: "growth",
    value: "40%",
    label: "Average Growth Increase"
  },
  {
    id: "roi",
    value: "300%",
    label: "Average ROI Improvement"
  },
  {
    id: "experience",
    value: "15+",
    label: "Years Experience"
  }
];

export const FAQ = [
  {
    id: "what-makes-different",
    question: "What makes Woodward & Guy different from other consulting firms?",
    answer: "We combine strategic thinking with hands-on implementation. Our data-driven approach ensures every recommendation is backed by solid analytics, and we work alongside your team to ensure successful execution."
  },
  {
    id: "how-long-engagement",
    question: "How long does a typical engagement last?",
    answer: "Engagement length varies based on your needs. Our Business Strategy Plans typically take 4-6 weeks, while ongoing optimization work can range from 3-12 months depending on scope and objectives."
  },
  {
    id: "industries-served",
    question: "What industries do you serve?",
    answer: "We work with businesses across various industries including technology, healthcare, manufacturing, retail, and professional services. Our methodology adapts to your specific industry challenges and opportunities."
  },
  {
    id: "roi-expectations",
    question: "What kind of ROI can we expect?",
    answer: "While results vary by company and industry, our clients typically see 20-40% improvement in key performance metrics within the first year. We establish clear KPIs upfront to measure success."
  }
];
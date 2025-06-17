'use client';

import { motion } from 'framer-motion';
import { FaChartLine, FaRocket, FaBullseye } from 'react-icons/fa';
import { SERVICES, COMPANY } from '@/constants/content';
import { ANIMATIONS } from '@/constants/theme';
import { useIntersectionObserver } from '@/hooks/useIntersectionObserver';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';

const iconMap = {
  FaChartLine,
  FaRocket,
  FaBullseye
};

const ServiceCard = ({ service, index }) => {
  const IconComponent = iconMap[service.icon];
  
  return (
    <motion.div
      initial={{ opacity: 0, y: 30 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6, delay: index * 0.1 }}
    >
      <Card className="h-full text-center group">
        <div className="mb-6">
          <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:bg-blue-600 transition-colors duration-300">
            <IconComponent className="text-2xl text-blue-600 group-hover:text-white transition-colors duration-300" />
          </div>
          <h3 className="text-xl font-semibold text-gray-900 mb-3">
            {service.title}
          </h3>
          <p className="text-gray-600 leading-relaxed mb-6">
            {service.description}
          </p>
        </div>
        
        <div className="space-y-2">
          {service.features.map((feature, idx) => (
            <div key={idx} className="flex items-center text-sm text-gray-500">
              <div className="w-2 h-2 bg-blue-600 rounded-full mr-3"></div>
              {feature}
            </div>
          ))}
        </div>
      </Card>
    </motion.div>
  );
};

const ServicesSection = () => {
  const { ref, hasIntersected } = useIntersectionObserver();

  return (
    <Section id="services" background="white" ref={ref}>
      <motion.div
        initial="initial"
        animate={hasIntersected ? "animate" : "initial"}
        variants={ANIMATIONS.stagger}
      >
        <div className="text-center mb-16">
          <motion.div variants={ANIMATIONS.fadeIn}>
            <Heading level={2} align="center" className="mb-4">
              {COMPANY.name} helps organizations:
            </Heading>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              We provide comprehensive solutions that drive measurable results across three key areas of your business.
            </p>
          </motion.div>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {SERVICES.map((service, index) => (
            <ServiceCard 
              key={service.id} 
              service={service} 
              index={index}
            />
          ))}
        </div>
      </motion.div>
    </Section>
  );
};

export default ServicesSection;
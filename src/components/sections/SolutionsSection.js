'use client';

import { motion } from 'framer-motion';
import { FaCheck, FaArrowRight } from 'react-icons/fa';
import { SOLUTIONS } from '@/constants/content';
import { ANIMATIONS } from '@/constants/theme';
import { useIntersectionObserver } from '@/hooks/useIntersectionObserver';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';
import Button from '@/components/common/Button';

const SolutionCard = ({ solution, index }) => {
  const tierColors = {
    Foundation: 'bg-green-100 text-green-800',
    Scale: 'bg-blue-100 text-blue-800',
    Performance: 'bg-purple-100 text-purple-800'
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 30 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6, delay: index * 0.1 }}
    >
      <Card className="h-full relative">
        <div className="mb-6">
          <div className="flex items-center justify-between mb-4">
            <span className={`px-3 py-1 rounded-full text-sm font-medium ${tierColors[solution.tier]}`}>
              {solution.tier}
            </span>
            <span className="text-2xl font-bold text-gray-900">
              {solution.price}
            </span>
          </div>
          
          <h3 className="text-2xl font-bold text-gray-900 mb-3">
            {solution.title}
          </h3>
          
          <p className="text-gray-600 mb-6">
            {solution.description}
          </p>
        </div>

        <div className="space-y-3 mb-8">
          {solution.features.map((feature, idx) => (
            <div key={idx} className="flex items-start">
              <FaCheck className="text-green-500 mt-1 mr-3 flex-shrink-0" />
              <span className="text-gray-700">{feature}</span>
            </div>
          ))}
        </div>

        <div className="mt-auto">
          <Button 
            href={solution.cta.href}
            variant="primary"
            className="w-full"
          >
            {solution.cta.text}
            <FaArrowRight className="ml-2" />
          </Button>
        </div>
      </Card>
    </motion.div>
  );
};

const SolutionsSection = () => {
  const { ref, hasIntersected } = useIntersectionObserver();

  return (
    <Section id="solutions" background="gray" ref={ref}>
      <motion.div
        initial="initial"
        animate={hasIntersected ? "animate" : "initial"}
        variants={ANIMATIONS.stagger}
      >
        <div className="text-center mb-16">
          <motion.div variants={ANIMATIONS.fadeIn}>
            <Heading level={2} align="center" className="mb-4">
              Tailored Solutions for Every Stage
            </Heading>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Choose the solution that matches your business needs and growth objectives.
            </p>
          </motion.div>
        </div>
        
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {SOLUTIONS.map((solution, index) => (
            <SolutionCard 
              key={solution.id} 
              solution={solution} 
              index={index}
            />
          ))}
        </div>
      </motion.div>
    </Section>
  );
};

export default SolutionsSection;
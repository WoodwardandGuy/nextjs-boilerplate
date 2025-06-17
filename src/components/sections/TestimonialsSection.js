'use client';

import { motion } from 'framer-motion';
import { FaQuoteLeft, FaStar } from 'react-icons/fa';
import { TESTIMONIALS, STATS } from '@/constants/content';
import { ANIMATIONS } from '@/constants/theme';
import { useIntersectionObserver } from '@/hooks/useIntersectionObserver';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';

const TestimonialCard = ({ testimonial, index }) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 30 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6, delay: index * 0.1 }}
    >
      <Card className="h-full">
        <div className="mb-6">
          <FaQuoteLeft className="text-3xl text-blue-600 mb-4" />
          <div className="flex mb-4">
            {[...Array(5)].map((_, i) => (
              <FaStar key={i} className="text-yellow-400" />
            ))}
          </div>
          <p className="text-gray-700 text-lg leading-relaxed mb-6">
            "{testimonial.quote}"
          </p>
        </div>
        
        <div className="border-t pt-4">
          <p className="font-semibold text-gray-900">{testimonial.author}</p>
          <p className="text-gray-600">{testimonial.title}</p>
          <p className="text-blue-600 font-medium">{testimonial.company}</p>
        </div>
      </Card>
    </motion.div>
  );
};

const StatCard = ({ stat, index }) => {
  return (
    <motion.div
      initial={{ opacity: 0, scale: 0.8 }}
      animate={{ opacity: 1, scale: 1 }}
      transition={{ duration: 0.6, delay: index * 0.1 }}
      className="text-center"
    >
      <div className="text-4xl lg:text-5xl font-bold text-blue-600 mb-2">
        {stat.value}
      </div>
      <div className="text-gray-600 font-medium">
        {stat.label}
      </div>
    </motion.div>
  );
};

const TestimonialsSection = () => {
  const { ref, hasIntersected } = useIntersectionObserver();

  return (
    <Section id="testimonials" background="white" ref={ref}>
      <motion.div
        initial="initial"
        animate={hasIntersected ? "animate" : "initial"}
        variants={ANIMATIONS.stagger}
      >
        {/* Stats Section */}
        <div className="mb-20">
          <motion.div variants={ANIMATIONS.fadeIn} className="text-center mb-12">
            <Heading level={2} align="center" className="mb-4">
              Proven Results
            </Heading>
            <p className="text-xl text-gray-600">
              Our track record speaks for itself
            </p>
          </motion.div>
          
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {STATS.map((stat, index) => (
              <StatCard key={stat.id} stat={stat} index={index} />
            ))}
          </div>
        </div>

        {/* Testimonials */}
        <div className="text-center mb-16">
          <motion.div variants={ANIMATIONS.fadeIn}>
            <Heading level={2} align="center" className="mb-4">
              What Our Clients Say
            </Heading>
            <p className="text-xl text-gray-600">
              Real results from real businesses
            </p>
          </motion.div>
        </div>
        
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {TESTIMONIALS.map((testimonial, index) => (
            <TestimonialCard 
              key={testimonial.id} 
              testimonial={testimonial} 
              index={index}
            />
          ))}
        </div>
      </motion.div>
    </Section>
  );
};

export default TestimonialsSection;
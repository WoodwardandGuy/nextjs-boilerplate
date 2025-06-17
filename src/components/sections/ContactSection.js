'use client';

import { motion } from 'framer-motion';
import { FaPhone, FaEnvelope, FaMapMarkerAlt, FaArrowRight } from 'react-icons/fa';
import { COMPANY } from '@/constants/content';
import { ANIMATIONS } from '@/constants/theme';
import { formatPhone } from '@/utils/formatters';
import { useIntersectionObserver } from '@/hooks/useIntersectionObserver';
import Section from '@/components/common/Section';
import Heading from '@/components/common/Heading';
import Card from '@/components/common/Card';
import Button from '@/components/common/Button';

const ContactInfo = () => {
  const contactItems = [
    {
      icon: FaPhone,
      label: 'Phone',
      value: formatPhone(COMPANY.phone),
      href: `tel:${COMPANY.phone}`
    },
    {
      icon: FaEnvelope,
      label: 'Email',
      value: COMPANY.email,
      href: `mailto:${COMPANY.email}`
    },
    {
      icon: FaMapMarkerAlt,
      label: 'Location',
      value: COMPANY.address,
      href: '#'
    }
  ];

  return (
    <div className="space-y-6">
      {contactItems.map((item, index) => (
        <motion.div
          key={item.label}
          initial={{ opacity: 0, x: -20 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ duration: 0.6, delay: index * 0.1 }}
        >
          <a 
            href={item.href}
            className="flex items-center p-4 rounded-lg hover:bg-gray-50 transition-colors group"
          >
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mr-4 group-hover:bg-blue-600 transition-colors">
              <item.icon className="text-blue-600 group-hover:text-white transition-colors" />
            </div>
            <div>
              <p className="text-sm text-gray-500 font-medium">{item.label}</p>
              <p className="text-gray-900 font-semibold">{item.value}</p>
            </div>
          </a>
        </motion.div>
      ))}
    </div>
  );
};

const ContactForm = () => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6, delay: 0.2 }}
    >
      <Card>
        <form className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label htmlFor="firstName" className="block text-sm font-medium text-gray-700 mb-2">
                First Name
              </label>
              <input
                type="text"
                id="firstName"
                name="firstName"
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors"
                required
              />
            </div>
            <div>
              <label htmlFor="lastName" className="block text-sm font-medium text-gray-700 mb-2">
                Last Name
              </label>
              <input
                type="text"
                id="lastName"
                name="lastName"
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors"
                required
              />
            </div>
          </div>

          <div>
            <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
              Email Address
            </label>
            <input
              type="email"
              id="email"
              name="email"
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors"
              required
            />
          </div>

          <div>
            <label htmlFor="company" className="block text-sm font-medium text-gray-700 mb-2">
              Company
            </label>
            <input
              type="text"
              id="company"
              name="company"
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors"
            />
          </div>

          <div>
            <label htmlFor="service" className="block text-sm font-medium text-gray-700 mb-2">
              Service Interest
            </label>
            <select
              id="service"
              name="service"
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors"
            >
              <option value="">Select a service</option>
              <option value="business-strategy">Business Strategy Plan</option>
              <option value="growth-acceleration">Growth Acceleration Package</option>
              <option value="marketing-optimization">Marketing ROI Optimization</option>
              <option value="consultation">Free Consultation</option>
            </select>
          </div>

          <div>
            <label htmlFor="message" className="block text-sm font-medium text-gray-700 mb-2">
              Message
            </label>
            <textarea
              id="message"
              name="message"
              rows={4}
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors resize-none"
              placeholder="Tell us about your business goals and challenges..."
            ></textarea>
          </div>

          <Button type="submit" variant="primary" size="lg" className="w-full">
            Send Message
            <FaArrowRight className="ml-2" />
          </Button>
        </form>
      </Card>
    </motion.div>
  );
};

const ContactSection = () => {
  const { ref, hasIntersected } = useIntersectionObserver();

  return (
    <Section id="contact" background="gray" ref={ref}>
      <motion.div
        initial="initial"
        animate={hasIntersected ? "animate" : "initial"}
        variants={ANIMATIONS.stagger}
      >
        <div className="text-center mb-16">
          <motion.div variants={ANIMATIONS.fadeIn}>
            <Heading level={2} align="center" className="mb-4">
              Ready to Transform Your Business?
            </Heading>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Let's discuss how we can help you achieve your strategic goals. Schedule a free consultation today.
            </p>
          </motion.div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <div>
            <motion.div variants={ANIMATIONS.slideInLeft}>
              <h3 className="text-2xl font-semibold text-gray-900 mb-6">
                Get in Touch
              </h3>
              <p className="text-gray-600 mb-8">
                We're here to help you navigate your business challenges and unlock new opportunities for growth.
              </p>
              <ContactInfo />
            </motion.div>
          </div>

          <div>
            <motion.div variants={ANIMATIONS.slideInRight}>
              <h3 className="text-2xl font-semibold text-gray-900 mb-6">
                Send us a Message
              </h3>
              <ContactForm />
            </motion.div>
          </div>
        </div>
      </motion.div>
    </Section>
  );
};

export default ContactSection;
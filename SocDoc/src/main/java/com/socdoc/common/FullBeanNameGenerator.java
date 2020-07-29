package com.socdoc.common;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;

public class FullBeanNameGenerator implements org.springframework.beans.factory.support.BeanNameGenerator {

	
	@Override
	   public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {
	      return definition.getBeanClassName(); 
	   }

}



//name-generator="com.spring.common.FullBeanNameGenerator" 은  
//spring annotation-driven 시 bean name 중복(충돌,conflicts)을 해결하기 위해서 사용하는 커스트마이징된 BeanNameGenerator 이다. 
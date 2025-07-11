package com.jusdrive.api_gateway.config;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;

import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

import com.jusdrive.api_gateway.filter.JwtAuthFilter;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;

@Configuration
public class GatewayConfig {

    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder, JwtAuthFilter jwtAuthFilter) {
        return builder.routes()
                .route("auth-service", r -> r.path("/auth/**")
                .filters(f -> f.filter(jwtAuthFilter))
                .uri("lb://auth-service"))

                .route("car-service", r -> r.path("/api/cars/**")
                        .filters(f -> f.filter(jwtAuthFilter))
                        .uri("lb://car-service"))

                .route("enquiry-service", r -> r.path("/api/enquiries/**")
                        .filters(f -> f.filter(jwtAuthFilter))
                        .uri("lb://enquiry-service"))

                .route("booking-service", r -> r.path("/api/bookings/**")
                        .filters(f -> f.filter(jwtAuthFilter))
                        .uri("lb://booking-service"))

                .build();
    }


    @Bean
public CorsWebFilter corsWebFilter() {
    CorsConfiguration corsConfiguration = new CorsConfiguration();
    corsConfiguration.addAllowedOrigin("http://localhost:4200"); 
    corsConfiguration.addAllowedMethod("*");
    corsConfiguration.addAllowedHeader("*"); 
    corsConfiguration.setAllowCredentials(true);

    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    source.registerCorsConfiguration("/**", corsConfiguration);

    return new CorsWebFilter(source); 
} 
}

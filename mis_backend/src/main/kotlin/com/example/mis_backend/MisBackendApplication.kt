package com.example.mis_backend

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.autoconfigure.domain.EntityScan
import org.springframework.boot.runApplication
import org.springframework.context.annotation.ComponentScan
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@SpringBootApplication
@EntityScan("com.example.mis_backend.*")
@ComponentScan("com.example.mis_backend.*")
@EnableJpaRepositories("com.example.mis_backend.*")
class MisBackendApplication

fun main(args: Array<String>) {
    runApplication<MisBackendApplication>(*args)
}

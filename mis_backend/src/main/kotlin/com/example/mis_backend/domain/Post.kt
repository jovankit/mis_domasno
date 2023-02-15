package com.example.mis_backend.domain

import org.springframework.data.annotation.Id
import javax.persistence.*

@Entity
@Table(name = "posts")
data class Post(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,
    val text: String,
    val votes: Int
)
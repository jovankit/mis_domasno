package com.example.mis_backend.repository

import com.example.mis_backend.domain.Post
import org.springframework.data.jpa.repository.JpaRepository


interface PostRepository :JpaRepository<Post,Long>
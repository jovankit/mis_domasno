package com.example.mis_backend.service

import com.example.mis_backend.domain.Post
import com.example.mis_backend.repository.PostRepository
import org.springframework.stereotype.Service

@Service
class PostService(
    private val postRepository: PostRepository
) {
    fun getAllPost(): List<Post> {
        return postRepository.findAll()
    }

    fun save(post: Post) {
        postRepository.save(post)
    }
}
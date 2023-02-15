package com.example.mis_backend.api

import com.example.mis_backend.domain.Post
import com.example.mis_backend.service.PostService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/posts")
class PostController(
    private val postService: PostService
) {
    @GetMapping
    fun getAllPosts(): List<Post> = postService.getAllPost()

    @PostMapping
    fun savePost(@RequestBody post: Post) {
        postService.save(post)
    }
}
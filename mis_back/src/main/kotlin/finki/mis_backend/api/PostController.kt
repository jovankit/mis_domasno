package finki.mis_backend.api

import finki.mis_backend.domain.Post
import finki.mis_backend.service.PostService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/posts")
class PostController(
    private val postService: PostService
) {
    @GetMapping
    fun getAllPosts(): List<Post> = postService.getAllPost()

    @PostMapping
    fun savePost(@RequestParam text: String) {
        postService.save(text)
    }
}
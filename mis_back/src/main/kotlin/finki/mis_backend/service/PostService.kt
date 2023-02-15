package finki.mis_backend.service

import finki.mis_backend.domain.Post
import finki.mis_backend.repository.PostRepository
import org.springframework.stereotype.Service

@Service
class PostService(
    private val postRepository: PostRepository
) {
    fun getAllPost(): List<Post> {
        return postRepository.findAll()
    }

    fun save(text: String) {
        postRepository.save(Post(text = text, votes = 0, id = 0))
    }
}
package finki.mis_backend.repository

import finki.mis_backend.domain.Post
import org.springframework.data.jpa.repository.JpaRepository


interface PostRepository : JpaRepository<Post, Long>
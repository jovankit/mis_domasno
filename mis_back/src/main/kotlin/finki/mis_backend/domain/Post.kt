package finki.mis_backend.domain

import jakarta.persistence.Entity
import jakarta.persistence.Table
import jakarta.persistence.Id


@Entity
@Table(name = "posts")
data class Post(
    @Id
    val id: Long,
    val text: String,
    val votes: Int
)


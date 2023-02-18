package finki.mis_backend.domain

import jakarta.persistence.Entity
import jakarta.persistence.Table
import jakarta.persistence.Id
import javax.annotation.processing.Generated
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType


@Entity
@Table(name = "posts")
data class Post(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    val text: String,
    val votes: Int
)


package com.levelUp.tour.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.levelUp.tour.entity.MemberEntity;


@Repository
public interface MemberRepository extends JpaRepository<MemberEntity, String>{
	Optional<MemberEntity> findByEmail(String email);
}

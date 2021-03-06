/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.sberbank.repositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import ru.sberbank.model.Test;

import java.util.List;

/**
 *
 * @author Raim
 */
public interface TestRepository extends CrudRepository<Test, Long> {
  @Modifying
  @Transactional
  @Query("delete from Test t where t = :test")
  void deleteInactiveTest(@Param("test") Test test);



  Iterable<Test> findByTitleLike (String testTitleLike);
  Iterable<Test> findByTitleLikeAndDescriptionLike (String testTitleLike, String testDescriptionLike);
  Iterable<Test> findByDescriptionLike (String testTitleLike);
}

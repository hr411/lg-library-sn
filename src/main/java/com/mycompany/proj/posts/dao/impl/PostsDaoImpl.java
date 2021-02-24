package com.mycompany.proj.posts.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.proj.posts.dao.PostsDao;
import com.mycompany.proj.posts.model.PostsVO;


@Repository("postsDao")
public class PostsDaoImpl implements PostsDao{

	@Autowired
	protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<PostsVO> selectPostsList(PostsVO postsVO) throws Exception {
		return sqlSession.selectList("PostsMapper.selectPostsList", postsVO);
	}

}

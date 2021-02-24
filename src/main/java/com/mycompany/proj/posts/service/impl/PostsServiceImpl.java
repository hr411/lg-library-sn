package com.mycompany.proj.posts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.proj.posts.dao.PostsDao;
import com.mycompany.proj.posts.model.PostsVO;
import com.mycompany.proj.posts.service.PostsService;


@Service("PostsService")
public class PostsServiceImpl implements PostsService{
	@Autowired
	protected PostsDao postsDao;

	@Override
	public List<PostsVO> selectPostsList(PostsVO postsVO) throws Exception {
		return postsDao.selectPostsList(postsVO);
	}
	
}

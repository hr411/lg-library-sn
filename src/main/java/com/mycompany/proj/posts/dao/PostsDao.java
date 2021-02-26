package com.mycompany.proj.posts.dao;

import java.util.List;

import com.mycompany.proj.posts.model.PostsVO;

public interface PostsDao {
	public List<PostsVO> selectPostsList(PostsVO postsVO) throws Exception;
	public PostsVO selectPostInfo(PostsVO postsVO) throws Exception;
	public void createPostInfo(PostsVO postsVO) throws Exception;
	public void deletePostInfo(PostsVO postsVO) throws Exception;
	public void updatePostInfo(PostsVO postsVO) throws Exception;
}

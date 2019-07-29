package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;

public class LikesDAOImpl implements LikesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	
	public static List<Like> myPageBucketList(PageVO pageVO) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("likes.myPageBucketList",pageVO);
		}
		catch(Exception e) {
			e. printStackTrace();
			
			return null;
		}
		finally {
			session.close();
		}
	}
	
		
		
		public static int insertTfReplyLike(Like like) {
			
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				// 받는 값 꼭 기입
				result = session.insert("likes.insertTfReplyLike", like);
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			finally {
				session.close();
			} // try~catch~finally
			
			return result;
		}
		
		public static Like selectOne(Like like) {
			Like result = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.selectOne("likes.selectOne",like);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return result;
		}//selectOne() end

		//0618
		public static Like selectOneLike(Like like) {
			
			Like tfLike= null;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return tfLike = session.selectOne("likes.selectOneLike",like);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				session.close();
			}
			
			return tfLike;
			
		}
		
		public static int deleteLike(Like like) {
			
			int tfCnt=0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				return tfCnt = session.delete("likes.deleteLike",like);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				session.close();
			}
			
			return tfCnt;
			
		}
		
//		0617 쥬하
		public static int selectBucketTFCnt(int postNo) {
			
			int count = 0;
			
			
			SqlSession session = null;
			
			try {
				
				session = SqlSessionUtil.getSession();
				
				count = session.selectOne("likes.selectBucketTFCnt",postNo);
		
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}
		
//		0617 쥬하
		public static int insertBucketTF(Like like) {
			
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				// 받는 값 꼭 기입
				result = session.insert("likes.insertBucketTF", like);
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			finally {
				session.close();
			} // try~catch~finally
			
			return result;
		}
		
//		0619 주하
		public static int deleteTfBucket(Like like) {
			
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				// 받는 값 꼭 기입
				result = session.insert("likes.deleteTfBucket", like);
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			finally {
				session.close();
			} // try~catch~finally
			
			return result;
		}
		
//		0619 주하	
		public static Like selectTfBucket(Like like) {
			Like result = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.selectOne("likes.selectTfBucket",like);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return result;
		}
		
// 		0620 주하
		public static int insertTfReply(Reply reply) {
			
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				// 받는 값 꼭 기입
				result = session.insert("replies.insertTfReplyLike", reply);
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			finally {
				session.close();
			} // try~catch~finally
			
			return result;
		}

// 		0620 주하		
		public static int deleteTfReplyLike(Like like) {
			
			int result = 0;
			
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				
				// 받는 값 꼭 기입
				result = session.delete("likes.deleteTfReplyLike", like);
			}
			catch(Exception e) {
				e.printStackTrace();
			} 
			finally {
				session.close();
			} // try~catch~finally
			
			return result;
		}
		
// 		0620 주하
		public static Like selectTfReplyLike(Like like) {
			Like result = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.selectOne("likes.selectTfReplyLike",like);
				
				//System.out.println(like.getReplyNo()+"flag"); flag체크
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}//try~catch~finally end
			
			return result;
		}//selectOne() end
		
//		0621 주하 댓글 like
		public static int selectLikeTfCnt(Like like) {
			
			int count = 0;
			
			
			SqlSession session = null;
			
			try {
				
				session = SqlSessionUtil.getSession();
				
				count = session.selectOne("likes.selectLikeTfCnt",like);
//				System.out.println(like+"DAO객체");
//				System.out.println(like.getPostNo());
//				System.out.println(like.getReplyNo());
//				System.out.println(count+"DAO");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}

		public static int selectOneBucketCnt(int postNo) {
			int count = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				count = session.selectOne("likes.selectOneBucketCnt",postNo);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}
		
		/* 0704 홍성표 수정 */
		
		public static int insertSub(Like like) {
			int count = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				count = session.insert("likes.insertSub",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}	
		
		
		
		public static Like selectSubCheck(Like like) {
			Like result = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.selectOne("likes.selectSubCheck",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return result;
		}
		
		public static int deleteSub(Like like) {
			int count = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				count = session.delete("likes.deleteSub",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}	
		
		public static int selectSubCnt(int postNo) {
			
			int count = 0;
			
			
			SqlSession session = null;
			
			try {
				
				session = SqlSessionUtil.getSession();
				
				count = session.selectOne("likes.selectSubCnt",postNo);
		
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}
		
		public static Like selectCheckSpotBucket(Like like) {
			Like result = null;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.selectOne("likes.selectCheckSpotBucket",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return result;
		}
		
		public static int insertSpotBucket(Like like) {
			int count = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				count = session.insert("likes.insertSpotBucket",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}	
		
		public static int deleteSpotBucket(Like like) {
			int count = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				count = session.delete("likes.deleteSpotBucket",like);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}	
		
		/* model2 시작 */
		
//		@Override
//		public Like selectSpotBucketCnt(int no) {
//			return session.selectOne("likes.selectSpotBucketCnt", no);
//		}
		
		@Override
		public Like selectTfLikeCnt(Like like) {
			return session.selectOne("likes.selectTfLikeCnt", like);
		}
		
		@Override
		public int insertBucket(Like like) {
			return session.insert("likes.insertBucket", like);
		}
		
		@Override
		public int deleteBucket(Like like) {
			return session.delete("likes.deleteBucket", like);
		}
		
		@Override
		public Like selectBucketCheck(Like like) {
			return session.selectOne("likes.selectBucketCheck", like);
		}
		
		@Override
		public int selectBucketCnt(Like like) {
			return session.selectOne("likes.selectBucketCnt", like);
		}
		
		@Override
		public Like selectReplyLikeCheck(Like like) {
			return session.selectOne("likes.selectReplyLikeCheck", like);
		}
		
		@Override
		public int insertReplyLike(Like like) {
			return session.insert("likes.insertReplyLike", like);
		}
		
		@Override
		public int deleteReplyLike(Like like) {
			return session.delete("likes.deleteReplyLike", like);
		}
		
		@Override
		public int selectReplyLikeCnt(Like like) {
			return session.selectOne("likes.selectReplyLikeCnt", like);
		}
		
////		0708 주하
		@Override
		public int selectSpotBucketCnt(int postNo) {
			// TODO Auto-generated method stub
			return session.selectOne("likes.selectSpotBucketCnt",postNo);
		}
		
		@Override
		public List<Like> myPageRepliesLikesCnt(Like like) {
			return session.selectList("likes.myPageRepliesLikesCnt",like);
		}
			
		// 07090709 주하
		@Override
		public int selectCookBucketCnt(int no) {
			// TODO Auto-generated method stub
			return session.selectOne("likes.selectCookBucketCnt",no);
		}
		
		// 07150715 주하
		@Override
		public Like selectCookTipLike(Like like) {
			// TODO Auto-generated method stub
			return session.selectOne("likes.selectCookTipLikeCnt",like);
		}
		
		@Override
		public int insertCookTipLike(Like like) {
			// TODO Auto-generated method stub
			return session.insert("likes.insertCookTipLike",like);
		}
		
		@Override
		public int deleteCookTipLike(Like like) {
			// TODO Auto-generated method stub
			return session.delete("likes.deleteCookTipLike",like);
		}
		
		@Override
		public int selectCookTipLikeCnt(Like like) {
			// TODO Auto-generated method stub
			return session.selectOne("likes.selectCookTipLikeCnt",like);
		}
}
		


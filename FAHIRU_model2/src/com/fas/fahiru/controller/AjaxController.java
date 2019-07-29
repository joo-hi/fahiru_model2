package com.fas.fahiru.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fas.fahiru.service.CookTipsService;
import com.fas.fahiru.service.FahsService;
import com.fas.fahiru.service.FollowsService;
import com.fas.fahiru.service.LikesService;
import com.fas.fahiru.service.RepliesService;
import com.fas.fahiru.service.ScoresService;
import com.fas.fahiru.service.SpotsService;
import com.fas.fahiru.service.TfCooksService;
import com.fas.fahiru.service.UsersService;
import com.fas.fahiru.util.FileRenameUtil;
import com.fas.fahiru.util.ResizeImageUtil;
import com.fas.fahiru.vo.CookTip;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.Follow;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;
import com.fas.fahiru.vo.Score;
import com.fas.fahiru.vo.Spot;
import com.fas.fahiru.vo.TfCook;
import com.fas.fahiru.vo.User;

@RestController
@RequestMapping(value = "/ajax")
public class AjaxController {

	private TfCooksService tfCooksService;
	private SpotsService spotsService;
	private UsersService usersService;
	private LikesService likesService;
	private ScoresService scoresService;
	private FahsService fahsService;
	private RepliesService repliesService;
	private FollowsService followsService;
	private CookTipsService cookTipsService;
	
	private FileRenameUtil fileRenameUtil;
	private ResizeImageUtil imageUtil;

	public void setCookTipsService(CookTipsService cookTipsService) {
		this.cookTipsService = cookTipsService;
	}
	
	public void setFollowsService(FollowsService followsService) {
		this.followsService = followsService;
	}
	
	public void setTfCooksService(TfCooksService tfCooksService) {
		this.tfCooksService = tfCooksService;
	}

	public void setSpotsService(SpotsService spotsService) {
		this.spotsService = spotsService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}

	public void setScoresService(ScoresService scoresService) {
		this.scoresService = scoresService;
	}

	public void setFahsService(FahsService fahsService) {
		this.fahsService = fahsService;
	}
	public void setRepliesService(RepliesService repliesService) {
		this.repliesService = repliesService;
	}
	

	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}

	public void setImageUtil(ResizeImageUtil imageUtil) {
		this.imageUtil = imageUtil;
	}

	@RequestMapping(value = "search/{word}/tf/page/{page}", method = RequestMethod.GET)
	public List<TfCook> searchTf(@PathVariable String word, @PathVariable int page) {
		return tfCooksService.getSearchTfList(word);
	}

	@RequestMapping(value = "search/{word}/cook/page/{page}", method = RequestMethod.GET)
	public List<TfCook> searchCook(@PathVariable String word, @PathVariable int page) {
		return tfCooksService.getSearchCookList(word);
	}

	@RequestMapping(value = "search/{word}/spot/page/{page}", method = RequestMethod.GET)
	public List<Spot> searchSpot(@PathVariable String word, @PathVariable int page) {
		return spotsService.getSearchSpotList(word);
	}

	@RequestMapping(value = "search/{word}/user/page/{page}", method = RequestMethod.GET)
	public List<User> searchUser(@PathVariable String word, @PathVariable int page) {
		return usersService.getSearchUserList(word);
	}

	@RequestMapping(value = "spot/checkId/{spotId}", method = RequestMethod.GET)
	public boolean checkSpot(@PathVariable int spotId) {
		return spotsService.spotCheck(spotId);
	}

	@RequestMapping(value = "uploadImg", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String uploadImg(HttpServletRequest request, String type, MultipartFile uploadImg) {

		ServletContext sc = request.getServletContext();

		String uploadPath = sc.getRealPath("upload");
		// String profilePath = sc.getRealPath("profile");

		System.out.println(uploadImg.getOriginalFilename());

		try {
			switch (type) {
			case "C":
				uploadPath = sc.getRealPath("cookImg");
				break;
			case "R":
				uploadPath = sc.getRealPath("replyImg");
				break;
			case "F":
				uploadPath = sc.getRealPath("tfImg");
				break;
			case "E":
				uploadPath = sc.getRealPath("cookStep");
				break;
			case "S":
				uploadPath = sc.getRealPath("spotImg");
				break;
			}// switch end

			File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());

			file = fileRenameUtil.rename(file);

			uploadImg.transferTo(file);

			return "{\"src\":\"" + file.getName() + "\"}";

		} catch (Exception e) {
			e.printStackTrace();

			return "에러";
		} // try~catch end

	} // uploadImg() end

	@RequestMapping(value = "bucket", method = RequestMethod.GET)
	public String bucket(Like like) {

		System.out.println(like.getPostNo());

		Like checkLike = likesService.checkBucket(like);

		boolean flag = checkLike == null;

		if (flag) {
			likesService.addBucket(like);
		} else {
			likesService.removeBucket(like);
		}

		int count = likesService.countBucket(like);

		return "{\"flag\":" + flag + ",\"count\":" + count + "}";
	}

	@RequestMapping(value = "replyLike", method = RequestMethod.POST)
	public String replyLike(Like like) {

		Like checkLike = likesService.checkReplyLike(like);

		boolean flag = checkLike == null;

		if (flag) {
			likesService.addReplyLike(like);
		} else {
			likesService.removeReplyLike(like);
		}

		int count = likesService.countReplyLike(like);

		return "{\"flag\":" + flag + ",\"count\":" + count + "}";
	}

	@RequestMapping(value = "taste", method = RequestMethod.POST)
	public String taste(Score score) {
		return scoresService.checkTaste(score);
	}

	@RequestMapping(value = "plating", method = RequestMethod.POST)
	public String plating(Score score) {
		return scoresService.checkPlating(score);
	}



	@RequestMapping(value = "fahCheck/{forFah}", method = RequestMethod.GET)
	public Map<String, Object> fahCheck(@PathVariable String forFah, Model model) {

		return fahsService.checkFah(forFah);

	}

	@RequestMapping(value = "spotList/{pageNo}", method = RequestMethod.GET)
	public Map<String, Object> spotList(@PathVariable int pageNo) {

		return spotsService.getSpotList(pageNo);
	}

	@RequestMapping(value = "spotListByNew/{pageNo}", method = RequestMethod.GET)
	public Map<String, Object> spotListByNew(@PathVariable int pageNo) {
		return spotsService.getSpotListByNew(pageNo);
	}

	@RequestMapping(value = "/innerSearchSpot/{pageNo}/search/{searchWord}", method = RequestMethod.GET)
	public Map<String, Object> search(@PathVariable String searchWord, @PathVariable int pageNo) {

		return spotsService.getSpotListByWord(searchWord, pageNo);
	}

	// 0709 승현 수정
	@RequestMapping(value = "/fah/page/{page}", method = RequestMethod.GET)
	public List<Fah> fahList(@PathVariable int page) {
		return fahsService.getFahList(page);
	}

	@RequestMapping(value = "/information/nickname/{nickname}", method = RequestMethod.GET)
	public int selectCheckNickname(@PathVariable String nickname) {
		return usersService.selectCheckNickname(nickname);
	}

	@RequestMapping(value = "/fah/search/type/{type}/name/{name}/page/{page}", method = RequestMethod.GET)
	public List<Fah> fahSearch(@PathVariable int page, @PathVariable String name, @PathVariable String type) {
		PageVO pageVO = new PageVO(page, 8, name, type);
		return fahsService.fahSearch(pageVO);
	}
	
	//---------------->0709 자현
	//nickname 중복 체크
	@RequestMapping(value="/nickname/{nickname}", method=RequestMethod.GET)
	public String checkNickname(@PathVariable String nickname) {
		
		boolean result = usersService.checkNickname(nickname);
		return "{\"result\":"+result+"}";
	}//checkNickname() end
	
	//이메일 중복체크
	@RequestMapping(value="/email/{email}", method=RequestMethod.GET)
	public String checkEmail(@PathVariable String email, String check) {
		
		boolean result = usersService.checkEmail(check);
		
//				System.out.println(check);
//				System.out.println(email);
//				System.out.println(result);
		
		return "{\"result\":"+result+"}";
	}//checkEmail() end
	//<--------------------0709 자현
		
			
			
	//---------------->0710 자현
	//trendyFoodSearchForm 자동완성
	@RequestMapping(value="trendy/food/check/auto/{tfName}", method=RequestMethod.GET)
	public List<TfCook> autoTF(@PathVariable String tfName) {
		
		return tfCooksService.getList(tfName);
		
	}//autoTF() end
	
	
	
	//spot list
	@RequestMapping(value="trendy/food/check/final/{spotName}", method=RequestMethod.GET)
	public List<Spot> getSpotList(@PathVariable String spotName,String tfName) {
		
		System.out.println(spotName);
		System.out.println(tfName);
		return spotsService.getSpotList(tfName, spotName);
	}//getSpotList() end
	
			
			
	//fah check
	@RequestMapping(value="/fah/check/{name}", method = RequestMethod.GET)
	public Fah checkFah(@PathVariable String name) {
		
		System.out.println(name);
		
		return fahsService.getCheckedFah(name);
	}//checkFah() end
	//<--------------------0710 자현

	
	
	//0711 홍성표
	// 댓글 좋아요 순 정렬
	@RequestMapping(value="replyImg/{no}", method=RequestMethod.GET)
	public Map<String, Object> replyImg(@PathVariable int no, int pageNo){
		return repliesService.getReplyImgOrderByLike(pageNo, no);
	}
	
	@RequestMapping(value="reply/{no}/page/{page}", method=RequestMethod.GET)
	public Map<String, Object> replies(@PathVariable int no,@PathVariable int page, HttpSession session){
		return repliesService.getReplies(no, page, session);
	}
	
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public boolean writeReply(Reply reply) {
		
		return repliesService.writeReply(reply)==1;
	}
	
	@RequestMapping(value="reply/{replyNo}", method=RequestMethod.DELETE)
	public boolean removeReply(@PathVariable int replyNo) {
		
		return repliesService.removeReply(replyNo)==1;
	}
	
	// 07090709 주하
	@RequestMapping(value="tScore/{no}", method=RequestMethod.GET)
	public double tscore(Score score) {
		
		return scoresService.getTasteScore(score);
	}
	
	@RequestMapping(value="pScore/{no}", method=RequestMethod.GET)
	public double pscore(Score score) {
		
		return scoresService.getPlatingScore(score);
	}
	
	@RequestMapping(value="/honeyTip", method=RequestMethod.POST)
	public double honeyTipRegister(CookTip cookTip) {
		
		return cookTipsService.registerCookTip(cookTip);
	}
	
	

	@RequestMapping(value = "cookTipLike", method = RequestMethod.POST)
	public String cookTipLike(Like like) {

		System.out.println("z");
		Like checkLike = likesService.checkCookTipLike(like);

		boolean flag = checkLike == null;

		if (flag) {
			likesService.addCookTipLike(like);
		} else {
			likesService.removeCookTipLike(like);
		}

		int count = likesService.countCookTipLikeCnt(like);

		return "{\"flag\":" + flag + ",\"count\":" + count + "}";
	}
	
	
	//0716 근경
	
	@RequestMapping(value = "fah/{no}/tfCook",method=RequestMethod.GET)
	public List<TfCook> fahDetailTfCook(@PathVariable int no){
		return tfCooksService.getFahList(no);
	}
	@RequestMapping(value = "fah/{no}/tf",method=RequestMethod.GET)
	public List<TfCook> fahDetailTf(@PathVariable int no){
		return tfCooksService.getFahListTf(no);
	}
	
	@RequestMapping(value="fah/{no}/cook",method=RequestMethod.GET)
	public List<TfCook> fahDetailCook(@PathVariable int no){
		System.out.println(no);
		return tfCooksService.getFahListCook(no);
	}
	
	@RequestMapping(value = "fah/{no}/tfCook/page/{page}",method=RequestMethod.GET)
	public Map<String, Object> fahDetailTfCook(@PathVariable int no,@PathVariable int page){
		return tfCooksService.getFahMapList(no, page);
	}
	@RequestMapping(value="fah/{no}/tf/page/{page}",method = RequestMethod.GET)
	public Map<String, Object> fahDetailTf(@PathVariable int no, @PathVariable int page){
		return tfCooksService.getFahMapListTf(no, page);
	} 
	@RequestMapping(value = "fah/{no}/cook/page/{page}",method=RequestMethod.GET)
	public Map<String, Object> fahDetailCook(@PathVariable int no, @PathVariable int page){
		return tfCooksService.getFahMapListCook(no, page);
	}
	
	@RequestMapping(value = "main/feed/{no}",method = RequestMethod.GET)
	public Map<String, Object> mainFeed(@PathVariable int no){
		return fahsService.getFeedList(no);
	}
	
	@RequestMapping(value="main/following/{no}", method = RequestMethod.GET)
	public List<Follow> mainFollowing(@PathVariable int no){
		
		return followsService.getMainFollowingList(no);
	}
	
	
	
	
	
	
	//근경 end
}

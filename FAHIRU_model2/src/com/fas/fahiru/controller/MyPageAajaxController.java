package com.fas.fahiru.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fas.fahiru.service.CooksService;
import com.fas.fahiru.service.FahsService;
import com.fas.fahiru.service.FollowsService;
import com.fas.fahiru.service.RepliesService;
import com.fas.fahiru.service.SpotsService;
import com.fas.fahiru.service.TrendyFoodsService;
import com.fas.fahiru.service.UsersService;
import com.fas.fahiru.util.FileRenameUtil;
import com.fas.fahiru.util.ResizeImageUtil;
import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.Reply;
import com.fas.fahiru.vo.Spot;
import com.fas.fahiru.vo.TrendyFood;
import com.fas.fahiru.vo.User;

@RestController
@RequestMapping("/ajax")
public class MyPageAajaxController {
	private UsersService usersService;
	private FollowsService followsService;
	private ResizeImageUtil imageUtil;
	private FahsService fahsService;
	private TrendyFoodsService trendyFoodsService;
	private CooksService cooksService;
	private RepliesService repliesService;
	private SpotsService spotsService;
	private FileRenameUtil fileRenameUtil;

	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}

	public void setSpotsService(SpotsService spotsService) {
		this.spotsService = spotsService;
	}

	public void setRepliesService(RepliesService repliesService) {
		this.repliesService = repliesService;
	}

	public void setCooksService(CooksService cooksService) {
		this.cooksService = cooksService;
	}

	public void setTrendyFoodsService(TrendyFoodsService trendyFoodsService) {
		this.trendyFoodsService = trendyFoodsService;
	}

	public void setFahsService(FahsService fahsService) {
		this.fahsService = fahsService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public void setImageUtil(ResizeImageUtil imageUtil) {
		this.imageUtil = imageUtil;
	}

	public void setFollowsService(FollowsService followsService) {
		this.followsService = followsService;
	}

	@RequestMapping(value = "{no}/follow/page/{page}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public Map<String, Object> getFollow(@PathVariable int no, @PathVariable int page,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		return followsService.getFollow(no, page,loginUser.getNo());
	}

	@RequestMapping(value = "upload/{no}", method = RequestMethod.POST)
	public String uploadImage(HttpServletRequest request, MultipartFile profileImg, @PathVariable int no) {

		ServletContext sc = request.getServletContext();

		String uploadPath = sc.getRealPath("upload");
		String profilePath = sc.getRealPath("profile");

		System.out.println(uploadPath);

		System.out.println(profileImg.getOriginalFilename());

		File file = new File(uploadPath + File.separator + profileImg.getOriginalFilename());

		file = fileRenameUtil.rename(file);
		try {
			profileImg.transferTo(file);
			imageUtil.resize(file.getAbsolutePath(), profilePath + File.separator + file.getName(), 250);
			usersService.profileModify(file.getName(), no);
			return "{\"profileImg\":\"" + file.getName() + "\"}";
		} catch (Exception e) {
			e.printStackTrace();
			return "에러";
		}

	}

	@RequestMapping(value = "user/{no}/fah/page/{page}", method = RequestMethod.GET)
	public List<Fah> fahList(@PathVariable int no, @PathVariable int page) {
		return fahsService.getMyPageList(no, page);
	}

	@RequestMapping(value = "user/{no}/TF/page/{page}", method = RequestMethod.GET)
	public List<TrendyFood> TFList(@PathVariable int no, @PathVariable int page) {
		return trendyFoodsService.getMyPageList(no, page);
	}

	@RequestMapping(value = "user/{no}/cook/page/{page}", method = RequestMethod.GET)
	public List<Cook> CookList(@PathVariable int no, @PathVariable int page) {
		return cooksService.getMyPageList(no, page);
	}

	@RequestMapping(value = "user/{no}/TFBucket/page/{page}", method = RequestMethod.GET)
	public List<TrendyFood> TFBucketList(@PathVariable int no, @PathVariable int page) {
		return trendyFoodsService.getBucketList(no, page);
	}

	@RequestMapping(value = "user/{no}/CookBucket/page/{page}", method = RequestMethod.GET)
	public List<Cook> CookBucketList(@PathVariable int no, @PathVariable int page) {
		return cooksService.getBucketList(no, page);
	}

	@RequestMapping(value = "user/{no}/comment/page/{page}", method = RequestMethod.GET)
	public List<Reply> CommentList(@PathVariable int no, @PathVariable int page) {
		return repliesService.myPageCommentList(no, page);
	}

	@RequestMapping(value = "user/{no}/spot/page/{page}", method = RequestMethod.GET)
	public List<Spot> SpotList(@PathVariable int no, @PathVariable int page) {
		return spotsService.myPageSpotList(no, page);
	}

	@RequestMapping(value = "user/{no}/spotBucket/page/{page}", method = RequestMethod.GET)
	public List<Spot> SpotBucketList(@PathVariable int no, @PathVariable int page) {
		return spotsService.myPageBucketSpotList(no, page);
	}

	@RequestMapping(value = "user/{no}/intro/{message}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String introUpdate(@PathVariable String message, @PathVariable int no) {
		usersService.introModify(message, no);
		return "{\"message\":\"" + message + "\"}";
	}
	
	// 0709 승현 수정 end
	@RequestMapping(value = "/follow/following/{followingUserNo}/follower/{followerUserNo}", method = {RequestMethod.POST,RequestMethod.DELETE})
	public String followInsert(@PathVariable int followingUserNo, @PathVariable int followerUserNo) {
		int count = followsService.follow(followingUserNo, followerUserNo);
		return "{\"count\":" + (count == 1) + "}";
	}

}
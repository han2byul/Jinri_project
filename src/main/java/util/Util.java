package util;

public class Util {

	public static class Review {
		public static String VIEW_PATH = "/WEB-INF/views/review/";

		// 한 페이지에 보여줄 게시물 수
		public static final int BLOCKLIST = 5;

		// < 1 2 3 > 한 화면에 보여질 페이지 메뉴의 수
		public static final int BLOCKPAGE = 3;
	}

	public static class Search {
		public static String VIEW_PATH = "/WEB-INF/views/search/";

		// 한 페이지에 보여줄 게시물 수
		public static final int BLOCKLIST = 3;

		// < 1 2 3 > 한 화면에 보여질 페이지 메뉴의 수
		public static final int BLOCKPAGE = 5;
	}

	public static class Request {
		public static String VIEW_PATH = "/WEB-INF/views/request/";
	}

	public static class Static {
		public static String VIEW_PATH = "/WEB-INF/views/static/";
	}

	public static class Notice {
		// 한 페이지에 보여줄 게시물 수
		public static final int BLOCKLIST = 10;

		// < 1 2 3 4 5 > 식으로 한 화면에 보여질 페이지 메뉴의 수
		public static final int BLOCKPAGE = 5;
	}

	public static class Event {
		public static String VIEW_PATH = "/WEB-INF/views/event/";
		// 한 페이지에 보여줄 게시물 수
		public static final int BLOCKLIST = 4;
		// <1 2 3> 한 화면에 보여질 페이지 메뉴의 수
		public static final int BLOCKPAGE = 3;
	}

	public static class Qna {
		public static String VIEW_PATH = "/WEB-INF/views/qna/";
		// 한페이지에 보여줄 게시물 수
		public static final int BLOCKLIST = 10;

		// < 1 2 3 > 한 화면에 보여질 페이지 메뉴의 수
		public static final int BLOCKPAGE = 10;

	}
}

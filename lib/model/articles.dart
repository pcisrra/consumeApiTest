class Article{
	int id;
	String title;
	String body;

	Article({
		this.id,
		this.title,
		this.body
	});

	factory Article.fromJson(Map<String,dynamic> json){
		return Article(
			id: json["id"],
			title: json["title"],
			body: json["body"]
		);
	}
}
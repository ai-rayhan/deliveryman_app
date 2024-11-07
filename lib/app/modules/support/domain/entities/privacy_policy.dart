
class PrivacyPolicy {
  final int id;
  final String? menuTitle;
  final String? pageTitle;
  final String? pageSubtitle;
  final String? bannerTitle;
  final String? bannerSubtitle;
  final String? bannerImage;
  final String content;
  final String? slug;
  final String? template;
  final dynamic views;
  final String? seoTitle;
  final String? metaKey;
  final String? metaDescription;
  final dynamic createdBy;
  final dynamic modifiedBy;
  final dynamic status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  PrivacyPolicy({
    required this.id,
    required this.menuTitle,
    required this.pageTitle,
    this.pageSubtitle,
    this.bannerTitle,
    this.bannerSubtitle,
    this.bannerImage,
    required this.content,
    required this.slug,
    this.template,
    required this.views,
    required this.seoTitle,
    this.metaKey,
    this.metaDescription,
    required this.createdBy,
    required this.modifiedBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a PrivacyPolicy from JSON
  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
      id: int.parse(json['id'].toString()),
      menuTitle: json['menu_title'],
      pageTitle: json['page_title'],
      pageSubtitle: json['page_subtitle'],
      bannerTitle: json['banner_title'],
      bannerSubtitle: json['banner_subtitle'],
      bannerImage: json['banner_image'],
      content: json['content'],
      slug: json['slug'],
      template: json['template'],
      views: json['views'],
      seoTitle: json['seo_title'],
      metaKey: json['meta_key'],
      metaDescription: json['meta_description'],
      createdBy: json['created_by'],
      modifiedBy: json['modified_by'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert PrivacyPolicy to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_title': menuTitle,
      'page_title': pageTitle,
      'page_subtitle': pageSubtitle,
      'banner_title': bannerTitle,
      'banner_subtitle': bannerSubtitle,
      'banner_image': bannerImage,
      'content': content,
      'slug': slug,
      'template': template,
      'views': views,
      'seo_title': seoTitle,
      'meta_key': metaKey,
      'meta_description': metaDescription,
      'created_by': createdBy,
      'modified_by': modifiedBy,
      'status': status,
      'created_at': createdAt!.toIso8601String(),
      'updated_at': updatedAt!.toIso8601String(),
    };
  }
}

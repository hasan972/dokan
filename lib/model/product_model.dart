// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//     int id;
//     String name;
//     String slug;
//     String postAuthor;
//     String permalink;
//     String dateCreated;
//     String dateCreatedGmt;
//     String dateModified;
//     String dateModifiedGmt;
//     String type;
//     String status;
//     bool featured;
//     String catalogVisibility;
//     String description;
//     String shortDescription;
//     String sku;
//     String price;
//     String regularPrice;
//     String salePrice;
//     String priceHtml;
//     bool onSale;
//     bool purchasable;
//     int totalSales;
//     bool virtual;
//     bool downloadable;
//     List<Download> downloads;
//     int downloadLimit;
//     int downloadExpiry;
//     String externalUrl;
//     String buttonText;
//     String taxStatus;
//     String taxClass;
//     bool manageStock;
//     int stockQuantity;
//     bool inStock;
//     String backorders;
//     bool backordersAllowed;
//     bool backordered;
//     bool soldIndividually;
//     String weight;
//     Dimensions dimensions;
//     bool shippingRequired;
//     bool shippingTaxable;
//     String shippingClass;
//     int shippingClassId;
//     bool reviewsAllowed;
//     String averageRating;
//     int ratingCount;
//     List<int> relatedIds;
//     int parentId;
//     String purchaseNote;
//     List<Category> categories;
//     List<Category> tags;
//     List<Image> images;
//     List<Attribute> attributes;
//     List<int> variations;
//     int menuOrder;
//     Store store;
//     Links links;

//     Product({
//         required this.id,
//         required this.name,
//         required this.slug,
//         required this.postAuthor,
//         required this.permalink,
//         required this.dateCreated,
//         required this.dateCreatedGmt,
//         required this.dateModified,
//         required this.dateModifiedGmt,
//         required this.type,
//         required this.status,
//         required this.featured,
//         required this.catalogVisibility,
//         required this.description,
//         required this.shortDescription,
//         required this.sku,
//         required this.price,
//         required this.regularPrice,
//         required this.salePrice,
    
//         required this.priceHtml,
//         required this.onSale,
//         required this.purchasable,
//         required this.totalSales,
//         required this.virtual,
//         required this.downloadable,
//         required this.downloads,
//         required this.downloadLimit,
//         required this.downloadExpiry,
//         required this.externalUrl,
//         required this.buttonText,
//         required this.taxStatus,
//         required this.taxClass,
//         required this.manageStock,
//         required this.stockQuantity,
//         required this.inStock,
//         required this.backorders,
//         required this.backordersAllowed,
//         required this.backordered,
//         required this.soldIndividually,
//         required this.weight,
//         required this.dimensions,
//         required this.shippingRequired,
//         required this.shippingTaxable,
//         required this.shippingClass,
//         required this.shippingClassId,
//         required this.reviewsAllowed,
//         required this.averageRating,
//         required this.ratingCount,
//         required this.relatedIds,
//         required this.parentId,
//         required this.purchaseNote,
//         required this.categories,
//         required this.tags,
//         required this.images,
//         required this.attributes,
//         required this.variations,
//         required this.menuOrder,
//         required this.store,
//         required this.links,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? "",
//         slug: json["slug"] ?? "",
//         postAuthor: json["post_author"] ?? "",
//         permalink: json["permalink"] ?? "",
//         dateCreated:json["date_created"] ?? "",
//         dateCreatedGmt: json["date_created_gmt"]??"",
//         dateModified: json["date_modified"]??"",
//         dateModifiedGmt: json["date_modified_gmt"]??"",
//         type: json["type"] ??"",
//         status: json["status"] ??"",
//         featured: json["featured"] ??  false,
//         catalogVisibility: json["catalog_visibility"] ??"",
//         description: json["description"] ??"",
//         shortDescription: json["short_description"] ??"",
//         sku: json["sku"] ??"",
//         price: json["price"] ??"",
//         regularPrice: json["regular_price"] ??"",
//         salePrice: json["sale_price"] ??"",

//         priceHtml: json["price_html"] ??"",
//         onSale: json["on_sale"]?? false,
//         purchasable: json["purchasable"]?? false,
//         totalSales: json["total_sales"] ?? 0,
//         virtual: json["virtual"] ?? false,
//         downloadable: json["downloadable"]?? false,
//         downloads: List<Download>.from(json["downloads"].map((x) => Download.fromJson(x)) ?? []),
//         downloadLimit: json["download_limit"]??0,
//         downloadExpiry: json["download_expiry"]??0,
//         externalUrl: json["external_url"]??"",
//         buttonText: json["button_text"]??"",
//         taxStatus: json["tax_status"]??"",
//         taxClass: json["tax_class"]??"",
//         manageStock: json["manage_stock"]?? false,
//         stockQuantity: json["stock_quantity"],
//         inStock: json["in_stock"]?? false,
//         backorders: json["backorders"] ?? "",
//         backordersAllowed: json["backorders_allowed"]?? false,
//         backordered: json["backordered"]?? false,
//         soldIndividually: json["sold_individually"]?? false,
//         weight: json["weight"] ?? "",
//         dimensions: Dimensions.fromJson(json["dimensions"]),
//         shippingRequired: json["shipping_required"]??false,
//         shippingTaxable: json["shipping_taxable"]??false,
//         shippingClass: json["shipping_class"] ?? "",
//         shippingClassId: json["shipping_class_id"] ?? 0,
//         reviewsAllowed: json["reviews_allowed"]?? false,
//         averageRating: json["average_rating"] ?? "",
//         ratingCount: json["rating_count"] ?? 0,
//         relatedIds: List<int>.from(json["related_ids"].map((x) => x) ?? []),
//         parentId: json["parent_id"] ?? 0,
//         purchaseNote: json["purchase_note"] ?? "",
//         categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x)) ?? []),
//         tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x)) ?? []),
//         images: List<Image>.from(json["images"].map((x) => Image.fromJson(x)) ?? []),
//         attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x)) ?? []),
//         variations: List<int>.from(json["variations"].map((x) => x) ?? []),
//         menuOrder: json["menu_order"] ?? 0,
//         store: Store.fromJson(json["store"]),
//         links: Links.fromJson(json["_links"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "post_author": postAuthor,
//         "permalink": permalink,
//         "date_created": dateCreated,
//         "date_created_gmt": dateCreatedGmt,
//         "date_modified": dateModified,
//         "date_modified_gmt": dateModifiedGmt,
//         "type": type,
//         "status": status,
//         "featured": featured,
//         "catalog_visibility": catalogVisibility,
//         "description": description,
//         "short_description": shortDescription,
//         "sku": sku,
//         "price": price,
//         "regular_price": regularPrice,
//         "sale_price": salePrice,

//         "price_html": priceHtml,
//         "on_sale": onSale,
//         "purchasable": purchasable,
//         "total_sales": totalSales,
//         "virtual": virtual,
//         "downloadable": downloadable,
//         "downloads": List<dynamic>.from(downloads.map((x) => x.toJson())),
//         "download_limit": downloadLimit,
//         "download_expiry": downloadExpiry,
//         "external_url": externalUrl,
//         "button_text": buttonText,
//         "tax_status": taxStatus,
//         "tax_class": taxClass,
//         "manage_stock": manageStock,
//         "stock_quantity": stockQuantity,
//         "in_stock": inStock,
//         "backorders": backorders,
//         "backorders_allowed": backordersAllowed,
//         "backordered": backordered,
//         "sold_individually": soldIndividually,
//         "weight": weight,
//         "dimensions": dimensions.toJson(),
//         "shipping_required": shippingRequired,
//         "shipping_taxable": shippingTaxable,
//         "shipping_class": shippingClass,
//         "shipping_class_id": shippingClassId,
//         "reviews_allowed": reviewsAllowed,
//         "average_rating": averageRating,
//         "rating_count": ratingCount,
//         "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
//         "parent_id": parentId,
//         "purchase_note": purchaseNote,
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//         "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
//         "variations": List<dynamic>.from(variations.map((x) => x)),
//         "menu_order": menuOrder,
//         "store": store.toJson(),
//         "_links": links.toJson(),
//     };
// }

// class Attribute {
//     int id;
//     String slug;
//     String name;
//     int position;
//     bool visible;
//     bool variation;
//     List<String> options;

//     Attribute({
//         required this.id,
//         required this.slug,
//         required this.name,
//         required this.position,
//         required this.visible,
//         required this.variation,
//         required this.options,
//     });

//     factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
//         id: json["id"]??0,
//         slug: json["slug"]??"",
//         name: json["name"]??"",
//         position: json["position"]??0,
//         visible: json["visible"]?? false,
//         variation: json["variation"]?? false,
//         options: List<String>.from(json["options"].map((x) => x)?? []),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "slug": slug,
//         "name": name,
//         "position": position,
//         "visible": visible,
//         "variation": variation,
//         "options": List<dynamic>.from(options.map((x) => x)),
//     };
// }

// class Category {
//     int id;
//     String name;
//     String slug;

//     Category({
//         required this.id,
//         required this.name,
//         required this.slug,
//     });

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"] ?? 0,
//         name: json["name"]??"",
//         slug: json["slug"]??"",
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//     };
// }

// class Dimensions {
//     String length;
//     String width;
//     String height;

//     Dimensions({
//         required this.length,
//         required this.width,
//         required this.height,
//     });

//     factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
//         length: json["length"]??"",
//         width: json["width"]??"",
//         height: json["height"]??"",
//     );

//     Map<String, dynamic> toJson() => {
//         "length": length,
//         "width": width,
//         "height": height,
//     };
// }

// class Download {
//     String id;
//     String name;
//     String file;

//     Download({
//         required this.id,
//         required this.name,
//         required this.file,
//     });

//     factory Download.fromJson(Map<String, dynamic> json) => Download(
//         id: json["id"]??"",
//         name: json["name"]??"",
//         file: json["file"]??"",
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "file": file,
//     };
// }

// class Image {
//     int id;
//     String dateCreated;
//     String dateCreatedGmt;
//     String dateModified;
//     String dateModifiedGmt;
//     String src;
//     String name;
//     String alt;
//     int position;

//     Image({
//         required this.id,
//         required this.dateCreated,
//         required this.dateCreatedGmt,
//         required this.dateModified,
//         required this.dateModifiedGmt,
//         required this.src,
//         required this.name,
//         required this.alt,
//         required this.position,
//     });

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"]??0,
//         dateCreated: json["date_created"]??"",
//         dateCreatedGmt: json["date_created_gmt"]??"",
//         dateModified: json["date_modified"]??"",
//         dateModifiedGmt: json["date_modified_gmt"]??"",
//         src: json["src"]??"",
//         name: json["name"]??"",
//         alt: json["alt"]??"",
//         position: json["position"]??0,
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "date_created": dateCreated,
//         "date_created_gmt": dateCreatedGmt,
//         "date_modified": dateModified,
//         "date_modified_gmt": dateModifiedGmt,
//         "src": src,
//         "name": name,
//         "alt": alt,
//         "position": position,
//     };
// }

// class Links {
//     List<Collection> self;
//     List<Collection> collection;

//     Links({
//         required this.self,
//         required this.collection,
//     });

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))??[]),
//         collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))??[]),
//     );

//     Map<String, dynamic> toJson() => {
//         "self": List<dynamic>.from(self.map((x) => x.toJson())),
//         "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
//     };
// }

// class Collection {
//     String href;

//     Collection({
//         required this.href,
//     });

//     factory Collection.fromJson(Map<String, dynamic> json) => Collection(
//         href: json["href"] ?? "",
//     );

//     Map<String, dynamic> toJson() => {
//         "href": href,
//     };
// }




// class Store {
//     int id;
//     String name;
//     String url;
//     String avatar;
//     Address address;

//     Store({
//         required this.id,
//         required this.name,
//         required this.url,
//         required this.avatar,
//         required this.address,
//     });

//     factory Store.fromJson(Map<String, dynamic> json) => Store(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? "",
//         url: json["url"] ?? "",
//         avatar: json["avatar"] ?? "",
//         address: Address.fromJson(json["address"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "url": url,
//         "avatar": avatar,
//         "address": address.toJson(),
//     };
// }

// class Address {
//     String street1;
//     String street2;
//     String city;
//     String zip;
//     String country;
//     String state;

//     Address({
//         required this.street1,
//         required this.street2,
//         required this.city,
//         required this.zip,
//         required this.country,
//         required this.state,
//     });

//     factory Address.fromJson(Map<String, dynamic> json) => Address(
//         street1: json["street_1"] ?? "",
//         street2: json["street_2"] ?? "",
//         city: json["city"] ?? "",
//         zip: json["zip"] ?? "",
//         country: json["country"] ?? "",
//         state: json["state"] ?? "",
//     );

//     Map<String, dynamic> toJson() => {
//         "street_1": street1,
//         "street_2": street2,
//         "city": city,
//         "zip": zip,
//         "country": country,
//         "state": state,
//     };
// }

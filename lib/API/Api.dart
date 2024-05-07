
const API_URL = "https://lavapino.tirewastemanagement.com/";
const API_IMAGE_URL = "https://lavapiano.com/La-Vapiano/images/uploads/";
class ApiAction{
  static const LOGIN = "login";
  static const REGISTER = "register";
  static const FORGOT_PASSWORD = "forget-password";
  static const ADD_TO_CART = "add-to-cart";
  static const PLACE_ORDER = "place-order";
  static const GET_CATEGORY = "get-categories";
  static const GET_SUB_CATEGORY = "get-subcategories";
  static const GET_HISTORY = "get-history";
  static const GET_CART = "get-cart";
  static const GET_FOOD_LIST = "get-food-list";
}

class ApiKey{

  static const key_action = "action";
  static const key_mobile = "mobile";
  static const key_password = "password";
  static const key_message = "message";
  static const key_status = "status";
  static const key_username = "username";
  static const key_email = "email";
  static const key_address = "address";
  static const key_id = "id";
  static const key_en = "en";
  static const key_ku = "ku";
  static const key_ar = "ar";
  static const key_image = "image";
  static const key_user = "user";
  static const key_date = "date";
  static const key_branch = "branch";
  static const key_deleted = "deleted";
  static const key_items_id = "item_id";
  static const key_note = "note";
  static const key_orderQty = "order_qty";
}


class CategoryKey{
  static const key_id = "id";
  static const key_language_name = "languageName";
  static const key_image = "image";
  static const key_user = "user";
  static const key_date = "date";
  static const key_branch = "branch";
  static const key_deleted = "deleted";
}

class PrefKey{
  static const key_languageCode = "languageCode";
  static const userLoginData = "userData";
}
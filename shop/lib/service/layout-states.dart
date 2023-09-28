abstract class layoutstates {}

class changebottomindex extends layoutstates {}

class laoytinitialstates extends layoutstates {}

class laoytsuccessstates extends layoutstates {}

class laoytloadingstates extends layoutstates {}

class bannersuccess extends layoutstates {}

class bannerfailed extends layoutstates {}

class LayoutCountUpdated extends layoutstates {}

class CartState extends layoutstates {}

class cartItemQuantityUpdated extends layoutstates {}

class addtocartsuccess extends layoutstates {}

class addtocartfailed extends layoutstates {}

class bannerloading extends layoutstates {}

class cartfailed extends layoutstates {}

class cartloading extends layoutstates {}

class cartsucess extends layoutstates {}

class favsucessfilter extends layoutstates {}

class add_or_remove_fav_success extends layoutstates {}

class add_or_remove_fav_failed extends layoutstates {}

class favfailed extends layoutstates {}

class favloading extends layoutstates {}

class favsucesss extends layoutstates {}

class filterproductsuccess extends layoutstates {}

class productssuccess extends layoutstates {}

class productsfailed extends layoutstates {}

class productsloading extends layoutstates {}

class catesuccess extends layoutstates {}

class catefailed extends layoutstates {}

class cateloading extends layoutstates {}

class laoytfailedlstates extends layoutstates {
  String error;
  laoytfailedlstates({required this.error});
}

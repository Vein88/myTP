<?PHP

class User extends MY_Controller {

	public function index() {
		$this->mysmarty->display('blog/user.tpl');
	}
}
?>

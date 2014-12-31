<?PHP

class MY_Controller extends CI_Controller {
	
	function __construct() {
		try {
			parent::__construct();
			$this->CI = & get_instance();		
		} catch (MY_Exception $e) {
			$e->console();
		}
	}
}
?>

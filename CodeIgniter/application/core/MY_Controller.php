<?PHP

class MY_Controller extends CI_Controller {
	
	function __construct() {
		try {
			parent::__construct();
			$this->CI = & get_instance();		
		} catch (Exception $e) {
			$str = $e->getCode() . ':' . $e->getMessage();
			exit;
		}
	}
}
?>

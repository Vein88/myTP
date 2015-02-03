<?PHP

class MY_Controller extends CI_Controller {
	protected $tplData = array();
	function __construct() {
		try {
            $this->tplData['baseUrl'] = 'http://localhost:8000/';
			parent::__construct();
			$this->CI = & get_instance();		
		} catch (MY_Exception $e) {
			$e->console();
		}
	}
}
?>

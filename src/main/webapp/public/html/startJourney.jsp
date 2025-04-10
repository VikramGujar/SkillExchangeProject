<%@ page import="com.nit.javabean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Start Journey</title>
		
		<!-- Bootstrap Library -->
	    <!-- Bootstrap Icons -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	    
	    <!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    
	    <!-- User Defined css file -->
		<link rel="stylesheet" href="../../src/style/startJourney.css" />
	  
    	<!-- Bootstrap JS -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    		
	    <!-- React Library -->
	    <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
	    <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
	
	    <!-- Compiler Library -->
	    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
	
	</head>
	<body>
	
    	<noscript>Please enable JavaScript on your browser.</noscript>
    	<!-- Div with id root [Main Div] -->
    	<div id="root"></div>
    	
    	<!------------------------------------------------------------------------------------------------->
    	<!------------------------------------------------------------------------------------------------->
    	
	<!-- React Application Library -->
    <script type="text/babel">
        
	/* Navbar section start */
    function Navbar() {
    return (
        <nav className="navbar navbar-expand-lg bg-primary p-2">
            <div className="container-fluid">
                <a className="navbar-brand text-white d-flex align-items-center" href="#">
                    <img src="../../public/assets/image/logo.png" alt="Logo" style={{ height: '50px', marginRight: '10px', width: '100px' }} />
                </a>
                <div className="d-flex">
                    <input type="text" className="form-control me-2" placeholder="Search for" />
                    <input type="text" className="form-control me-2" placeholder="Skill to search" />
                    <button className="btn btn-danger">Search</button>
                </div>
            <img src="../../public/assets/image/review-2.jpeg" alt="profile-pic" style={{ height: '50px', width: '50px', borderRadius: '50%', backgroundColor: 'grey', objectFit: 'cover', margin: '0px' }} />
            </div>
        </nav>
    	);
	}/* Navbar section end */
	
	/* UserCard section start */
	function UserCard({ firstName, lastName, skills, whatsapp, email }) {
    return (
        <div className="card text-center p-3 m-2 shadow-sm" style={{ width: '250px' }}>
			
            <img src="../../public/assets/image/review-1.jpeg" alt="profile-pic" style={{ height: '50px', width: '50px', borderRadius: '50%', backgroundColor: 'grey', objectFit: 'cover', margin: 'auto' }} />
            <h5 className="mt-2">{firstName} {lastName}</h5>
            <p className="text-muted">{skills.join(", ")}</p>
            <div className="d-flex justify-content-around mt-2">
                <a href={`https://wa.me/${whatsapp}`} className="btn btn-success" target="_blank">WhatsApp</a>
                <a href={`mailto:${email}`} className="btn btn-primary">G-Mail</a>
            </div>
        </div>
    );
	} /* UserCard section end */
	
	/* UserGrid section start */
	function UserGrid() {
    const users = [
        { firstName: "John", lastName: "Doe", skills: ["Java", "HTML", "CSS", "JavaScript", "React", "Spring"], whatsapp: "1234567890", email: "john.doe@example.com" },
        { firstName: "Jane", lastName: "Smith", skills: ["Python", "Django", "Machine Learning"], whatsapp: "9876543210", email: "jane.smith@example.com" },
        
    ];
    return (
        <div className="container mt-4">
            <div className="d-flex flex-wrap justify-content-center">
                {users.map((user, index) => (
                    <UserCard key={index} {...user} />
                ))}
            </div>
        </div>
    );
	} /* UserGrid section end */

    

        // Main div which will contain all components
        function Main(){
            return(
               if( &&  <div>
                  		<Navbar />
                  		<UserGrid />
                	   </div>	)
            )
        }

        // Render method to attach application to root div
        ReactDOM.render(<Main />, document.getElementById("root"));
    </script>
	</body>
</html>
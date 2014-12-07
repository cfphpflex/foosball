 function addNhForm() {
            document.getElementById('nh-create').style.display = "block"
            document.getElementById('nh-update').style.display = "none"
        }
        function newHireMenu() {
            newHireContainer()
            document.getElementById('row new-hire-menu').style.display = "block"

        }
        function terminationMenu() {

        }
        function newHireAddForm() {
            document.getElementById('nh-create').style.display = "block"
        }
        function newHireContainer() {
            document.getElementById('new-hire-container').style.display = "block"
            document.getElementById('termination-container').style.display = "none"
            document.getElementById('status-change-container').style.display = "none"
        }
        function terminationContainer() {
            document.getElementById('new-hire').style.display = "none"
            document.getElementById('termination').style.display = "block"
            document.getElementById('status-change-container').style.display = "none"
        }
        function isContractor() {
            if (document.getElementById("contractor").checked) {
                document.getElementById("contractor-info").style.display = "block"
            } else {
                document.getElementById("contractor-info").style.display = "none"
            }
        }
        function needsGH() {
            if (document.getElementById("gh").checked) {
                document.getElementById("gh_name_field").style.display = "block"
            } else {
                document.getElementById("gh_name_field").style.display = "none"
            }
        }
        function isRemote() {
            if (document.getElementById("remote").checked) {
                document.getElementById("international").style.display = "block"
            } else {
                document.getElementById("international").style.display = "none"
                document.getElementById('remote-info').style.display = "none"
                document.getElementById('inter-region').style.display = "none"
            }
        }
        function isInternational() {
            if (document.getElementById('inter-yes').checked) {

                document.getElementById('inter-region').style.display = "block"
                document.getElementById('remote-info').style.display = "none"
                document.getElementById('inter-no').checked = false
            } else {
                document.getElementById('inter-region').style.display = "none"
            }
        }
        function isInter() {
            if (document.getElementById('inter-no').checked) {
                document.getElementById('remote-info').style.display = "block"
                document.getElementById('inter-region').style.display = "none"
                document.getElementById('inter-yes').checked = false
            } else {
                document.getElementById('remote-info').style.display = "none"
            }
        }
        
        
        
        
        
        
        
        
        
        
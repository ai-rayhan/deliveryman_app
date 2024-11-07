  String getStatusName(int status) {
    switch (status) {
      case 1:
        return "Completed"; // Set your desired color for 'Pending'
      case 2:
        return "Pending"; // Set your desired color for 'In Progress'
      case 3:
        return 'Processing';
      case 4:
        return 'Cancelled'; // Set your desired color for 'Shipped'
      default:
        return 'null'; // Set a default color for other statuses
    }
  }
   
  String paymentMethodName(int status) {
    switch (status) {
      case 3:
        return "Cash On Delivery"; 
      case 6:
        return "Online Payment";
      default:
        return 'null'; // Set a default color for other statuses
    }
  }
   
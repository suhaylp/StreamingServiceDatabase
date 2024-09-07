/*
 * These functions below are for various webpage functionalities. 
 * Each function serves to process data on the frontend:
 *      - Before sending requests to the backend.
 *      - After receiving responses from the backend.
 * 
 * To tailor them to your specific needs,
 * adjust or expand these functions to match both your 
 *   backend endpoints 
 * and 
 *   HTML structure.
 * 
 */


// Fetches data from the review table and displays it.
async function fetchAndDisplayReviews() {
    const tableElement = document.getElementById('reviewtable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/review-table', {
        method: 'GET'
    });

    const responseData = await response.json();
    const reviewtableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    reviewtableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });

}

// Fetches data from the user table and displays it.
async function fetchAndDisplayUsers() {
    const tableElement = document.getElementById('useraccounttable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/user-account-table', {
        method: 'GET'
    });

    const responseData = await response.json();
    const UserAccountTableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    UserAccountTableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// Fetches data from the media table and displays it.
async function fetchAndDisplayMedia() {
    const tableElement = document.getElementById('mediatable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/media-table', {
        method: 'GET'
    });

    const responseData = await response.json();
    const mediatableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    mediatableContent.forEach(media => {
        const row = tableBody.insertRow();
        media.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}


// Fetches data from the director table and displays it.
async function fetchAndDisplayDirectors() {
    const tableElement = document.getElementById('directortable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/director-table', {
        method: 'GET'
    });

    const responseData = await response.json();
    const mediatableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    mediatableContent.forEach(media => {
        const row = tableBody.insertRow();
        media.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}




// // This function resets or initializes the demotable.
// async function resetDemotable() {
//     const response = await fetch("/initiate-demotable", {
//         method: 'POST'
//     });
//     const responseData = await response.json();
//
//     if (responseData.success) {
//         const messageElement = document.getElementById('resetResultMsg');
//         messageElement.textContent = "demotable initiated successfully!";
//         fetchTableData();
//     } else {
//         alert("Error initiating table!");
//     }
// }
//

// Inserts new records into the review table.
async function insertReview(event) {
    event.preventDefault();

    const reviewIDValue = document.getElementById('insertreviewID').value;
    const commentValue = document.getElementById('insertcomment').value;
    const starNumValue = document.getElementById('insertstarNum').value;
    const emailValue = document.getElementById('insertemail').value;
    const mediaIDValue = document.getElementById('insertmediaID').value;

    const response = await fetch('/insert-review', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            reviewID: reviewIDValue,
            commentText: commentValue,
            starNum: starNumValue,
            email: emailValue,
            mediaID: mediaIDValue
        })
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('insertResultMsg');

    if (responseData.success) {
        messageElement.textContent = "Data inserted successfully!";
        fetchTableData();
    } else {
        messageElement.textContent = "Error inserting data!";
    }
}

// Inserts new records into the review table.
async function insertUser(event) {
    event.preventDefault();

    const emailValue = document.getElementById('insertemail').value;
    const phoneNumValue = document.getElementById('insertphonenum').value;
    const userNameValue = document.getElementById('insertusername').value;
    const dateOfBirthValue = document.getElementById('insertdateofbirth').value;

    const response = await fetch('/insert-useraccount', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email: emailValue,
            phoneNum: phoneNumValue,
            userName: userNameValue,
            dateOfBirth: dateOfBirthValue
        })
    });
    const responseData = await response.json();
    const messageElement = document.getElementById('insertResultMsg');

    if (responseData.success) {
        messageElement.textContent = "Data inserted successfully!";
        fetchTableData();
    } else {
        messageElement.textContent = "Error inserting data!";
    }
}

//deletes a review from the review table
async function deleteReview(event) {
    event.preventDefault();

        const reviewIDValue = document.getElementById('deletereviewID').value;
        const emailValue = document.getElementById('deleteemail').value;
        const mediaIDValue = document.getElementById('deletemediaID').value;

        const response = await fetch('/delete-review', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                reviewID: reviewIDValue,
                email: emailValue,
                mediaID: mediaIDValue
            })
        });

        const responseData = await response.json();
        const messageElement = document.getElementById('deleteResultMsg');

        if (responseData.success) {
            messageElement.textContent = "Review deleted successfully!";
            fetchAndDisplayReviews();
        } else {
            messageElement.textContent = "Error deleting review!";
        }

}

 // Updates phoneNum in UserAccount
 async function updateUserPhone(event) {
     event.preventDefault();

     const oldPhoneValue = document.getElementById('updateoldphone').value;
     const newPhoneValue = document.getElementById('updatenewphone').value;

     const response = await fetch('/update-user-phone', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'
         },
         body: JSON.stringify({
             oldPhone: oldPhoneValue,
             newPhone: newPhoneValue
         })
     });

     const responseData = await response.json();
     const messageElement = document.getElementById('updatePhoneResultMsg');

     if (responseData.success) {
         messageElement.textContent = "Phone updated successfully!";
         fetchTableData();
     } else {
         messageElement.textContent = "Error updating Phone!";
     }
 }

 // Updates userName in UserAccount
  async function updateUserName(event) {
      event.preventDefault();

      const oldNameValue = document.getElementById('update2oldname').value;
      const newNameValue = document.getElementById('update2newname').value;

      const response = await fetch('/update-user-name', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify({
              oldName: oldNameValue,
              newName: newNameValue
          })
      });

      const responseData = await response.json();
      const messageElement = document.getElementById('updateNameResultMsg');

      if (responseData.success) {
          messageElement.textContent = "Name updated successfully!";
          fetchTableData();
      } else {
          messageElement.textContent = "Error updating Name!";
      }
  }

// Fetches data from the review table and selects reviews.
async function reviewSelection() {
    const tableElement = document.getElementById('reviewtable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/select-review', {
        method: 'GET'
    });

    const responseData = await response.json();
    const UserAccountTableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    UserAccountTableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}
// Fetches data from the review table and projects by comment and star number.
async function showOnlyStarsComments() {
    const tableElement = document.getElementById('reviewtable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/project-review', {
        method: 'GET'
    });

    const responseData = await response.json();
    const UserAccountTableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    UserAccountTableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// Fetches data from the media table for > 5 reviews.
async function over5ReviewsMedia() {
    const tableElement = document.getElementById('mediatable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/find-reviewed-media', {
        method: 'GET'
    });

    const responseData = await response.json();
    const UserAccountTableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    UserAccountTableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// Finds a director that has produced media of all genres.
async function divisionFunction() {
    const tableElement = document.getElementById('directortable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/find-director-genre', {
        method: 'GET'
    });

    const responseData = await response.json();
    const DirectorTableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    DirectorTableContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// Finds media produced by a mediaProducer.
async function joinMediaMediaProducer() {
    event.preventDefault();

    const tableElement = document.getElementById('mediatable');
    const tableBody = tableElement.querySelector('tbody');

    const prodval = document.getElementById('producerid').value;

    const response = await fetch('/find-media-producer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            producerID: prodval
        })
    });

    const responseData = await response.json();
    const mediaProducerContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    mediaProducerContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}


// Finds media under a specific genre.
async function aggregateMediaGenre() {
    event.preventDefault();

    const tableElement = document.getElementById('mediatable');
    const tableBody = tableElement.querySelector('tbody');

    const genrevalue = document.getElementById('genrename').value;

    const response = await fetch('/find-media-genre', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            genreName: genrevalue
        })
    });

    const responseData = await response.json();
    const mediaGenreContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    mediaGenreContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// Finds media under a specific genre and mediaProducer.
async function aggregateMediaGenreProducer() {
    event.preventDefault();

    const tableElement = document.getElementById('mediatable');
    const tableBody = tableElement.querySelector('tbody');

    const genrevalue = document.getElementById('genrename1').value;
    const producervalue = document.getElementById('producerid1').value;

    const response = await fetch('/find-media-genre-producer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            genreName: genrevalue,
            producerID: producervalue
        })
    });

    const responseData = await response.json();
    const mediaGenreProducerContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    mediaGenreProducerContent.forEach(review => {
        const row = tableBody.insertRow();
        review.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}


// ---------------------------------------------------------------
// Initializes the webpage functionalities.
// Add or remove event listeners based on the desired functionalities.
// window.onload = function() {
//     checkDbConnection();
//     fetchTableData();
//     populateProducers();
//     //document.getElementById("resetReviewtable").addEventListener("click", resetReviewtable);
//     document.getElementById("insertReviewtable").addEventListener("submit", insertReview);
//     document.getElementById("deleteReview").addEventListener("submit", deleteReview);
//     document.getElementById("reviewSelection").addEventListener("click", reviewSelection);
//
//     document.getElementById("updateNameUserTable").addEventListener("submit", updateUserName);
//     document.getElementById("updatePhoneUserTable").addEventListener("submit", updateUserPhone);
//
//     document.getElementById("showOnlyStarsComments").addEventListener("click", showOnlyStarsComments);
//     document.getElementById("over5ReviewsMedia").addEventListener("click", over5ReviewsMedia);
//     document.getElementById("division").addEventListener("click", divisionFunction);
//     document.getElementById("joinMediaMediaProducer").addEventListener("click", joinMediaMediaProducer);
//     document.getElementById("aggregateMediaGenre").addEventListener("click", aggregateMediaGenre);
//     document.getElementById("aggregateMediaGenreProducer").addEventListener("click", aggregateMediaGenreProducer);
//
//     // document.getElementById("countDemotable").addEventListener("click", countDemotable);
// };

//need to add event listenters for all actions
//document.getElementByID("updateUsername").addEventListener("click",updateUsername);

// General function to refresh the displayed table data. 
// You can invoke this after any table-modifying operation to keep consistency.
function fetchTableData() {
    fetchAndDisplayReviews();
    fetchAndDisplayUsers();
    fetchAndDisplayMedia();
    fetchAndDisplayDirectors();
}


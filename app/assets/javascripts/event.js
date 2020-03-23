function eventsearchFunction() {
    var input, filter, allevents, event, i;
    input = document.getElementById('eventsearch');
    filter = input.value.toUpperCase();
    allevents = document.getElementsByClassName('wrapper');
    event = document.getElementsByClassName('event');

    for(i=0 ; i< event.length; i++){
        title = event[i].getElementsByTagName('h2')[0];
        tag = event[i].getElementsByTagName('span')[0];
        adress = event[i].getElementsByClassName('adress')[0];
        city = event[i].getElementsByClassName('city')[0];
        creator = event[i].getElementsByClassName('creator')[0];
        
        if(title.innerHTML.toUpperCase().indexOf(filter) > -1 ||
        tag.innerHTML.toUpperCase().indexOf(filter) > -1 ||
        adress.innerHTML.toUpperCase().indexOf(filter) > -1 ||
        city.innerHTML.toUpperCase().indexOf(filter) > -1 ||
        creator.innerHTML.toUpperCase().indexOf(filter) > -1 ){

            event[i].style.display = "";
        }

        else{
            event[i].style.display = 'none';
        }
    }
}
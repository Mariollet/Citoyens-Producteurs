function searchFunction() {
    var input, filter, allblogs, blog, a, i;
    input = document.getElementById('blogsearch');
    filter = input.value.toUpperCase();
    allblogs = document.getElementsByClassName('wrapper');
    blog = document.getElementsByClassName('blog');

    for(i=0 ; i< blog.length; i++){
        title = blog[i].getElementsByTagName('h3')[0];
        content = blog[i].getElementsByTagName('p')[0];
        autor = blog[i].getElementsByTagName('h5')[0];
        if(title.innerHTML.toUpperCase().indexOf(filter) > -1 || content.innerHTML.toUpperCase().indexOf(filter) > -1 || autor.innerHTML.toUpperCase().indexOf(filter) > -1 ){
            blog[i].style.display = "";
        }

        else{
            blog[i].style.display = 'none';
        }
    }
}
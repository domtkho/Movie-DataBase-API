$ ->
  $('form').submit (e) ->
    e.preventDefault()
    input = $("form input[type='text']")
    name = input.val()
    input.val("")

    $.ajax
      url: "http://www.omdbapi.com/?s=#{name}"
      dataType: "json"
    .done (data) ->
      $('.result').html('')
      for movie in data.Search
        # console.log movie
        $('.result').append("<div><a class='searchResults' data-imdb='#{movie.imdbID}' href='#'>#{movie.Title}</a></div>")
      $('div.searchBox').switchClass('searchBox', 'searchBoxMid', 1500)
      $('.result').fadeIn(1500)

      $('.searchResults').click (e) ->
        e.preventDefault()
        $('.result').slideUp(1500)
        # $('div.searchBox').toggleClass('searchBoxUp').fadeIn(1500)
        $('div.searchBoxMid').switchClass('searchBoxMid', 'searchBoxUp', 1500)

        # console.log $(@).data('imdb')

        $.ajax
          url: "http://www.omdbapi.com/?i=#{$(@).data('imdb')}"
          dataType: "json"
        .done (data) ->
          $('div.title').html("<p class=\"title\">#{data.Title}</p>")
          $('div.released').html("<p class=\"released\"><strong>Released on:</strong> #{data.Released}</p>")
          $('div.director').html("<p class=\"director\"><strong>Directed by:</strong> #{data.Director}</p>")
          $('div.genre').html("<p class=\"genre\"><strong>Genre:</strong> #{data.Genre}</p>")
          $('div.runtime').html("<p class=\"runtime\"><strong>Run time:</strong> #{data.Runtime}</p>")
          $('div.IMDBRating').html("<p class=\"IMDBRating\">IMDB Rating: #{data.imdbRating}</p>")
          $('div.actors').html("<p class=\"actors\"><strong>Actors:</strong> #{data.Actors}</p>")
          $('div.plot').html("<p class=\"plot\"><strong>Synopsis:</strong> #{data.Plot}</p>")
          $('.poster').html("<img id=\"poster\" src=\"#{data.Poster}\">")
          $('#poster').fadeIn(1500)
          $('.rightCol').fadeIn(1500)








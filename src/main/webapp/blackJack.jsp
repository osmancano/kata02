<script>
    $('#sumFunForm').submit(function() { // catch the form's submit event
        $.ajax({ // create an AJAX call...
            data: $(this).serialize(), // get the form data
            type: $(this).attr('method'), // GET or POST
            url: $(this).attr('action'), // the file to call
            success: function(response) { // on success..
                $('#resultDiv').html(response); // update the DIV
            }
        });
        return false; // cancel original event to prevent form submitting
    });
</script>
<br>
<div>
    <form id="sumFunForm" class="form-horizontal" action="/blackjack" method="post">
        <h4>Sum Sometimes:</h4>
        <div class="form-group">
            <label class="control-label col-sm-3" for="dealers">Dealers:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="dealers" name="dealers" placeholder="Enter the dealers cards seperated by comma" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="players">Players:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="players" name="players" placeholder="Enter the players cards seperated by comma" required/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="submit" class="btn btn-info">Play</button>
            </div>
        </div>
    </form>
</div>
<div id="resultDiv">

</div>

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
    <form id="sumFunForm" class="form-horizontal" action="/sumFun" method="post">
        <h4>Sum Sometimes:</h4>
        <div class="form-group">
            <label class="control-label col-sm-3" for="fNum">Enter First Integer:</label>
            <div class="col-sm-9">
                <input type="number" min="0" class="form-control" id="fNum" name="fNum" placeholder="Enter First Number" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="sNum">Enter Second Integer:</label>
            <div class="col-sm-9">
                <input type="number" min="0" class="form-control" id="sNum" name="sNum" placeholder="Enter Second Number" required/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-10">
                <button type="submit" class="btn btn-info">Sum Up</button>
            </div>
        </div>
    </form>
</div>
<div id="resultDiv">

</div>

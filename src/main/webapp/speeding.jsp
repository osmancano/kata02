<script>
    $('#speedingForm').submit(function() { // catch the form's submit event
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
    <form id="speedingForm" class="form-horizontal" action="/speeding" method="post">
        <h4>Speed Check:</h4>
        <div class="form-group">
            <label class="control-label col-sm-3" for="speed">Enter Your Speed:</label>
            <div class="col-sm-9">
                <input type="number" min="0" class="form-control" id="speed" name="txtSpeed" placeholder="Enter your speed" required/>
            </div>
        </div>
        <label class="control-label col-sm-3">Is it your birth day?</label>
        <div class="col-sm-offset-3 checkbox">
            <label><input type="checkbox" name="birthDate" value="true">Yes It is</label>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-10">
                <button type="submit" class="btn btn-info">Check</button>
            </div>
        </div>
    </form>
</div>
<div id="resultDiv">

</div>

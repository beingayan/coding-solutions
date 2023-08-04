<script>
     {/* #number validation  */}
    {/* accept only numbers  start */}
  const onKeyDown=
  {(e) => {
    if (e.key === "." || (!/^[0-9\b]+$/.test(e.key) && e.key !== "Backspace")) {
      e.preventDefault();
    }
  }}
  <input type="text" onKeyDown={onkeydown} />

  {/* accept only numbers  end */}
</script>;

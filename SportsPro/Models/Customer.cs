public class Customer
{
    public int CustomerID { get; set; }
    public string Name { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string ZipCode { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }

    public string ContactDisplay()
    {
        string displayString = string.Format("{0}: {1}; {2}",
            Name.ToString(),
            Phone.ToString(),
            Email.ToString()
        );
        return displayString;
    }
}

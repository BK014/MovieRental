using Microsoft.VisualStudio.TestTools.UnitTesting;
using MovieRental;
using MovieRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieRental.Tests
{
    [TestClass()]
    public class DAOTests
    {
        [TestMethod()]
        public void GetAllCustomersTest()
        {
            DAO dao = new DAO();
            List<Customer> customers = null;
            try
            {
                customers = dao.GetAllCustomers();
            }
            catch (Exception e)
            {
                Assert.Fail(e.Message);
            }
            try
            {
                Assert.IsTrue(customers.Count > 0);
            }
            catch
            {
                Assert.Fail("List of customers could not be fetched");
            }
        }

        [TestMethod()]
        public void AddCustomerTest()
        {
            DAO dao = new DAO();
            Customer customer = new Customer
            {
                Address = "Test Address",
                FirstName = "Alan",
                LastName = "Rickman",
                Phone = "112987"
            };
            try
            {
                dao.AddCustomer(customer);
            }
            catch (Exception e)
            {
                Assert.Fail("Customer was not inserted. Message: " + e.Message);
            }
        }
    }
}
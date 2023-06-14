<%--
  Created by IntelliJ IDEA.
  User: apikmeister
  Date: 6/14/2023
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="contact-container">
    <form class="contact-form">
        <input
                type="text"
                name="name"
                placeholder="Your Name"
                required
                class="block mb-4 px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring focus:border-blue-500"
        />
        <input
                type="email"
                name="email"
                placeholder="Your Email"
                required
                class="block mb-4 px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring focus:border-blue-500"
        />
        <textarea
                name="message"
                placeholder="Your Message"
                required
                class="block mb-4 px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring focus:border-blue-500"
        ></textarea>
        <button
                type="submit"
                class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600"
        >
            Submit
        </button>
    </form>
</div>


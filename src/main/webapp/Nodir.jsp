<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-content">
            <!-- Logo -->
            <div class="logo">
                <div class="logo-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
                    </svg>
                </div>
                <span class="logo-text">BOOKSTORE</span>
            </div>

            <!-- Navigation Links -->
            <div class="nav-links">
                <a href="home.jsp" class="nav-link">HOME</a>
                <a href="library.jsp" class="nav-link">LIBRARY</a>
                <a href="categories.jsp" class="nav-link">CATEGORIES</a>

                <!-- More Dropdown -->
                <div class="dropdown" id="moreDropdown">
                    <button class="nav-link dropdown-toggle" onclick="toggleDropdown('moreMenu')">
                        MORE
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="6,9 12,15 18,9"></polyline>
                        </svg>
                    </button>
                    <div class="dropdown-menu" id="moreMenu">
                        <a href="about.jsp" class="dropdown-item">About Us</a>
                        <a href="contact.jsp" class="dropdown-item">Contact Us</a>
                        <a href="help.jsp" class="dropdown-item">Help</a>
                    </div>
                </div>
            </div>

            <!-- Right Side Icons -->
            <div class="navbar-actions">
                <!-- Search -->
                <div class="search-container">
                    <input type="text" id="searchInput" class="search-input" placeholder="Search books..." style="display: none;">
                    <button class="icon-button" id="searchButton" onclick="toggleSearch()">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                    </button>
                </div>


                <!-- User Cabinet -->
                <div class="dropdown" id="userDropdown">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <!-- User is logged in -->
                            <a href="profile.jsp" class="icon-button">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <!-- User is not logged in -->
                            <button class="icon-button" onclick="toggleDropdown('userMenu')">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" id="userMenu">
                                <a href="signin.jsp" class="dropdown-item">Sign In</a>
                                <a href="signup.jsp" class="dropdown-item">Sign Up</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Mobile menu button -->
                <button class="mobile-menu-button" onclick="toggleMobileMenu()">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <line x1="3" y1="12" x2="21" y2="12"></line>
                        <line x1="3" y1="18" x2="21" y2="18"></line>
                    </svg>
                </button>
            </div>
        </div>
    </div>
</nav>

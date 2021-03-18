-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2021 at 08:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mymech`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 'Nairobi', 1, '2021-01-13 16:15:21', '2021-01-13 16:15:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` varchar(2) NOT NULL,
  `iso3` varchar(3) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `phone_prefix` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `full_currency` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `iso3`, `country`, `currency_code`, `currency_name`, `phone_prefix`, `symbol`, `full_currency`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KE', 'KE', 'Kenya', 'KSH', 'Kenyan Shillings', '254', 'Ksh', 'Kenya/Kenyan Shilling/(KSH)-Ksh', 1, NULL, '2021-01-13 16:14:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `slug`, `name`, `subject`, `template`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'email-activation', 'Email Activation', 'Account activation - ##SITENAME##', '<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n                               <head>\r\n                                  <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\r\n                                  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0;\">\r\n                                  <meta name=\"format-detection\" content=\"telephone=no\"/>\r\n                                  <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\r\n                                  <style>\r\n                                     body { margin: 0; padding: 0; min-width: 100%; width: 100% !important; height: 100% !important;}\r\n                                     body, table, td, div, p, a { -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%; }\r\n                                     table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse !important; border-spacing: 0; }\r\n                                     img { border: 0; line-height: 100%; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; }\r\n                                     #outlook a { padding: 0; }\r\n                                     .ReadMsgBody { width: 100%; } .ExternalClass { width: 100%; }\r\n                                     .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\n                                     @media all and (min-width: 560px) {\r\n                                     .container { border-radius: 8px; -webkit-border-radius: 8px; -moz-border-radius: 8px; -khtml-border-radius: 8px;}\r\n                                     }\r\n                                     a, a:hover {\r\n                                     color: #127DB3;\r\n                                     }\r\n                                     .footer a, .footer a:hover {\r\n                                     color: #999999;\r\n                                     }\r\n                                  </style>\r\n                               </head>\r\n                               <body topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" leftmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"100%\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%; height: 100%; -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%;\r\n                                  background-color: #F0F0F0;\r\n                                  color: #000000;\"\r\n                                  bgcolor=\"#F0F0F0\"\r\n                                  text=\"#000000\">\r\n                                  <title>##SUBJECT##</title>\r\n                                  <p></p>\r\n                                  <table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%;\" class=\"background\">\r\n                                     <tbody>\r\n                                        <tr>\r\n                                           <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;\" bgcolor=\"#F0F0F0\">\r\n                                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                                 max-width: 560px;\" class=\"wrapper\">\r\n                                                 <tbody>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                          padding-top: 20px;\r\n                                                          padding-bottom: 20px;\">\r\n                                                          <a target=\"_blank\" style=\"text-decoration: none;\" href=\"##SITEURL##\"><img border=\"0\" vspace=\"0\" hspace=\"0\" src=\"##LOGO##\" width=\"100\" height=\"30\" alt=\"Logo\" title=\"Logo\" style=\"\r\n                                                             color: #000000;\r\n                                                             font-size: 10px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;\"></a>\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                 </tbody>\r\n                                              </table>\r\n                                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                                 max-width: 560px;\" class=\"container\">\r\n                                                 <tbody>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 0px; padding: 25px 6.25% 0px; width: 87.5%; font-size: 16px; line-height: 130%; color: rgb(0, 0, 0); font-family: sans-serif;\" class=\"header\">\r\n                                                          <p style=\"font-weight: bold;\">\r\n                                                          </p>\r\n                                                          <p style=\"text-align: left;\">Dear ##NAME##,</p>\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"left\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 0px; padding: 25px 6.25% 0px; width: 87.5%; font-size: 16px; line-height: 130%; color: rgb(0, 0, 0); font-family: sans-serif;\" class=\"subheader\">\r\n                                                          <p>Welcome to ##SITENAME##.  ##SITENAME## is a marketplace to sell, buy and customise source codes, scripts, themes, plugins and more powered by git.</p>\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 130%;\r\n                                                          padding-top: 25px; \r\n                                                          color: #000000;\r\n                                                          font-family: sans-serif;\" class=\"paragraph\">\r\n                                                          Please click the below link to complete your registration and to activate your account.\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                          padding-top: 25px;\r\n                                                          padding-bottom: 5px;\" class=\"button\">\r\n                                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"text-decoration: underline; max-width: 240px; min-width: 120px; border-collapse: collapse; border-spacing: 0px; padding: 0px;\">\r\n                                                             <tbody>\r\n                                                                <tr>\r\n                                                                   <td align=\"center\" valign=\"middle\" style=\"padding: 12px 8px; margin: 0; text-decoration: underline; border-collapse: collapse; border-spacing: 0; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; -khtml-border-radius: 4px;\" bgcolor=\"#094f78\">\r\n                                                                      <p>\r\n                                                                         <span style=\"color: #ffffff;\"><a href=\"##ACTIVATION_URL##\" style=\"color:#ffffff\" target=\"_blank\">Activate Account</a>\r\n                                                                         </span>\r\n                                                                      </p>\r\n                                                                   </td>\r\n                                                                </tr>\r\n                                                             </tbody>\r\n                                                          </table>\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                          padding-top: 25px;\" class=\"line\">\r\n                                                          <hr color=\"#E0E0E0\" align=\"center\" width=\"100%\" size=\"1\" noshade=\"\" style=\"margin: 0; padding: 0;\">\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%;\r\n                                                          padding-top: 20px;\r\n                                                          padding-bottom: 25px;\r\n                                                          color: #000000;\r\n                                                          font-family: sans-serif;\" class=\"paragraph\">\r\n                                                          <p>\r\n                                                             Have a question? <a href=\"mailto:test@test.com\" target=\"_blank\">test@test.com</a>\r\n                                                          </p>\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                 </tbody>\r\n                                              </table>\r\n                                              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                                 max-width: 560px;\" class=\"wrapper\">\r\n                                                 <tbody>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                          padding-top: 25px;\" class=\"social-icons\">\r\n                                                       </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 13px; font-weight: 400; line-height: 150%;\r\n                                                          padding-top: 20px;\r\n                                                          padding-bottom: 20px;\r\n                                                          color: #999999;\r\n                                                          font-family: sans-serif;\" class=\"footer\">\r\n                                                          copyrights © ##SITENAME##.                        \r\n                                                       </td>\r\n                                                    </tr>\r\n                                                 </tbody>\r\n                                              </table>\r\n                                           </td>\r\n                                        </tr>\r\n                                     </tbody>\r\n                                  </table>\r\n                               </body>\r\n                            </html>', '##ACTIVATION_URL##, ##SITENAME##, ##NAME##, ##SUBJECT##, ##SITEURL##, ##LOGO##', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(2, 'reset-password-email', 'Reset Password Email', 'Reset Password - ##SITENAME##', '<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n                           <head>\r\n                              <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\r\n                              <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0;\">\r\n                              <meta name=\"format-detection\" content=\"telephone=no\"/>\r\n                              <style>\r\n                                 body { margin: 0; padding: 0; min-width: 100%; width: 100% !important; height: 100% !important;}\r\n                                 body, table, td, div, p, a { -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%; }\r\n                                 table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse !important; border-spacing: 0; }\r\n                                 img { border: 0; line-height: 100%; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; }\r\n                                 #outlook a { padding: 0; }\r\n                                 .ReadMsgBody { width: 100%; } .ExternalClass { width: 100%; }\r\n                                 .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\n                                 @media all and (min-width: 560px) {\r\n                                 .container { border-radius: 8px; -webkit-border-radius: 8px; -moz-border-radius: 8px; -khtml-border-radius: 8px;}\r\n                                 }\r\n                                 a, a:hover {\r\n                                 color: #127DB3;\r\n                                 }\r\n                                 .footer a, .footer a:hover {\r\n                                 color: #999999;\r\n                                 }\r\n                              </style>\r\n                              <title>##SUBJECT##</title>\r\n                           </head>\r\n                           <body topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" leftmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"100%\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%; height: 100%; -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%;\r\n                              background-color: #F0F0F0;\r\n                              color: #000000;\"\r\n                              bgcolor=\"#F0F0F0\"\r\n                              text=\"#000000\">\r\n                              <table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%;\" class=\"background\">\r\n                                 <tbody>\r\n                                    <tr>\r\n                                       <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;\" bgcolor=\"#F0F0F0\">\r\n                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                             max-width: 560px;\" class=\"wrapper\">\r\n                                             <tbody>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                      padding-top: 20px;\r\n                                                      padding-bottom: 20px;\">\r\n                                                      <a target=\"_blank\" style=\"text-decoration: none;\" href=\"##SITEURL##\"><img border=\"0\" vspace=\"0\" hspace=\"0\" src=\"##LOGO##\" width=\"100\" height=\"30\" alt=\"Logo\" title=\"Logo\" style=\"\r\n                                                         color: #000000;\r\n                                                         font-size: 10px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;\"></a>\r\n                                                   </td>\r\n                                                </tr>\r\n                                             </tbody>\r\n                                          </table>\r\n                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                             max-width: 560px;\" class=\"container\">\r\n                                             <tbody>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0px; margin: 0px; padding: 25px 6.25% 0px; width: 87.5%; font-size: 16px; line-height: 130%; color: rgb(0, 0, 0); font-family: sans-serif;\" class=\"header\">\r\n                                                      <p style=\"font-weight: bold;\">\r\n                                                      </p>\r\n                                                      <p style=\"text-align: left;\">Dear ##NAME##,</p>\r\n                                                   </td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-bottom: 3px; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 18px; font-weight: 300; line-height: 150%;\r\n                                                      padding-top: 5px;\r\n                                                      color: #000000;\r\n                                                      font-family: sans-serif;\" class=\"subheader\">\r\n                                                      <p style=\"text-align: left;\">You are receiving this email because we received a password reset request for your account.&nbsp;</p>\r\n                                                   </td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                      padding-top: 25px;\r\n                                                      padding-bottom: 5px;\" class=\"button\">\r\n                                                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"text-decoration: underline; max-width: 240px; min-width: 120px; border-collapse: collapse; border-spacing: 0px; padding: 0px;\">\r\n                                                         <tbody>\r\n                                                            <tr>\r\n                                                               <td align=\"center\" valign=\"middle\" style=\"padding: 12px 8px; margin: 0; text-decoration: underline; border-collapse: collapse; border-spacing: 0; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; -khtml-border-radius: 4px;\" bgcolor=\"#094f78\">\r\n                                                                  <p>\r\n                                                                     <span style=\"color: #ffffff;\"><a href=\"##RESET_URL##\" style=\"color:#ffffff\" target=\"_blank\">Reset Password</a>\r\n                                                                     </span>\r\n                                                                  </p>\r\n                                                               </td>\r\n                                                            </tr>\r\n                                                         </tbody>\r\n                                                      </table>\r\n                                                   </td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                      padding-top: 25px;\" class=\"line\">If you did not request a password reset, no further action is required.<br></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                      padding-top: 25px;\" class=\"line\">\r\n                                                      <hr color=\"#E0E0E0\" align=\"center\" width=\"100%\" size=\"1\" noshade=\"\" style=\"margin: 0; padding: 0;\">\r\n                                                   </td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%;\r\n                                                      padding-top: 20px;\r\n                                                      padding-bottom: 25px;\r\n                                                      color: #000000;\r\n                                                      font-family: sans-serif;\" class=\"paragraph\">\r\n                                                      <p>\r\n                                                         Have a&nbsp;question? <a href=\"mailto:test@test.com\" target=\"_blank\">test@test.com</a>\r\n                                                      </p>\r\n                                                   </td>\r\n                                                </tr>\r\n                                             </tbody>\r\n                                          </table>\r\n                                          <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\r\n                                             max-width: 560px;\" class=\"wrapper\">\r\n                                             <tbody>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\r\n                                                      padding-top: 25px;\" class=\"social-icons\">\r\n                                                   </td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                   <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 13px; font-weight: 400; line-height: 150%;\r\n                                                      padding-top: 20px;\r\n                                                      padding-bottom: 20px;\r\n                                                      color: #999999;\r\n                                                      font-family: sans-serif;\" class=\"footer\">\r\n                                                      copyrights © ##SITENAME##.                        \r\n                                                   </td>\r\n                                                </tr>\r\n                                             </tbody>\r\n                                          </table>\r\n                                       </td>\r\n                                    </tr>\r\n                                 </tbody>\r\n                              </table>\r\n                           </body>\r\n                        </html>', '##RESET_URL##, ##SITENAME##, ##NAME##, ##SUBJECT##, ##SITEURL##, ##LOGO##', '2021-01-13 15:58:10', '2021-01-13 15:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_11_000000_create_user_types_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_12_04_115959_create_translations_table', 1),
(5, '2018_12_05_083012_create_cache_table', 1),
(6, '2018_12_06_085021_create_setting_categories_table', 1),
(7, '2018_12_06_085044_create_settings_table', 1),
(8, '2018_12_18_091213_create_sessions_table', 1),
(9, '2018_12_19_102200_create_user_logins_table', 1),
(10, '2018_12_19_183111_create_email_templates_table', 1),
(11, '2018_12_21_074434_create_user_accounts_table', 1),
(12, '2018_12_21_100615_create_user_profiles_table', 1),
(13, '2018_12_21_101709_create_attachments_table', 1),
(14, '2018_12_22_075849_create_countries_table', 1),
(15, '2018_12_22_090543_create_cities_table', 1),
(16, '2018_12_23_134730_create_service_categories_table', 1),
(17, '2018_12_23_134824_create_service_sub_categories_table', 1),
(18, '2018_12_25_091423_create_sms_templates_table', 1),
(19, '2018_12_25_173748_create_user_professions_table', 1),
(20, '2018_12_25_174140_create_user_cities_table', 1),
(21, '2018_12_25_180813_create_service_providers_table', 1),
(22, '2018_12_25_181013_create_service_packages_table', 1),
(23, '2018_12_29_094507_create_user_addresses_table', 1),
(24, '2018_12_30_071408_create_order_addresses_table', 1),
(25, '2018_12_30_071409_create_orders_table', 1),
(26, '2018_12_30_085336_create_payment_logs_table', 1),
(27, '2018_12_31_124211_create_withdrawal_requests_table', 1),
(28, '2019_01_02_070148_create_service_package_reviews', 1),
(29, '2019_01_02_090054_create_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_package_id` bigint(20) UNSIGNED NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `reference_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `flat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Terms and Conditions', 'terms-and-conditions', '<h4>Terms and Conditions</h4>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `response` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `inclusion` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclusion` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conditions` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `is_allow_appointment` tinyint(1) NOT NULL DEFAULT 0,
  `is_address_required` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `service_sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_package_reviews`
--

CREATE TABLE `service_package_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_package_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `about` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_sub_categories`
--

CREATE TABLE `service_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inputs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('text','select','radio','textarea','upload','database') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_category_id`, `name`, `code`, `trans_key`, `inputs`, `help`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Site Name', 'settings.site_name', 'name', NULL, NULL, 'MYMECHANIC', 'text', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(2, 1, 'Logo', 'settings.logo', 'logo', NULL, 'Your logo must be 200x40 image format', '', 'upload', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(3, 1, 'Website Default Language', 'settings.default_language', 'default_language', 'table:translations,code|name', NULL, 'en', 'database', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(4, 1, 'Admin Dashboard Default Language', 'settings.admin_default_language', 'admin_default_language', 'table:translations,code|name', NULL, 'en', 'database', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(5, 1, 'Website Default Currency', 'settings.site_currency', 'site_currency', 'table:countries,id|full_currency', NULL, 'Ksh', 'database', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(6, 1, 'Website Default Country', 'settings.site_country', 'default_country', 'table:countries,id|country', NULL, '1', 'database', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(7, 1, 'Website Default City', 'settings.default_city', 'default_city', 'table:cities,id|name', NULL, '2', 'database', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(8, 1, 'Site Commission', 'settings.website_commission', 'website_commission', NULL, NULL, '10', 'text', '2021-01-13 15:58:10', '2021-01-13 16:16:27'),
(9, 2, 'Email Verification', 'settings.email_verification', 'email_verification', 'Yes,No', NULL, 'Yes', 'select', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(10, 2, 'Enable Facebook Login', 'settings.facebook_login', 'enable_facebook_login', 'Yes,No', NULL, 'No', 'select', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(11, 2, 'Facebook App ID', 'settings.facebook_app_id', 'facebook_app_id', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(12, 2, 'Facebook App Secret', 'settings.facebook_app_secret', 'facebook_app_secret', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(13, 1, 'Favicon', 'settings.favicon_url', 'favicon_url', NULL, 'Favicon should be png image with 16x16.', '', 'upload', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(14, 3, 'SMTP Host', 'settings.smtp_host_url', 'smtp_host_url', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(15, 3, 'SMTP Port', 'settings.smtp_port_number', 'smtp_port_number', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(16, 3, 'SMTP Username', 'settings.smtp_username', 'smtp_username', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(17, 3, 'SMTP Password', 'settings.smtp_password', 'smtp_password', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(18, 3, 'SMTP Encryption', 'settings.smtp_encryption', 'smtp_encryption', NULL, NULL, 'tls', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(19, 3, 'Mail From Address', 'settings.mail_from_address', 'mail_from_address', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(20, 3, 'Mail From Name', 'settings.mail_from_name', 'mail_from_name', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(21, 4, 'Twilio Account Sid', 'settings.twilio_account_sid', 'twilio_account_sid', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(22, 4, 'Twilio Auth Token', 'settings.twilio_auth_token', 'twilio_auth_token', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(23, 4, 'Twilio From Number/Short Code', 'settings.twilio_from', 'twilio_from', NULL, NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(24, 5, 'Paypal mode', 'settings.paypal_mode', 'paypal_mode', 'Sandbox,Live', NULL, 'Sandbox', 'select', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(25, 5, 'Paypal Client ID', 'settings.paypal_client_id', 'paypal_client_id', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(26, 5, 'Paypal Client Secret', 'settings.paypal_client_secret', 'paypal_client_secret', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(27, 5, 'Paypal Transaction Fee (Percentage)', 'settings.paypal_trans_fee_percentage', 'paypal_trans_fee_percentage', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(28, 5, 'Paypal Transaction Flat Fee', 'settings.paypal_trans_fee_flat', 'paypal_trans_fee_flat', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(29, 6, 'Stripe Pub Key', 'settings.stripe_pub_key', 'stripe_pub_key', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(30, 6, 'Stripe Secret Key', 'settings.stripe_secret_key', 'stripe_secret_key', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(31, 6, 'Stripe Transaction Fee (Percentage)', 'settings.stripe_trans_fee_percentage', 'stripe_trans_fee_percentage', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(32, 6, 'Stripe Transaction Flat Fee', 'settings.stripe_trans_fee_flat', 'stripe_trans_fee_flat', '', NULL, '', 'text', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(33, 7, 'Meta Description', 'settings.meta_description', 'meta_description', '', NULL, '', 'textarea', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(34, 7, 'Meta Keywords', 'settings.meta_keywords', 'meta_keywords', '', NULL, '', 'textarea', '2021-01-13 15:58:10', '2021-01-13 15:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `setting_categories`
--

CREATE TABLE `setting_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_categories`
--

INSERT INTO `setting_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'General', 'general', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(2, 'Register and Login', 'register-and-login', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(3, 'Mail SMTP Settings', 'mail-smtp-settings', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(4, 'Twilio SMS Settings', 'twilio-sms-settings', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(5, 'Paypal Settings', 'paypal-settings', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(6, 'Stripe Settings', 'stripe-settings', '2021-01-13 15:58:10', '2021-01-13 15:58:10'),
(7, 'SEO Settings', 'seo-settings', '2021-01-13 15:58:10', '2021-01-13 15:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `slug`, `name`, `template`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'otp-verification', 'OTP verification', 'Your ##SITENAME## verification code is: ##OTP##', '##SITENAME##, ##OTP##', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `name`, `code`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_code` int(11) DEFAULT NULL,
  `alt_mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification_date` datetime DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_mobile_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `available_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_earnings` decimal(10,2) NOT NULL DEFAULT 0.00,
  `site_commissions` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rating` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `otp_code`, `alt_mobile_number`, `email_verification_token`, `otp_verification_token`, `email_verification_date`, `user_type_id`, `ip`, `user_agent`, `is_email_verified`, `is_mobile_verified`, `is_active`, `is_blocked`, `available_balance`, `total_earnings`, `site_commissions`, `rating`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '7503907302', '$2y$10$uVaBP32ZMAHdhSZ7M9aYqeMXoPfMQ8uxlKulFCfHQ/BcdhfoO04OK', NULL, NULL, '39d7f963365cbf34de2791c4c18fd4c3', NULL, '2021-01-13 19:01:44', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 1, 1, 1, 0, '0.00', '0.00', '0.00', 0, 'qTcObjs0IZ8NJSzMdOqTIZDR2UKsjd4sw98oxkYgHqrPqnBFI5tVNvRiIvWj', '2021-01-13 16:01:44', '2021-01-13 16:01:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `flat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_cities`
--

CREATE TABLE `user_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_professions`
--

CREATE TABLE `user_professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gender` enum('M','F','O') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `type`, `is_active`, `is_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User', 1, 0, NULL, NULL, NULL),
(2, 'Admin', 1, 1, NULL, NULL, NULL),
(3, 'Professional', 1, 0, NULL, NULL, NULL),
(4, 'Service Provider', 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `paypal_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_deleted_at_index` (`deleted_at`),
  ADD KEY `attachments_created_at_index` (`created_at`),
  ADD KEY `attachments_type_index` (`type`),
  ADD KEY `attachments_foreign_id_index` (`foreign_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_deleted_at_index` (`deleted_at`),
  ADD KEY `cities_created_at_index` (`created_at`),
  ADD KEY `cities_is_active_index` (`is_active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_deleted_at_index` (`deleted_at`),
  ADD KEY `countries_created_at_index` (`created_at`),
  ADD KEY `countries_iso_index` (`iso`),
  ADD KEY `countries_country_index` (`country`),
  ADD KEY `countries_is_active_index` (`is_active`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_created_at_index` (`created_at`),
  ADD KEY `email_templates_slug_index` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_order_address_id_foreign` (`order_address_id`),
  ADD KEY `orders_service_package_id_foreign` (`service_package_id`),
  ADD KEY `orders_created_at_index` (`created_at`),
  ADD KEY `orders_is_paid_index` (`is_paid`),
  ADD KEY `orders_is_cancelled_index` (`is_cancelled`),
  ADD KEY `orders_is_accepted_index` (`is_accepted`),
  ADD KEY `orders_is_completed_index` (`is_completed`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_user_id_foreign` (`user_id`),
  ADD KEY `order_addresses_city_id_foreign` (`city_id`),
  ADD KEY `order_addresses_country_id_foreign` (`country_id`),
  ADD KEY `order_addresses_created_at_index` (`created_at`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_created_at_index` (`created_at`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_logs_order_id_foreign` (`order_id`),
  ADD KEY `payment_logs_created_at_index` (`created_at`),
  ADD KEY `payment_logs_payment_method_index` (`payment_method`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_categories_deleted_at_index` (`deleted_at`),
  ADD KEY `service_categories_created_at_index` (`created_at`),
  ADD KEY `service_categories_slug_index` (`slug`),
  ADD KEY `service_categories_is_active_index` (`is_active`);

--
-- Indexes for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_packages_user_id_foreign` (`user_id`),
  ADD KEY `service_packages_city_id_foreign` (`city_id`),
  ADD KEY `service_packages_service_sub_category_id_foreign` (`service_sub_category_id`),
  ADD KEY `service_packages_created_at_index` (`created_at`),
  ADD KEY `service_packages_is_active_index` (`is_active`),
  ADD KEY `service_packages_is_approved_index` (`is_approved`),
  ADD KEY `service_packages_is_allow_appointment_index` (`is_allow_appointment`),
  ADD KEY `service_packages_is_address_required_index` (`is_address_required`),
  ADD KEY `service_packages_slug_index` (`slug`);

--
-- Indexes for table `service_package_reviews`
--
ALTER TABLE `service_package_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_package_reviews_user_id_foreign` (`user_id`),
  ADD KEY `service_package_reviews_service_package_id_foreign` (`service_package_id`),
  ADD KEY `service_package_reviews_created_at_index` (`created_at`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_providers_user_id_foreign` (`user_id`),
  ADD KEY `service_providers_created_at_index` (`created_at`);

--
-- Indexes for table `service_sub_categories`
--
ALTER TABLE `service_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_sub_categories_service_category_id_foreign` (`service_category_id`),
  ADD KEY `service_sub_categories_deleted_at_index` (`deleted_at`),
  ADD KEY `service_sub_categories_created_at_index` (`created_at`),
  ADD KEY `service_sub_categories_name_index` (`name`),
  ADD KEY `service_sub_categories_slug_index` (`slug`),
  ADD KEY `service_sub_categories_is_active_index` (`is_active`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`),
  ADD KEY `sessions_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_setting_category_id_foreign` (`setting_category_id`),
  ADD KEY `settings_trans_key_index` (`trans_key`);

--
-- Indexes for table `setting_categories`
--
ALTER TABLE `setting_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_categories_slug_index` (`slug`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_templates_created_at_index` (`created_at`),
  ADD KEY `sms_templates_slug_index` (`slug`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_created_at_index` (`created_at`),
  ADD KEY `translations_is_active_index` (`is_active`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`),
  ADD KEY `users_created_at_index` (`created_at`),
  ADD KEY `users_deleted_at_index` (`deleted_at`),
  ADD KEY `users_email_verification_token_index` (`email_verification_token`),
  ADD KEY `users_otp_verification_token_index` (`otp_verification_token`),
  ADD KEY `users_is_email_verified_index` (`is_email_verified`),
  ADD KEY `users_is_mobile_verified_index` (`is_mobile_verified`),
  ADD KEY `users_is_active_index` (`is_active`),
  ADD KEY `users_is_blocked_index` (`is_blocked`),
  ADD KEY `users_rating_index` (`rating`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_accounts_user_id_foreign` (`user_id`),
  ADD KEY `user_accounts_created_at_index` (`created_at`),
  ADD KEY `user_accounts_provider_index` (`provider`),
  ADD KEY `user_accounts_is_primary_index` (`is_primary`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`),
  ADD KEY `user_addresses_city_id_foreign` (`city_id`),
  ADD KEY `user_addresses_country_id_foreign` (`country_id`),
  ADD KEY `user_addresses_created_at_index` (`created_at`);

--
-- Indexes for table `user_cities`
--
ALTER TABLE `user_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cities_user_id_foreign` (`user_id`),
  ADD KEY `user_cities_city_id_foreign` (`city_id`),
  ADD KEY `user_cities_created_at_index` (`created_at`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logins_user_id_foreign` (`user_id`),
  ADD KEY `user_logins_created_at_index` (`created_at`);

--
-- Indexes for table `user_professions`
--
ALTER TABLE `user_professions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_professions_user_id_foreign` (`user_id`),
  ADD KEY `user_professions_service_sub_category_id_foreign` (`service_sub_category_id`),
  ADD KEY `user_professions_created_at_index` (`created_at`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`),
  ADD KEY `user_profiles_created_at_index` (`created_at`),
  ADD KEY `user_profiles_gender_index` (`gender`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_created_at_index` (`created_at`),
  ADD KEY `user_types_deleted_at_index` (`deleted_at`),
  ADD KEY `user_types_is_active_index` (`is_active`),
  ADD KEY `user_types_is_admin_index` (`is_admin`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_requests_user_id_foreign` (`user_id`),
  ADD KEY `withdrawal_requests_created_at_index` (`created_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_package_reviews`
--
ALTER TABLE `service_package_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_sub_categories`
--
ALTER TABLE `service_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `setting_categories`
--
ALTER TABLE `setting_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_cities`
--
ALTER TABLE `user_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_professions`
--
ALTER TABLE `user_professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_order_address_id_foreign` FOREIGN KEY (`order_address_id`) REFERENCES `order_addresses` (`id`),
  ADD CONSTRAINT `orders_service_package_id_foreign` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `order_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `order_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD CONSTRAINT `payment_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD CONSTRAINT `service_packages_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `service_packages_service_sub_category_id_foreign` FOREIGN KEY (`service_sub_category_id`) REFERENCES `service_sub_categories` (`id`),
  ADD CONSTRAINT `service_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `service_package_reviews`
--
ALTER TABLE `service_package_reviews`
  ADD CONSTRAINT `service_package_reviews_service_package_id_foreign` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`),
  ADD CONSTRAINT `service_package_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD CONSTRAINT `service_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `service_sub_categories`
--
ALTER TABLE `service_sub_categories`
  ADD CONSTRAINT `service_sub_categories_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_setting_category_id_foreign` FOREIGN KEY (`setting_category_id`) REFERENCES `setting_categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

--
-- Constraints for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD CONSTRAINT `user_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `user_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_cities`
--
ALTER TABLE `user_cities`
  ADD CONSTRAINT `user_cities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `user_cities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD CONSTRAINT `user_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_professions`
--
ALTER TABLE `user_professions`
  ADD CONSTRAINT `user_professions_service_sub_category_id_foreign` FOREIGN KEY (`service_sub_category_id`) REFERENCES `service_sub_categories` (`id`),
  ADD CONSTRAINT `user_professions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD CONSTRAINT `withdrawal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

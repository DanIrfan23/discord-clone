-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 05:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discord-tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('TEXT','AUDIO','VIDEO') NOT NULL DEFAULT 'TEXT',
  `profileId` varchar(191) NOT NULL,
  `serverId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `name`, `type`, `profileId`, `serverId`, `createdAt`, `updatedAt`) VALUES
('1e4a2e81-958a-4264-b69a-cfa48afd6a55', 'test-socket', 'TEXT', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-31 09:50:14.850', '2023-10-31 09:50:14.850'),
('2c6d0005-411e-40da-9825-e2fe2b245e49', 'general', 'TEXT', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-28 00:59:51.628', '2023-10-28 00:59:51.628'),
('55c6fe3f-5af2-4d54-ba9c-fe7ea111c623', 'test-audio', 'AUDIO', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-31 11:57:26.349', '2023-10-31 11:57:26.349'),
('6b98bd3a-4f5e-4260-94f9-65fa9ef20f39', 'test-video-1', 'VIDEO', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-28 01:40:30.895', '2023-10-30 01:04:14.527'),
('c9dc9c39-2ef0-4ea3-b2e4-9775c1f96b54', 'test-text', 'TEXT', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-30 01:05:56.570', '2023-10-30 01:06:34.238');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` varchar(191) NOT NULL,
  `memberOneId` varchar(191) NOT NULL,
  `memberTwoId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`id`, `memberOneId`, `memberTwoId`) VALUES
('d8a8d488-163c-4d08-8582-2905117436a1', 'd75d9fa7-a445-4781-9919-c94dcbd04c73', 'c50b80bf-fd5c-4c5c-9041-ec7cd95696f7');

-- --------------------------------------------------------

--
-- Table structure for table `directmessage`
--

CREATE TABLE `directmessage` (
  `id` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `fileUrl` text DEFAULT NULL,
  `memberId` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directmessage`
--

INSERT INTO `directmessage` (`id`, `content`, `fileUrl`, `memberId`, `conversationId`, `deleted`, `createdAt`, `updatedAt`) VALUES
('bfc261ba-fbee-4e23-be08-7eef023b76d9', 'this is direct message', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', 'd8a8d488-163c-4d08-8582-2905117436a1', 0, '2023-10-31 10:51:58.076', '2023-10-31 10:51:58.076'),
('e5d5cfc6-a16f-4d06-9eec-bbf5a2371300', 'This message has been deleted', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', 'd8a8d488-163c-4d08-8582-2905117436a1', 1, '2023-10-31 11:08:36.312', '2023-10-31 11:12:11.516');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` varchar(191) NOT NULL,
  `role` enum('ADMIN','MODERATOR','GUEST') NOT NULL DEFAULT 'GUEST',
  `profileId` varchar(191) NOT NULL,
  `serverId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `role`, `profileId`, `serverId`, `createdAt`, `updatedAt`) VALUES
('c50b80bf-fd5c-4c5c-9041-ec7cd95696f7', 'GUEST', '8bb47f3d-8cb3-4fcb-bceb-dfada820a1ef', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-28 01:41:40.584', '2023-10-28 01:41:40.584'),
('d75d9fa7-a445-4781-9919-c94dcbd04c73', 'ADMIN', '94590504-102c-4421-9c49-cefc9b72768c', '27647e92-f9ec-459e-b368-c8fcb1a179f1', '2023-10-28 00:59:51.628', '2023-10-28 00:59:51.628');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `fileUrl` text DEFAULT NULL,
  `memberId` varchar(191) NOT NULL,
  `channelId` varchar(191) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `content`, `fileUrl`, `memberId`, `channelId`, `deleted`, `createdAt`, `updatedAt`) VALUES
('12588516-676c-48d7-9375-56f791b68b5f', 'this is new channel right', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', 'c9dc9c39-2ef0-4ea3-b2e4-9775c1f96b54', 0, '2023-10-31 04:09:06.436', '2023-10-31 04:09:06.436'),
('1581f890-a07d-401e-90c8-6d7115d67856', 'test scroll down', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-31 10:30:01.780', '2023-10-31 10:30:01.780'),
('2c0bff56-a981-4807-8268-7717060607c3', 'hello there', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-30 06:15:29.834', '2023-10-30 06:15:29.834'),
('33448c2d-ff52-44f7-9d35-2c0a2e6d2f02', 'test again', NULL, 'c50b80bf-fd5c-4c5c-9041-ec7cd95696f7', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-31 09:10:23.851', '2023-10-31 09:10:23.851'),
('5a798d26-1ae3-4388-a985-558a9de97240', 'https://utfs.io/f/25bbe4dd-9c67-47a3-afcd-f79a95875f7e-2stgk.pdf', 'https://utfs.io/f/25bbe4dd-9c67-47a3-afcd-f79a95875f7e-2stgk.pdf', 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-30 09:16:24.080', '2023-10-30 09:16:24.080'),
('5f612320-790d-403d-b148-0ee2a39266cc', 'This message has been deleted', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 1, '2023-10-31 05:56:08.017', '2023-10-31 08:58:06.847'),
('66ca0494-3ec8-4734-b690-e443ae667bb3', 'This message has been deleted', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 1, '2023-10-31 04:08:39.036', '2023-10-31 08:57:00.876'),
('699951ab-e679-4616-ba30-87afaa416698', 'This is message from another user', NULL, 'c50b80bf-fd5c-4c5c-9041-ec7cd95696f7', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-31 09:06:24.659', '2023-10-31 09:06:24.659'),
('6ea96f8f-d6da-4727-a348-a154d7401b14', 'This is a edited message', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-30 09:38:54.298', '2023-10-31 06:25:15.641'),
('6ecc3d55-c1c5-4d7c-8492-3b7fa664b2a9', 'https://utfs.io/f/933577ec-a4b7-4ff6-bce5-d53ad1d3694e-czsxer.webp', 'https://utfs.io/f/933577ec-a4b7-4ff6-bce5-d53ad1d3694e-czsxer.webp', 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-30 09:08:34.220', '2023-10-30 09:08:34.220'),
('7051d104-b9ab-48c6-b2b5-8c15aee66db2', 'test', NULL, 'c50b80bf-fd5c-4c5c-9041-ec7cd95696f7', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-31 09:07:17.823', '2023-10-31 09:07:17.823'),
('7ced48cb-5b8e-4fad-a134-3e5e330f3929', 'test again edited', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '1e4a2e81-958a-4264-b69a-cfa48afd6a55', 0, '2023-10-31 09:55:22.722', '2023-10-31 09:55:35.554'),
('882a7c2e-1f49-44be-9456-3f405f43cbea', 'test error socket', NULL, 'c50b80bf-fd5c-4c5c-9041-ec7cd95696f7', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-31 09:26:12.004', '2023-10-31 09:26:12.004'),
('a7ead3a8-544f-4a02-9c78-c9cc4c6f7c77', 'This message has been deleted', NULL, 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '1e4a2e81-958a-4264-b69a-cfa48afd6a55', 1, '2023-10-31 09:50:40.898', '2023-10-31 09:52:05.518'),
('a8ce5f8e-a7a3-4022-a101-7f5abf9f0d94', 'https://utfs.io/f/3d86be83-1e59-432e-af58-dede5226e9e5-9e7xg6.width-800.jpg', 'https://utfs.io/f/3d86be83-1e59-432e-af58-dede5226e9e5-9e7xg6.width-800.jpg', 'd75d9fa7-a445-4781-9919-c94dcbd04c73', '2c6d0005-411e-40da-9825-e2fe2b245e49', 0, '2023-10-30 09:05:16.027', '2023-10-30 09:05:16.027');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `imageUrl` text NOT NULL,
  `email` text NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `userId`, `name`, `imageUrl`, `email`, `createdAt`, `updatedAt`) VALUES
('8bb47f3d-8cb3-4fcb-bceb-dfada820a1ef', 'user_2XL6NTUnhX9fiWEsEojOT3cYGKI', 'mdan irfan', 'https://img.clerk.com/eyJ0eXBlIjoicHJveHkiLCJzcmMiOiJodHRwczovL2ltYWdlcy5jbGVyay5kZXYvb2F1dGhfZ29vZ2xlL2ltZ18yWEw2TlhSS0JobThUMFdqcjk1U3NGRndsTTEifQ', 'm.danirfan23@gmail.com', '2023-10-27 08:39:36.361', '2023-10-27 08:39:36.361'),
('94590504-102c-4421-9c49-cefc9b72768c', 'user_2XHQSzdCQwYlkklW0rucd8dMz34', 'Muhamad Dan Irfan', 'https://img.clerk.com/eyJ0eXBlIjoicHJveHkiLCJzcmMiOiJodHRwczovL2ltYWdlcy5jbGVyay5kZXYvb2F1dGhfZ29vZ2xlL2ltZ18yWEhRU3pNZ0I2dkJ6TFFvMm1rOEdIZmZ0YjcifQ', 'mdanirfan93@gmail.com', '2023-10-27 08:31:05.823', '2023-10-27 08:31:05.823');

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `imageUrl` text NOT NULL,
  `inviteCode` varchar(191) NOT NULL,
  `profileId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`id`, `name`, `imageUrl`, `inviteCode`, `profileId`, `createdAt`, `updatedAt`) VALUES
('27647e92-f9ec-459e-b368-c8fcb1a179f1', 'Asgardian', 'https://utfs.io/f/94ba444a-c506-4091-8b1d-dca68b15e5b3-z57qrn.webp', '5558fffd-0f92-4093-be46-d9cf2cfe63d7', '94590504-102c-4421-9c49-cefc9b72768c', '2023-10-28 00:59:51.628', '2023-10-28 00:59:51.628');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('9658b6de-10ca-4bfb-904d-a6a6cfecae40', 'f2b3a66e14f057a4e34841e2bc1e3583d99b0e2dbf463e9d4b03c927fff28ede', '2023-10-27 08:26:00.617', '20231027032309_changeroletotypeonchannel', NULL, NULL, '2023-10-27 08:25:47.444', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Channel_profileId_idx` (`profileId`),
  ADD KEY `Channel_serverId_idx` (`serverId`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Conversation_memberOneId_memberTwoId_key` (`memberOneId`,`memberTwoId`),
  ADD KEY `Conversation_memberTwoId_idx` (`memberTwoId`);

--
-- Indexes for table `directmessage`
--
ALTER TABLE `directmessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DirectMessage_memberId_idx` (`memberId`),
  ADD KEY `DirectMessage_conversationId_idx` (`conversationId`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Member_profileId_idx` (`profileId`),
  ADD KEY `Member_serverId_idx` (`serverId`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Message_memberId_idx` (`memberId`),
  ADD KEY `Message_channelId_idx` (`channelId`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Profile_userId_key` (`userId`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Server_inviteCode_key` (`inviteCode`),
  ADD KEY `Server_profileId_idx` (`profileId`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
